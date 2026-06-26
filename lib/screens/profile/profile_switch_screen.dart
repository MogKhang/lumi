import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../connection/connection_registry.dart';
import '../../providers/companion_remote_provider.dart';
import '../../providers/hidden_libraries_provider.dart';
import '../../providers/multi_server_provider.dart';
import '../../providers/playback_state_provider.dart';
import '../../providers/user_profile_provider.dart';
import '../../focus/focusable_wrapper.dart';
import '../../i18n/strings.g.dart';
import '../../media/media_backend.dart';
import '../../mixins/mounted_set_state_mixin.dart';
import '../../profiles/active_profile_binder.dart';
import '../../profiles/active_profile_provider.dart';
import '../../profiles/plex_home_service.dart';
import '../../profiles/profile.dart';
import '../../profiles/profile_activation.dart';
import '../../profiles/profile_avatar.dart';
import '../../profiles/profile_connection.dart';
import '../../profiles/profile_connection_registry.dart';
import '../../profiles/profile_registry.dart';
import '../../profiles/profiles_view.dart';
import '../../services/app_exit_service.dart';
import '../../services/storage_service.dart';
import '../../utils/app_logger.dart';
import '../../utils/dialogs.dart';
import '../../utils/snackbar_helper.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/backend_badge.dart';
import '../../widgets/focusable_popup_menu_button.dart';
import '../../widgets/focused_scroll_scaffold.dart';
import '../libraries/state_messages.dart';
import '../auth_screen.dart';
import 'add_local_profile_screen.dart';
import 'profile_delete_flow.dart';

/// Flat picker showing every [Profile] in the system — Plex Home users
/// auto-surfaced from connected accounts, plus user-created locals.
///
/// Each tile shows avatar, name, an Active badge for the current profile,
/// and one backend chip per connection bound to the profile (parent Plex
/// account + any borrowed connections for Plex Home users).
class ProfileSwitchScreen extends StatefulWidget {
  final bool requireSelection;

  const ProfileSwitchScreen({super.key, this.requireSelection = false});

  @override
  State<ProfileSwitchScreen> createState() => _ProfileSwitchScreenState();
}

class _ProfileSwitchScreenState extends State<ProfileSwitchScreen> with MountedSetStateMixin {
  bool _allowPop = false;
  final Map<String, FocusNode> _profileFocusNodes = {};
  final Map<String, FocusNode> _profileMenuFocusNodes = {};
  final Map<String, GlobalKey<PopupMenuButtonState<_TileAction>>> _profileMenuKeys = {};
  bool _focusRequested = false;
  bool _switching = false;
  Stream<ProfilesView>? _viewStream;
  StorageService? _storage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewStream ??= watchProfilesView(
      profiles: context.read<ProfileRegistry>(),
      profileConnections: context.read<ProfileConnectionRegistry>(),
      connections: context.read<ConnectionRegistry>(),
      plexHome: context.read<PlexHomeService>(),
      storage: _storage,
    );
    if (_storage == null) {
      unawaited(
        StorageService.getInstance().then((s) {
          setStateIfMounted(() => _storage = s);
        }),
      );
    }
  }

  @override
  void dispose() {
    for (final node in _profileFocusNodes.values) {
      node.dispose();
    }
    for (final node in _profileMenuFocusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !widget.requireSelection || _allowPop,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop && widget.requireSelection) {
          unawaited(AppExitService.requestExit());
        }
      },
      child: StreamBuilder<ProfilesView>(
        stream: _viewStream,
        initialData: ProfilesView.empty,
        builder: (context, snapshot) {
          final view = snapshot.data ?? ProfilesView.empty;
          _pruneProfileFocusResources(view.profiles.map((p) => p.id).toSet());
          // `context.select` only rebuilds when `activeId` actually
          // changes. `context.watch` would rebuild on every provider
          // notification — combined with the stream, that doubles the
          // build cost on each profile-switch.
          final activeId = context.select<ActiveProfileProvider, String?>((p) => p.activeId);
          return Stack(
            children: [
              FocusedScrollScaffold(
                title: Text(t.screens.switchProfile),
                automaticallyImplyLeading: !widget.requireSelection,
                onBackPressed: widget.requireSelection ? () => unawaited(AppExitService.requestExit()) : null,
                slivers: [
                  if (view.profiles.isEmpty)
                    SliverFillRemaining(
                      child: EmptyStateWidget(
                        message: t.messages.noProfilesAvailable,
                        subtitle: t.messages.contactAdminForProfiles,
                        icon: Symbols.person_off_rounded,
                      ),
                    )
                  else
                    ..._buildSections(view, activeId),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                    sliver: SliverToBoxAdapter(
                      child: FocusableWrapper(
                        disableScale: true,
                        borderRadius: 100,
                        useBackgroundFocus: true,
                        descendantsAreFocusable: false,
                        onSelect: _switching ? null : _addLocalProfile,
                        child: OutlinedButton.icon(
                          onPressed: _switching ? null : _addLocalProfile,
                          icon: const AppIcon(Symbols.person_add_rounded, fill: 1),
                          label: Text(t.profiles.addLumiProfile),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Modal busy overlay so users see the switch is in flight.
              // Without this the screen visually freezes for a few seconds
              // while the binder fetches user tokens and rebuilds servers.
              // `Positioned.fill` is required: a non-positioned `ColoredBox`
              // sizes itself to its child (just the Card+Center), leaving
              // the rest of the screen un-dimmed and tappable.
              if (_switching)
                Positioned.fill(
                  child: ColoredBox(
                    color: Colors.black54,
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 56, height: 56, child: CircularProgressIndicator()),
                              const SizedBox(height: 16),
                              Text(t.profiles.switchingProfile),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  FocusNode _profileFocusNode(Profile profile) {
    return _profileFocusNodes.putIfAbsent(profile.id, () => FocusNode(debugLabel: 'ProfileTile:${profile.id}'));
  }

  FocusNode _profileMenuFocusNode(Profile profile) {
    return _profileMenuFocusNodes.putIfAbsent(profile.id, () => FocusNode(debugLabel: 'ProfileActions:${profile.id}'));
  }

  GlobalKey<PopupMenuButtonState<_TileAction>> _profileMenuKey(Profile profile) {
    return _profileMenuKeys.putIfAbsent(profile.id, () => GlobalKey<PopupMenuButtonState<_TileAction>>());
  }

  void _pruneProfileFocusResources(Set<String> activeIds) {
    for (final id in _profileFocusNodes.keys.toList()) {
      if (!activeIds.contains(id)) {
        _profileFocusNodes.remove(id)?.dispose();
      }
    }
    for (final id in _profileMenuFocusNodes.keys.toList()) {
      if (!activeIds.contains(id)) {
        _profileMenuFocusNodes.remove(id)?.dispose();
      }
    }
    for (final id in _profileMenuKeys.keys.toList()) {
      if (!activeIds.contains(id)) {
        _profileMenuKeys.remove(id);
      }
    }
  }

  void _openProfileMenu(Profile profile) {
    _profileMenuKeys[profile.id]?.currentState?.showButtonMenu();
  }

  List<Widget> _buildSections(ProfilesView view, String? activeId) {
    return [_profileList(view.profiles, view, activeId, autofocusFirst: true)];
  }

  SliverList _profileList(List<Profile> profiles, ProfilesView view, String? activeId, {required bool autofocusFirst}) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final profile = profiles[index];
        final isActive = profile.id == activeId;
        final isFirstSelectable = autofocusFirst && index == 0;
        final profileFocusNode = _profileFocusNode(profile);
        final menuFocusNode = _profileMenuFocusNode(profile);
        final menuKey = _profileMenuKey(profile);
        const VoidCallback? onManage = null;
        final onDelete = profile.isLocal && !widget.requireSelection ? () => _deleteProfile(profile) : null;
        final onSignOut = profile.isPlexHome && profile.parentConnectionId != null && !widget.requireSelection
            ? () => _signOutPlexAccount(profile)
            : null;
        // Delete Account (App Store 5.1.1(v)) wipes ALL local account data, so
        // it's offered alongside Sign out — the same profiles that can sign out
        // of a Plex account can fully delete their data.
        final onDeleteAccount = onSignOut != null ? () => _deleteAccount(context) : null;
        final hasMenu = onDelete != null || onSignOut != null || onDeleteAccount != null;

        if (isFirstSelectable && !_focusRequested) {
          _focusRequested = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) profileFocusNode.requestFocus();
          });
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: FocusableWrapper(
            autofocus: isFirstSelectable,
            focusNode: profileFocusNode,
            disableScale: true,
            enableLongPress: hasMenu,
            onLongPress: hasMenu ? () => _openProfileMenu(profile) : null,
            onNavigateRight: hasMenu ? () => menuFocusNode.requestFocus() : null,
            onSelect: _switching || (isActive && !widget.requireSelection) ? null : () => _switchTo(profile),
            child: Card(
              child: _ProfileTile(
                profile: profile,
                isActive: isActive && !widget.requireSelection,
                chips: _chipsFor(profile, view),
                onTap: () => _switchTo(profile),
                // Manage available for any profile — adding/removing
                // borrowed connections is supported on plex_home too. Delete
                // stays local-only (Plex Home users are owned by Plex).
                onManage: onManage,
                onDelete: onDelete,
                onSignOut: onSignOut,
                onDeleteAccount: onDeleteAccount,
                menuFocusNode: menuFocusNode,
                menuKey: menuKey,
                onMenuNavigateLeft: () => profileFocusNode.requestFocus(),
              ),
            ),
          ),
        );
      }, childCount: profiles.length),
    );
  }

  /// Drop the parent Plex account [profile] hangs off — same effect as
  /// "Forget account" elsewhere in Plex apps. The connection's join rows
  /// cascade away (FK on connection_id), [PlexHomeService]'s
  /// `_onChange` listener evicts the cached home users + shadow profile
  /// rows, and a binder rebind clears the runtime client. Plex doesn't
  /// expose a single-session revoke endpoint we can rely on, so we don't
  /// touch the server side — the user can revoke via plex.tv if they want.
  Future<void> _signOutPlexAccount(Profile profile) async {
    final parentId = profile.parentConnectionId;
    if (parentId == null) return;
    final connRegistry = context.read<ConnectionRegistry>();
    final parent = await connRegistry.getPlexAccount(parentId);
    if (parent == null || !mounted) return;

    final confirmed = await showDeleteConfirmation(
      context,
      title: t.profiles.signOutPlexTitle,
      message: t.profiles.signOutPlexMessage(displayName: parent.displayLabel),
      confirmText: t.profiles.signOut,
    );
    if (!confirmed || !mounted) return;

    final active = context.read<ActiveProfileProvider>();
    final activeProfile = active.active;
    final wasActiveAccount = activeProfile?.parentConnectionId == parentId;
    final remainingProfiles = active.profiles
        .where((p) => p.id != activeProfile?.id && p.parentConnectionId != parentId)
        .toList();
    final binder = context.read<ActiveProfileBinder>();
    final navigator = Navigator.of(context, rootNavigator: true);

    try {
      await connRegistry.remove(parentId);
      final noConnectionsLeft = (await connRegistry.list()).isEmpty;
      if (noConnectionsLeft) {
        await active.clearActiveProfile();
        unawaited(binder.rebindActive());
        if (navigator.mounted) {
          unawaited(navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const AuthScreen()), (_) => false));
        }
        return;
      }
      if (!mounted) return;
      // If the active virtual profile belonged to the removed account, make
      // the storage state explicit instead of relying on provider fallback.
      if (wasActiveAccount) {
        if (remainingProfiles.isNotEmpty) {
          await active.activate(remainingProfiles.first);
        } else {
          await active.clearActiveProfile();
          unawaited(binder.rebindActive());
        }
      } else {
        // Active profile stayed the same, but borrowed rows for this account
        // may have cascaded away.
        unawaited(binder.rebindActive());
      }
      if (!mounted) return;
      showSuccessSnackBar(context, t.profiles.signedOutPlex);
    } catch (e, st) {
      appLogger.w('Plex sign-out failed for $parentId', error: e, stackTrace: st);
      if (mounted) {
        showErrorSnackBar(context, t.profiles.signOutFailed);
      }
    }
  }

  /// Account deletion required by App Store Guideline 5.1.1(v). Lumi doesn't
  /// host accounts — sign-ins are to the user's own Plex/Jellyfin server — so
  /// "Delete Account" erases every credential and trace of account data stored
  /// locally, and links the user to Plex's own account page for the upstream
  /// account. Mirrors the Logout teardown in SettingsScreen but is irreversible
  /// and confirmed.
  Future<void> _deleteAccount(BuildContext context) async {
    // Capture every provider + the navigator up front so nothing reads
    // `context` across the dialog's async gap.
    final companionRemote = context.read<CompanionRemoteProvider>();
    final userProfileProvider = context.read<UserProfileProvider>();
    final multiServerProvider = context.read<MultiServerProvider>();
    final profileConnReg = context.read<ProfileConnectionRegistry>();
    final profileRegistry = context.read<ProfileRegistry>();
    final connectionRegistry = context.read<ConnectionRegistry>();
    final plexHome = context.read<PlexHomeService>();
    final hiddenLibrariesProvider = context.read<HiddenLibrariesProvider>();
    final playbackStateProvider = context.read<PlaybackStateProvider>();
    final navigator = Navigator.of(context, rootNavigator: true);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final colorScheme = Theme.of(dialogContext).colorScheme;
        return AlertDialog(
          title: Text(t.account.deleteAccountTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.account.deleteAccountMessage),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () => launchUrl(
                    Uri.parse('https://app.plex.tv/desktop/#!/settings/account'),
                    mode: LaunchMode.externalApplication,
                  ),
                  icon: const AppIcon(Symbols.open_in_new_rounded, size: 18),
                  label: Text(t.account.managePlexAccount),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: Text(t.common.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
              ),
              child: Text(t.account.deleteAccountConfirm),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) return;

    await companionRemote.resetForLogout();
    await userProfileProvider.logout();
    multiServerProvider.clearAllConnections();
    await profileConnReg.clear();
    await profileRegistry.clear();
    await connectionRegistry.clear();
    await plexHome.clearAll();
    final storage = await StorageService.getInstance();
    await storage.clearActiveProfileId();
    await storage.clearAllProfileLastUsed();
    await hiddenLibrariesProvider.refresh();
    playbackStateProvider.clearShuffle();

    if (navigator.mounted) {
      unawaited(
        navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const AuthScreen()), (_) => false),
      );
    }
  }

  Future<void> _deleteProfile(Profile profile) async {
    await confirmAndDeleteProfile(
      context,
      profile: profile,
      title: t.profiles.deleteThisProfileTitle,
      message: t.profiles.deleteThisProfileMessage(displayName: profile.displayName),
    );
  }

  List<_ChipData> _chipsFor(Profile profile, ProfilesView view) {
    final chips = <_ChipData>[];
    // Plex Home profiles implicitly own their parent Plex connection (no
    // join-table row), so prepend it before any borrowed connections.
    if (profile.isPlexHome) {
      final parentId = profile.parentConnectionId;
      if (parentId != null) {
        final conn = view.connectionsById[parentId];
        if (conn != null) chips.add(_ChipData(backend: conn.backend, label: conn.accountName));
      }
    }
    final pcs = visibleProfileConnections(
      profile,
      view.connectionsByProfile[profile.id] ?? const <ProfileConnection>[],
    );
    for (final pc in pcs) {
      final conn = view.connectionsById[pc.connectionId];
      if (conn != null) chips.add(_ChipData(backend: conn.backend, label: conn.accountName));
    }
    return chips;
  }

  Future<void> _addLocalProfile() async {
    await Navigator.of(context).push<bool>(MaterialPageRoute(builder: (_) => const AddLocalProfileScreen()));
  }

  Future<void> _switchTo(Profile profile) async {
    if (_switching) return;
    setState(() => _switching = true);
    try {
      final navigator = Navigator.of(context);
      final activeProvider = context.read<ActiveProfileProvider>();
      final ok = await activateProfileWithPin(context, profile);
      if (!mounted) return;
      if (!ok) {
        if (context.mounted) {
          showErrorSnackBar(context, t.errors.failedToSwitchProfile(displayName: profile.displayName));
        }
        return;
      }
      // Stay on the picker while the binder mints the per-user token,
      // fetches servers, and pushes them into MultiServerManager. The
      // PIN dialog (if any) overlays the picker via the root navigator,
      // so popping early would briefly expose the previous profile's
      // empty-state screen behind the dialog.
      final bound = await activeProvider.awaitBindingSettle();
      if (!mounted) return;
      if (!bound) {
        if (context.mounted) {
          showErrorSnackBar(context, t.errors.failedToSwitchProfile(displayName: profile.displayName));
        }
        return;
      }
      if (widget.requireSelection) {
        setState(() => _allowPop = true);
      }
      navigator.pop(true);
    } finally {
      setStateIfMounted(() => _switching = false);
    }
  }
}

class _ProfileTile extends StatelessWidget {
  final Profile profile;
  final bool isActive;
  final List<_ChipData> chips;
  final VoidCallback onTap;
  final VoidCallback? onManage;
  final VoidCallback? onDelete;
  final VoidCallback? onSignOut;
  final VoidCallback? onDeleteAccount;
  final FocusNode menuFocusNode;
  final GlobalKey<PopupMenuButtonState<_TileAction>> menuKey;
  final VoidCallback onMenuNavigateLeft;

  const _ProfileTile({
    required this.profile,
    required this.isActive,
    required this.chips,
    required this.onTap,
    this.onManage,
    this.onDelete,
    this.onSignOut,
    this.onDeleteAccount,
    required this.menuFocusNode,
    required this.menuKey,
    required this.onMenuNavigateLeft,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasMenu = onManage != null || onDelete != null || onSignOut != null || onDeleteAccount != null;
    return InkWell(
      onTap: isActive ? null : onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Row(
          children: [
            ProfileAvatar(profile: profile, size: 44),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          profile.displayName,
                          style: theme.textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (isActive) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            t.profiles.active,
                            style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onPrimaryContainer),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  _ConnectionChips(chips: chips),
                ],
              ),
            ),
            if (hasMenu)
              _ProfileActionsButton(
                menuKey: menuKey,
                focusNode: menuFocusNode,
                onNavigateLeft: onMenuNavigateLeft,
                onSelected: _handleAction,
                actions: [
                  if (onManage != null) _TileAction.manage,
                  if (onDelete != null) _TileAction.delete,
                  if (onSignOut != null) _TileAction.signOut,
                  if (onDeleteAccount != null) _TileAction.deleteAccount,
                ],
              )
            else if (!isActive)
              const Padding(padding: EdgeInsets.only(left: 8), child: AppIcon(Symbols.chevron_right_rounded, fill: 1)),
          ],
        ),
      ),
    );
  }

  void _handleAction(_TileAction action) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (action) {
        case _TileAction.manage:
          onManage?.call();
          break;
        case _TileAction.delete:
          onDelete?.call();
          break;
        case _TileAction.signOut:
          onSignOut?.call();
          break;
        case _TileAction.deleteAccount:
          onDeleteAccount?.call();
          break;
      }
    });
  }
}

class _ProfileActionsButton extends StatelessWidget {
  final GlobalKey<PopupMenuButtonState<_TileAction>> menuKey;
  final FocusNode focusNode;
  final VoidCallback onNavigateLeft;
  final ValueChanged<_TileAction> onSelected;
  final List<_TileAction> actions;

  const _ProfileActionsButton({
    required this.menuKey,
    required this.focusNode,
    required this.onNavigateLeft,
    required this.onSelected,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return FocusablePopupMenuButton<_TileAction>(
      menuKey: menuKey,
      focusNode: focusNode,
      semanticLabel: t.profiles.manage,
      onNavigateLeft: onNavigateLeft,
      icon: const AppIcon(Symbols.more_vert_rounded, fill: 1),
      tooltip: t.profiles.manage,
      onSelected: onSelected,
      itemBuilder: (_) => [for (final action in actions) PopupMenuItem(value: action, child: Text(action.label))],
    );
  }
}

extension _TileActionLabel on _TileAction {
  String get label {
    return switch (this) {
      _TileAction.manage => t.profiles.manage,
      _TileAction.delete => t.profiles.delete,
      _TileAction.signOut => t.profiles.signOut,
      _TileAction.deleteAccount => t.account.deleteAccount,
    };
  }
}

enum _TileAction { manage, delete, signOut, deleteAccount }

class _ConnectionChips extends StatelessWidget {
  final List<_ChipData> chips;

  const _ConnectionChips({required this.chips});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (chips.isEmpty) {
      return Text('No connections', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error));
    }
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: [
        for (final c in chips)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BackendBadge(backend: c.backend, size: 12),
                const SizedBox(width: 4),
                Text(c.label, style: theme.textTheme.labelSmall),
              ],
            ),
          ),
      ],
    );
  }
}

class _ChipData {
  final MediaBackend backend;
  final String label;
  const _ChipData({required this.backend, required this.label});
}
