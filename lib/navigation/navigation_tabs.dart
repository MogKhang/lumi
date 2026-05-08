import 'package:flutter/material.dart';
import 'package:plezy/widgets/app_icon.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../i18n/strings.g.dart';


/// Navigation tab identifiers
enum NavigationTabId { discover, movies, shows, liveTv, settings }

/// Represents a navigation tab with its configuration
class NavigationTab {
  final NavigationTabId id;
  final bool onlineOnly;
  final IconData icon;
  final String Function() getLabel;

  const NavigationTab({required this.id, required this.onlineOnly, required this.icon, required this.getLabel});

  NavigationDestination toDestination() {
    return NavigationDestination(icon: AppIcon(icon, fill: 1), selectedIcon: AppIcon(icon, fill: 1), label: getLabel());
  }

  /// Get the index for a tab ID in the visible tabs list
  static int indexFor(NavigationTabId id, {required bool isOffline, bool hasLiveTv = false}) {
    final tabs = getVisibleTabs(isOffline: isOffline, hasLiveTv: hasLiveTv);
    return tabs.indexWhere((tab) => tab.id == id);
  }

  /// Get tabs filtered by offline mode and feature availability
  static List<NavigationTab> getVisibleTabs({required bool isOffline, bool hasLiveTv = false}) {
    return allNavigationTabs.where((tab) {
      if (isOffline && tab.onlineOnly) return false;
      if (tab.id == NavigationTabId.liveTv && !hasLiveTv) return false;
      return true;
    }).toList();
  }
}

// Label getters (must be top-level for const constructor)
String _getHomeLabel() => t.common.home;
String _getMoviesLabel() => t.navigation.movies;
String _getShowsLabel() => t.navigation.shows;
String _getLiveTvLabel() => t.navigation.liveTv;
String _getSettingsLabel() => t.common.settings;

/// All navigation tabs in display order
const allNavigationTabs = [
  NavigationTab(id: NavigationTabId.discover, onlineOnly: true, icon: Symbols.home_rounded, getLabel: _getHomeLabel),
  NavigationTab(
    id: NavigationTabId.movies,
    onlineOnly: true,
    icon: Symbols.movie_rounded,
    getLabel: _getMoviesLabel,
  ),
  NavigationTab(
    id: NavigationTabId.shows,
    onlineOnly: true,
    icon: Symbols.tv_rounded,
    getLabel: _getShowsLabel,
  ),
  NavigationTab(id: NavigationTabId.liveTv, onlineOnly: true, icon: Symbols.live_tv_rounded, getLabel: _getLiveTvLabel),
  NavigationTab(
    id: NavigationTabId.settings,
    onlineOnly: false,
    icon: Symbols.settings_rounded,
    getLabel: _getSettingsLabel,
  ),
];
