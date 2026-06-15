import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../../i18n/strings.g.dart';
import '../../profiles/active_profile_provider.dart';
import '../../services/settings_service.dart' hide ThemeMode;
import '../../focus/focusable_slider.dart';
import '../../utils/platform_detector.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/setting_tile.dart';
import '../../widgets/settings_page.dart';
import '../../widgets/settings_builder.dart';
import '../../widgets/settings_section.dart';

class AppearanceSettingsScreen extends StatelessWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsPage(
      title: Text(t.settings.appearance),
      children: [
        SettingsSectionHeader(t.settings.display),
        _densitySelector(),
        _viewModeSelector(),
        _episodePosterModeSelector(),
        SettingSwitchTile(
          pref: SettingsService.showEpisodeNumberOnCards,
          icon: Symbols.tag_rounded,
          title: t.settings.showEpisodeNumberOnCards,
          subtitle: t.settings.showEpisodeNumberOnCardsDescription,
        ),
        SettingSwitchTile(
          pref: SettingsService.showSeasonPostersOnTabs,
          icon: Symbols.image_rounded,
          title: t.settings.showSeasonPostersOnTabs,
          subtitle: t.settings.showSeasonPostersOnTabsDescription,
        ),

        SettingsSectionHeader(t.settings.homeScreen),
        SettingSwitchTile(
          pref: SettingsService.showHeroSection,
          icon: Symbols.featured_play_list_rounded,
          title: t.settings.showHeroSection,
          subtitle: t.settings.showHeroSectionDescription,
        ),
        SettingSwitchTile(
          pref: SettingsService.useGlobalHubs,
          icon: Symbols.home_rounded,
          title: t.settings.useGlobalHubs,
          subtitle: t.settings.useGlobalHubsDescription,
        ),
        SettingSwitchTile(
          pref: SettingsService.showServerNameOnHubs,
          icon: Symbols.dns_rounded,
          title: t.settings.showServerNameOnHubs,
          subtitle: t.settings.showServerNameOnHubsDescription,
        ),

        SettingsSectionHeader(t.settings.navigation),
        if (Platform.isAndroid)
          SettingSwitchTile(
            pref: SettingsService.forceTvMode,
            icon: Symbols.tv_rounded,
            title: t.settings.forceTvMode,
            subtitle: t.settings.forceTvModeDescription,
            onAfterWrite: (value) {
              TvDetectionService.setForceTVSync(value);
              _restartApp(context);
            },
          ),
        if (PlatformDetector.shouldUseSideNavigation(context))
          SettingSwitchTile(
            pref: SettingsService.alwaysKeepSidebarOpen,
            icon: Symbols.dock_to_left_rounded,
            title: t.settings.alwaysKeepSidebarOpen,
            subtitle: t.settings.alwaysKeepSidebarOpenDescription,
          ),
        if (PlatformDetector.shouldUseSideNavigation(context))
          SettingSwitchTile(
            pref: SettingsService.groupLibrariesByServer,
            icon: Symbols.dns_rounded,
            title: t.settings.groupLibrariesByServer,
            subtitle: t.settings.groupLibrariesByServerDescription,
          ),
        if (!PlatformDetector.shouldUseSideNavigation(context))
          SettingSwitchTile(
            pref: SettingsService.showNavBarLabels,
            icon: Symbols.label_rounded,
            title: t.settings.showNavBarLabels,
            subtitle: t.settings.showNavBarLabelsDescription,
          ),
        SettingSwitchTile(
          pref: SettingsService.showUnwatchedCount,
          icon: Symbols.counter_1_rounded,
          title: t.settings.showUnwatchedCount,
          subtitle: t.settings.showUnwatchedCountDescription,
        ),

        if (PlatformDetector.isDesktopOS()) ...[
          SettingsSectionHeader(t.settings.window),
          if (Platform.isWindows || Platform.isLinux)
            SettingSwitchTile(
              pref: SettingsService.startInFullscreen,
              icon: Symbols.fullscreen_rounded,
              title: t.settings.startInFullscreen,
              subtitle: t.settings.startInFullscreenDescription,
            ),
          SettingSwitchTile(
            pref: SettingsService.exitFullscreenOnPlayerClose,
            icon: Symbols.fullscreen_exit_rounded,
            title: t.settings.exitFullscreenOnPlayerClose,
            subtitle: t.settings.exitFullscreenOnPlayerCloseDescription,
          ),
        ],

        SettingsSectionHeader(t.settings.content),
        SettingSwitchTile(
          pref: SettingsService.liveTvDefaultFavorites,
          icon: Symbols.star_rounded,
          title: t.settings.liveTvDefaultFavorites,
          subtitle: t.settings.liveTvDefaultFavoritesDescription,
        ),
        SettingSwitchTile(
          pref: SettingsService.hideSpoilers,
          icon: Symbols.visibility_off_rounded,
          title: t.settings.hideSpoilers,
          subtitle: t.settings.hideSpoilersDescription,
        ),
        _requireProfileSelection(),
        SettingSwitchTile(
          pref: SettingsService.autoHidePerformanceOverlay,
          icon: Symbols.speed_rounded,
          title: t.settings.autoHidePerformanceOverlay,
          subtitle: t.settings.autoHidePerformanceOverlayDescription,
        ),
        const SizedBox(height: 24),
      ],
    );
  }



  Widget _densitySelector() {
    return SettingValueBuilder<int>(
      pref: SettingsService.libraryDensity,
      builder: (_, density, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const AppIcon(Symbols.grid_view_rounded, fill: 1),
            const SizedBox(width: 16),
            Text(t.settings.compact, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Expanded(
              child: FocusableSlider(
                value: density.toDouble(),
                min: 1,
                max: 5,
                divisions: 4,
                onChanged: (v) => SettingsService.instanceOrNull!.write(SettingsService.libraryDensity, v.round()),
              ),
            ),
            Text(t.settings.comfortable, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _viewModeSelector() => SettingSegmentedTile<ViewMode, ViewMode>(
    pref: SettingsService.viewMode,
    icon: Symbols.view_list_rounded,
    title: t.settings.viewMode,
    segments: [
      ButtonSegment(value: ViewMode.grid, label: Text(t.settings.gridView)),
      ButtonSegment(value: ViewMode.list, label: Text(t.settings.listView)),
    ],
    decode: (v) => v,
    encode: (v) => v,
  );

  Widget _episodePosterModeSelector() => SettingSegmentedTile<EpisodePosterMode, EpisodePosterMode>(
    pref: SettingsService.episodePosterMode,
    icon: Symbols.image_rounded,
    title: t.settings.episodePosterMode,
    segments: [
      ButtonSegment(value: EpisodePosterMode.seriesPoster, label: Text(t.settings.seriesPoster)),
      ButtonSegment(value: EpisodePosterMode.seasonPoster, label: Text(t.settings.seasonPoster)),
      ButtonSegment(value: EpisodePosterMode.episodeThumbnail, label: Text(t.settings.episodeThumbnail)),
    ],
    decode: (v) => v,
    encode: (v) => v,
  );

  Widget _requireProfileSelection() {
    return Consumer<ActiveProfileProvider>(
      builder: (context, activeProvider, _) {
        if (!activeProvider.hasMultipleProfiles) return const SizedBox.shrink();
        return SettingSwitchTile(
          pref: SettingsService.requireProfileSelectionOnOpen,
          icon: Symbols.person_rounded,
          title: t.settings.requireProfileSelectionOnOpen,
          subtitle: t.settings.requireProfileSelectionOnOpenDescription,
        );
      },
    );
  }



  void _restartApp(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
