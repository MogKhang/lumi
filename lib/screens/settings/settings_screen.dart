import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:plezy/widgets/app_icon.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'settings_utils.dart';

import '../../focus/focus_memory_tracker.dart';
import '../../focus/input_mode_tracker.dart';
import '../../i18n/strings.g.dart';
import '../main_screen.dart';
import '../../mixins/mounted_set_state_mixin.dart';
import '../../mixins/refreshable.dart';
import '../../services/donation_service.dart';
import '../../providers/theme_provider.dart';
import '../../services/keyboard_shortcuts_service.dart';
import '../../services/settings_service.dart' as settings;
import '../../widgets/desktop_app_bar.dart';
import '../../widgets/setting_tile.dart';
import '../../widgets/settings_section.dart';
import '../../profiles/active_profile_provider.dart';
import '../../profiles/profile.dart';
import '../../utils/platform_detector.dart';
import '../../profiles/profile_registry.dart';
import 'about_screen.dart';
import 'keyboard_shortcuts_screen.dart';
import '../profile/profile_switch_screen.dart';
import '../../widgets/settings_builder.dart';
import '../../models/transcode_quality_preset.dart';
import '../../utils/quality_preset_labels.dart';
import '../../providers/companion_remote_provider.dart';
import '../../providers/user_profile_provider.dart';
import '../../providers/multi_server_provider.dart';
import '../../providers/hidden_libraries_provider.dart';
import '../../providers/playback_state_provider.dart';
import '../../providers/libraries_provider.dart';
import '../../profiles/profile_connection_registry.dart';
import '../../connection/connection_registry.dart';
import '../../profiles/plex_home_service.dart';
import '../../services/storage_service.dart';
import '../auth_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static final Future<PackageInfo> _packageInfoFuture = PackageInfo.fromPlatform();

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with FocusableTab, MountedSetStateMixin {
  late final FocusMemoryTracker _focusTracker;

  // Focus tracking keys
  static const _kDonate = 'donate';
  static const _kAbout = 'about';

  KeyboardShortcutsService? _keyboardService;
  late final bool _keyboardShortcutsSupported = KeyboardShortcutsService.isPlatformSupported();

  @override
  void initState() {
    super.initState();
    _focusTracker = FocusMemoryTracker(
      onFocusChanged: () {
        // ignore: no-empty-block - setState triggers rebuild to update focus styling
        setStateIfMounted(() {});
      },
      debugLabelPrefix: 'settings',
    );
    if (_keyboardShortcutsSupported) {
      KeyboardShortcutsService.getInstance().then((s) {
        setStateIfMounted(() => _keyboardService = s);
      });
    }
  }

  @override
  void dispose() {
    _focusTracker.dispose();
    super.dispose();
  }

  @override
  void focusActiveTabIfReady() {
    if (InputModeTracker.isKeyboardMode(context)) {
      _focusTracker.restoreFocus(fallbackKey: DonationService.isEnabled ? _kDonate : _kAbout);
    }
  }

  void _navigateToSidebar() {
    MainScreenFocusScope.of(context)?.focusSidebar();
  }

  KeyEventResult _handleKeyEvent(FocusNode _, KeyEvent event) {
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      _navigateToSidebar();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Focus(
        onKeyEvent: _handleKeyEvent,
        child: CustomScrollView(
          primary: false,
          slivers: [
            ExcludeFocus(
              child: CustomAppBar(
                title: Text(
                  t.settings.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                pinned: true,
                automaticallyImplyLeading: false,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                if (DonationService.isEnabled) _buildDonateTile(),

                _buildThemeTile(),
                _buildLanguageTile(context),

                if (PlatformDetector.isAndroid(context)) _buildPlayerBackendTile(),
                _buildDefaultQualityTile(),

                _buildProfileSwitcherTile(),

                if (_keyboardShortcutsSupported) ...[_buildKeyboardShortcutsSection()],

                _buildSwitchServerTile(),

                SettingNavigationTile(
                  focusNode: _focusTracker.get(_kAbout),
                  icon: Symbols.info_rounded,
                  title: t.settings.about,
                  subtitle: t.settings.aboutDescription,
                  destinationBuilder: (context) => const AboutScreen(),
                ),

                _buildLogoutTile(),
                const SizedBox(height: 8),
                _buildAppInfoSection(),
                const SizedBox(height: 12),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonateTile() {
    return ListTile(
      focusNode: _focusTracker.get(_kDonate),
      leading: const AppIcon(Symbols.favorite_rounded, fill: 1),
      title: Text(t.settings.supportDeveloper),
      subtitle: Text(t.settings.supportDeveloperDescription),
      trailing: const AppIcon(Symbols.open_in_new_rounded, fill: 1),
      onTap: () async {
        final url = Uri.parse(DonationService.donationUrl);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
    );
  }

  String _getLanguageDisplayName(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return 'English';
      case AppLocale.sv:
        return 'Svenska';
      case AppLocale.fr:
        return 'Français';
      case AppLocale.it:
        return 'Italiano';
      case AppLocale.nl:
        return 'Nederlands';
      case AppLocale.de:
        return 'Deutsch';
      case AppLocale.zh:
        return '中文';
      case AppLocale.ko:
        return '한국어';
      case AppLocale.es:
        return 'Español';
      case AppLocale.pt:
        return 'Português';
      case AppLocale.ja:
        return '日本語';
      case AppLocale.ru:
        return 'Русский';
      case AppLocale.pl:
        return 'Polski';
      case AppLocale.da:
        return 'Dansk';
      case AppLocale.nb:
        return 'Norsk bokmål';
    }
  }

  void _restartApp(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  Widget _buildThemeTile() {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return ListTile(
          leading: AppIcon(themeProvider.themeModeIcon, fill: 1),
          title: Text(t.settings.theme),
          subtitle: Text(themeProvider.themeModeDisplayName),
          trailing: const AppIcon(Symbols.chevron_right_rounded, fill: 1),
          onTap: () async {
            final value = await showSelectionDialog<settings.ThemeMode>(
              context: context,
              title: t.settings.theme,
              options: [
                DialogOption(value: settings.ThemeMode.system, title: t.settings.systemTheme),
                DialogOption(value: settings.ThemeMode.light, title: t.settings.lightTheme),
                DialogOption(value: settings.ThemeMode.dark, title: t.settings.darkTheme),
                DialogOption(value: settings.ThemeMode.oled, title: t.settings.oledTheme),
              ],
              currentValue: themeProvider.themeMode,
            );
            if (value != null) {
              await themeProvider.setThemeMode(value);
            }
          },
        );
      },
    );
  }

  Widget _buildLanguageTile(BuildContext context) {
    return ListTile(
      leading: const AppIcon(Symbols.language_rounded, fill: 1),
      title: Text(t.settings.language),
      subtitle: Text(_getLanguageDisplayName(LocaleSettings.currentLocale)),
      trailing: const AppIcon(Symbols.chevron_right_rounded, fill: 1),
      onTap: () async {
        final value = await showSelectionDialog<AppLocale>(
          context: context,
          title: t.settings.language,
          options: AppLocale.values
              .map((locale) => DialogOption(value: locale, title: _getLanguageDisplayName(locale)))
              .toList(),
          currentValue: LocaleSettings.currentLocale,
        );
        if (value != null) {
          await settings.SettingsService.instanceOrNull!.write(settings.SettingsService.appLocale, value);
          unawaited(LocaleSettings.setLocale(value));
          if (context.mounted) _restartApp(context);
        }
      },
    );
  }

  Widget _buildPlayerBackendTile() {
    return SettingValueBuilder<bool>(
      pref: settings.SettingsService.useExoPlayer,
      builder: (context, useExo, _) {
        return ListTile(
          leading: const AppIcon(Symbols.play_circle_rounded, fill: 1),
          title: Text(t.settings.playerBackend),
          subtitle: Text(useExo ? t.settings.exoPlayer : t.settings.mpv),
          trailing: const AppIcon(Symbols.chevron_right_rounded, fill: 1),
          onTap: () async {
            final value = await showSelectionDialog<bool>(
              context: context,
              title: t.settings.playerBackend,
              options: [
                DialogOption(value: true, title: t.settings.exoPlayer),
                DialogOption(value: false, title: t.settings.mpv),
              ],
              currentValue: useExo,
            );
            if (value != null) {
              await settings.SettingsService.instanceOrNull!.write(settings.SettingsService.useExoPlayer, value);
            }
          },
        );
      },
    );
  }

  Widget _buildDefaultQualityTile() {
    return SettingSelectionTile<TranscodeQualityPreset, TranscodeQualityPreset>(
      pref: settings.SettingsService.defaultQualityPreset,
      icon: Symbols.high_quality_rounded,
      title: t.settings.defaultQualityTitle,
      subtitleBuilder: qualityPresetLabel,
      options: TranscodeQualityPreset.displayOrder
          .map((p) => DialogOption(value: p, title: qualityPresetLabel(p)))
          .toList(),
      decode: (p) => p,
      encode: (p) => p,
    );
  }

  Widget _buildKeyboardShortcutsSection() {
    if (_keyboardService == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsSectionHeader(t.settings.keyboardShortcuts),
        SettingNavigationTile(
          icon: Symbols.keyboard_rounded,
          title: t.settings.videoPlayerControls,
          subtitle: t.settings.keyboardShortcutsDescription,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KeyboardShortcutsScreen(keyboardService: _keyboardService!)),
            );
          },
        ),
        SettingSwitchTile(
          pref: settings.SettingsService.videoPlayerNavigationEnabled,
          icon: Symbols.gamepad_rounded,
          title: t.settings.videoPlayerNavigation,
          subtitle: t.settings.videoPlayerNavigationDescription,
        ),
      ],
    );
  }

  Widget _buildProfileSwitcherTile() {
    return StreamBuilder<List<Profile>>(
      stream: context.read<ProfileRegistry>().watchProfiles(),
      builder: (context, snapshot) {
        final count = snapshot.data?.length ?? 0;
        final activeName = context.select<ActiveProfileProvider, String?>((p) => p.active?.displayName);
        final subtitle = count <= 1
            ? t.profiles.summarySingle
            : (activeName != null
                  ? t.profiles.summaryMultipleWithActive(count: count, activeName: activeName)
                  : t.profiles.summaryMultiple(count: count));
        return SettingNavigationTile(
          icon: Symbols.group_rounded,
          title: t.profiles.sectionTitle,
          subtitle: subtitle,
          destinationBuilder: (_) => const ProfileSwitchScreen(),
        );
      },
    );
  }

  Widget _buildSwitchServerTile() {
    return Consumer<MultiServerProvider>(
      builder: (context, provider, _) {
        final allowedServers = provider.allowedServerIds ?? provider.serverManager.serverIds;
        final selectedId = provider.selectedServerId;
        
        // Use the first server as the effective selection if none explicitly selected
        final effectiveSelection = (selectedId != null && allowedServers.contains(selectedId))
            ? selectedId 
            : (allowedServers.isNotEmpty ? allowedServers.first : null);

        final String subtitle;
        if (effectiveSelection != null) {
          subtitle = provider.serverManager.getClient(effectiveSelection)?.serverName ?? 'Unknown Server';
        } else {
          subtitle = 'No Servers Available';
        }

        return ListTile(
          leading: const AppIcon(Symbols.dns_rounded, fill: 1),
          title: const Text('Switch Server'),
          subtitle: Text(subtitle),
          trailing: const AppIcon(Symbols.chevron_right_rounded, fill: 1),
          onTap: () async {
            if (allowedServers.isEmpty) return;

            final options = allowedServers.map((id) => DialogOption(
                  value: id,
                  title: provider.serverManager.getClient(id)?.serverName ?? id,
                )).toList();

            final value = await showSelectionDialog<String>(
              context: context,
              title: 'Switch Server',
              options: options,
              currentValue: effectiveSelection!,
            );

            if (value != null && context.mounted) {
              provider.setSelectedServerId(value);
              unawaited(context.read<LibrariesProvider>().loadLibraries());
            }
          },
        );
      },
    );
  }

  Widget _buildLogoutTile() {
    return ListTile(
      leading: const AppIcon(Symbols.logout_rounded, fill: 1, color: Colors.red),
      title: Text(t.common.logout, style: const TextStyle(color: Colors.red)),
      onTap: () => _handleLogout(context),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    final companionRemote = context.read<CompanionRemoteProvider>();
    final userProfileProvider = context.read<UserProfileProvider>();
    final multiServerProvider = context.read<MultiServerProvider>();
    final profileConnReg = context.read<ProfileConnectionRegistry>();
    final profileRegistry = context.read<ProfileRegistry>();
    final connectionRegistry = context.read<ConnectionRegistry>();
    final plexHome = context.read<PlexHomeService>();
    final hiddenLibrariesProvider = context.read<HiddenLibrariesProvider>();
    final playbackStateProvider = context.read<PlaybackStateProvider>();

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

    if (context.mounted) {
      unawaited(
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const AuthScreen()),
          (route) => false,
        ),
      );
    }
  }

  Widget _buildAppInfoSection() {
    return FutureBuilder<PackageInfo>(
      future: SettingsScreen._packageInfoFuture,
      builder: (context, snapshot) {
        final appVersion = snapshot.data?.version ?? '';
        return Center(
          child: Column(
            children: [
              Image.asset('assets/plezy.png', width: 64, height: 64),
              const SizedBox(height: 4),
              Text(
                t.app.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                t.about.versionLabel(version: appVersion),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}
