import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../connection/connection.dart';
import '../connection/connection_registry.dart';
import '../mixins/controller_disposer_mixin.dart';
import '../profiles/active_profile_provider.dart';
import '../profiles/plex_home_service.dart';
import '../profiles/profile.dart';
import '../services/plex_auth_service.dart';
import '../services/settings_service.dart';
import '../services/storage_service.dart';
import '../providers/user_profile_provider.dart';
import '../providers/multi_server_provider.dart';
import '../i18n/strings.g.dart';
import '../utils/app_logger.dart';
import '../utils/platform_detector.dart';
import '../focus/focusable_button.dart';
import '../focus/focusable_text_field.dart';
import '../focus/key_event_utils.dart';
import '../media/media_backend.dart';
import '../utils/navigation_transitions.dart';
import '../widgets/backend_badge.dart';
import '../widgets/dialog_action_button.dart';
import 'auth/plex_pin_auth_flow.dart';
import 'main_screen.dart';
import 'profile/profile_switch_screen.dart';
import 'select_server_screen.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isAuthenticating = false;
  String? _errorMessage;
  // Reuse a one-shot service for the debug-token verify path; the Plex
  // PIN/QR flow inside [PlexPinAuthFlow] owns its own service instance.
  PlexAuthService? _verifyOnlyService;

  @override
  void initState() {
    super.initState();
    unawaited(_initVerifyService());
  }

  Future<void> _initVerifyService() async {
    final svc = await PlexAuthService.create();
    if (!mounted) {
      svc.dispose();
      return;
    }
    setState(() => _verifyOnlyService = svc);
  }

  @override
  void dispose() {
    _verifyOnlyService?.dispose();
    super.dispose();
  }

  /// Auto-select the active profile after sign-in *only* when there's a
  /// single Plex Home user — there's no choice for the user to make. With
  /// multiple Home users (the "real" Home case) we leave the active id
  /// unset so [MainScreen] forces the picker before the binder runs,
  /// avoiding a surprise PIN prompt on whichever user we'd otherwise
  /// pre-select.
  Future<void> _selectInitialProfile(
    PlexHomeService plexHome,
    ActiveProfileProvider activeProfiles,
    PlexAccountConnection accountConn,
  ) async {
    await activeProfiles.initialize();
    final profile = initialPlexHomeProfileFromCache(plexHome, accountConn);
    if (profile == null) {
      await activeProfiles.clearActiveProfile();
      return;
    }
    await activeProfiles.activate(profile);
  }

  /// Persist the new Plex account into the connection pipeline, resolve the
  /// initial active profile when possible, and navigate to the main screen.
  /// The top-level [ActiveProfileBinder] picks up the active profile id and
  /// connects servers via [MultiServerManager.refreshTokensForProfile].
  Future<void> _connectToAllServersAndNavigate(String plexToken) async {
    if (!mounted) return;

    setState(() {
      _isAuthenticating = true;
      _errorMessage = null;
    });

    final connectionRegistry = context.read<ConnectionRegistry>();
    final plexHome = context.read<PlexHomeService>();
    final svc = await PlexAuthService.create();

    try {
      final userInfo = await svc.getUserInfo(plexToken);
      final username = userInfo['username'] as String? ?? '';
      final email = userInfo['email'] as String? ?? '';
      final accountUuid = (userInfo['uuid'] as String?)?.trim() ?? '';

      final servers = await svc.fetchServers(plexToken);
      final storage = await StorageService.getInstance();

      if (servers.isEmpty) {
        await storage.clearCredentials();
        if (!mounted) return;
        setState(() {
          _isAuthenticating = false;
          _errorMessage = t.serverSelection.noServersFoundForAccount(username: username, email: email);
        });
        return;
      }

      final clientId = await storage.getOrCreateClientIdentifier();
      final accountConnection = PlexAccountConnection(
        // Key the row by the plex.tv account UUID so signing into a second
        // Plex account on the same device produces a distinct row. The
        // clientIdentifier is per-device and would collide. Falls back to
        // clientId only if plex.tv didn't return a uuid (rare).
        id: 'plex.${accountUuid.isNotEmpty ? accountUuid : clientId}',
        accountToken: plexToken,
        clientIdentifier: clientId,
        accountLabel: username.isNotEmpty ? username : (email.isNotEmpty ? email : 'Plex'),
        servers: servers,
        createdAt: DateTime.now(),
        lastAuthenticatedAt: DateTime.now(),
      );
      await connectionRegistry.upsert(accountConnection);
      await plexHome.refresh(accountConnection);
      if (!mounted) return;
      final activeProfiles = context.read<ActiveProfileProvider>();
      await _selectInitialProfile(plexHome, activeProfiles, accountConnection);

      if (!mounted) return;

      final settings = await SettingsService.getInstance();
      if (!mounted) return;

      final promptHandled = shouldPromptForInitialProfileSelection(
        activeProfile: activeProfiles.active,
        hasProfiles: activeProfiles.profiles.isNotEmpty,
        accountHasHomeUsers: plexHome.current[accountConnection.id]?.isNotEmpty == true,
        requireProfileSelectionOnOpen:
            settings.read(SettingsService.requireProfileSelectionOnOpen) && activeProfiles.hasMultipleProfiles,
      );
      if (promptHandled) {
        final selected = await Navigator.of(
          context,
        ).push<bool>(MaterialPageRoute(builder: (_) => const ProfileSwitchScreen(requireSelection: true)));
        if (!mounted) return;
        if (selected != true || activeProfiles.active == null) {
          setState(() => _isAuthenticating = false);
          return;
        }
      }

      await context.read<UserProfileProvider>().initialize();

      if (!mounted) return;

      final multiServer = context.read<MultiServerProvider>();

      // Wait for the active profile binder to settle so we have an accurate server list
      await context.read<ActiveProfileProvider>().awaitBindingSettle();
      if (!mounted) return;

      final serverIds = multiServer.allowedServerIds ?? multiServer.serverManager.serverIds;
      final currentSelection = multiServer.selectedServerId;

      // If a server is already selected and it's still available, skip the screen.
      // Otherwise, if there are multiple servers, we need to prompt.
      if (serverIds.length > 1) {
        if (currentSelection == null || !serverIds.contains(currentSelection)) {
          await Navigator.of(context).push<bool>(MaterialPageRoute(builder: (_) => const SelectServerScreen()));
          if (!mounted) return;
        }
      } else if (serverIds.length == 1 && currentSelection == null) {
        // Auto-select the only server
        multiServer.setSelectedServerId(serverIds.first);
      }

      if (!mounted) return;
      unawaited(Navigator.pushReplacement(context, fadeRoute(MainScreen(initialPromptHandled: promptHandled))));
    } catch (e) {
      appLogger.e('Failed to connect to servers', error: e);
      if (!mounted) return;
      setState(() {
        _isAuthenticating = false;
        _errorMessage = t.serverSelection.failedToLoadServers(error: e);
      });
    } finally {
      svc.dispose();
    }
  }

  void _handleDebugTap() {
    if (!kDebugMode) return;
    _showDebugTokenDialog();
  }



  void _showDebugTokenDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return _DebugTokenDialog(verifyService: _verifyOnlyService, onTokenAccepted: _connectToAllServersAndNavigate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use two-column layout on desktop, single column on mobile
    final isDesktop = MediaQuery.sizeOf(context).width > 700;

    return Focus(
      canRequestFocus: false,
      onKeyEvent: (_, event) => handleBackKeyNavigation(context, event),
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: isDesktop ? 800 : 400),
            padding: const EdgeInsets.all(24),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/lumi-text.png', width: 200),
                            const SizedBox(height: 16),
                            Text(
                              t.app.tagline,
                              style: const TextStyle(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xFFEC609B),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [_buildAuthBody()],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(child: Image.asset('assets/lumi-text.png', width: 150)),
                        const SizedBox(height: 16),
                        Text(
                          t.app.tagline,
                          style: const TextStyle(
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFFEC609B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        const SizedBox(height: 48),
                        _buildAuthBody(),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildAuthBody() {
    if (_isAuthenticating) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(child: CircularProgressIndicator()),
          const SizedBox(height: 16),
          Text(
            t.auth.waitingForAuth,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );
    }
    return PlexPinAuthFlow(
      onTokenReceived: _connectToAllServersAndNavigate,
      autoStartQrOnTV: false,
      initialButtonsBuilder: _buildInitialButtons,
    );
  }

  Widget _buildInitialButtons(BuildContext context, VoidCallback startBrowser, VoidCallback startQr, bool busy) {
    final isTV = PlatformDetector.isTV();
    final isAppleTV = PlatformDetector.isAppleTV();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isTV) ...[
          FocusableButton(
            autofocus: true,
            onPressed: busy ? null : startQr,
            child: ElevatedButton(
              onPressed: busy ? null : startQr,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BackendBadge(backend: MediaBackend.plex, size: 18),
                  const SizedBox(width: 8),
                  Text(t.auth.signInWithPlex),
                ],
              ),
            ),
          ),
          if (!isAppleTV) ...[
            const SizedBox(height: 12),
            FocusableButton(
              onPressed: busy ? null : startBrowser,
              child: OutlinedButton(
                onPressed: busy ? null : startBrowser,
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                child: Text(t.auth.useBrowser),
              ),
            ),
          ],
        ] else ...[
          FocusableButton(
            onPressed: busy ? null : startBrowser,
            child: ElevatedButton.icon(
              onPressed: busy ? null : startBrowser,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              icon: const BackendBadge(backend: MediaBackend.plex, size: 18),
              label: Text(t.auth.signInWithPlex),
            ),
          ),
          const SizedBox(height: 12),
          FocusableButton(
            onPressed: busy ? null : startQr,
            child: OutlinedButton(
              onPressed: busy ? null : startQr,
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: Text(t.auth.showQRCode),
            ),
          ),
        ],
        if (kDebugMode) ...[
          const SizedBox(height: 12),
          FocusableButton(
            onPressed: _handleDebugTap,
            child: OutlinedButton(
              onPressed: _handleDebugTap,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5)),
              ),
              child: const Text('Debug: Enter Plex Token', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
        if (_errorMessage != null) ...[
          const SizedBox(height: 16),
          Text(
            _errorMessage!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

@visibleForTesting
Profile? initialPlexHomeProfileFromCache(PlexHomeService plexHome, PlexAccountConnection accountConn) {
  final users = plexHome.current[accountConn.id];
  if (users == null || users.length != 1) return null;
  return Profile.virtualPlexHome(connectionId: accountConn.id, homeUser: users.single);
}

@visibleForTesting
bool shouldPromptForInitialProfileSelection({
  required Profile? activeProfile,
  required bool hasProfiles,
  required bool accountHasHomeUsers,
  required bool requireProfileSelectionOnOpen,
}) {
  return requireProfileSelectionOnOpen || (activeProfile == null && (hasProfiles || accountHasHomeUsers));
}

/// Stateful so the [TextEditingController] is disposed when the dialog
/// closes — the previous inline `showDialog` builder created the
/// controller in a closure and leaked it on every dismissal.
class _DebugTokenDialog extends StatefulWidget {
  final PlexAuthService? verifyService;
  final Future<void> Function(String token) onTokenAccepted;

  const _DebugTokenDialog({required this.verifyService, required this.onTokenAccepted});

  @override
  State<_DebugTokenDialog> createState() => _DebugTokenDialogState();
}

class _DebugTokenDialogState extends State<_DebugTokenDialog> with ControllerDisposerMixin {
  late final TextEditingController _tokenController = createTextEditingController();
  String? _errorMessage;
  bool _busy = false;

  Future<void> _submit() async {
    final token = _tokenController.text.trim();
    if (token.isEmpty) {
      setState(() => _errorMessage = t.errors.pleaseEnterToken);
      return;
    }
    final svc = widget.verifyService;
    if (svc == null) {
      setState(() => _errorMessage = 'Auth service not ready');
      return;
    }
    final navigator = Navigator.of(context);
    setState(() {
      _errorMessage = null;
      _busy = true;
    });
    try {
      final isValid = await svc.verifyToken(token);
      if (!mounted) return;
      if (!isValid) {
        setState(() {
          _errorMessage = t.errors.invalidToken;
          _busy = false;
        });
        return;
      }
      navigator.pop();
      await widget.onTokenAccepted(token);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = t.errors.failedToVerifyToken(error: e);
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Debug: Enter Plex Token'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FocusableTextFormField(
            controller: _tokenController,
            decoration: InputDecoration(
              labelText: 'Plex Auth Token',
              hintText: 'Enter your Plex.tv token',
              errorText: _errorMessage,
              border: const OutlineInputBorder(),
            ),
            obscureText: true,
            maxLines: 1,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _busy ? null : _submit(),
          ),
        ],
      ),
      actions: [
        DialogActionButton(onPressed: _busy ? () {} : () => Navigator.of(context).pop(), label: t.common.cancel),
        DialogActionButton(onPressed: _busy ? () {} : _submit, label: t.auth.authenticate, isPrimary: true),
      ],
    );
  }
}
