import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_icon.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../focus/focus_theme.dart';
import '../../focus/focusable_action_bar.dart';
import '../../focus/dpad_navigator.dart';
import '../../focus/input_mode_tracker.dart';
import '../../focus/key_event_utils.dart';
import '../../mixins/tab_navigation_mixin.dart';
import '../../services/plex_client.dart';
import '../../media/media_backend.dart';
import '../../media/media_item.dart';
import '../../media/media_kind.dart';
import '../../media/media_library.dart';
import '../../media/media_server_client.dart';
import '../../providers/hidden_libraries_provider.dart';
import '../../providers/libraries_provider.dart';
import '../../utils/app_logger.dart';
import '../../utils/dialogs.dart';
import '../../utils/platform_detector.dart';
import '../../utils/provider_extensions.dart';
import '../../utils/snackbar_helper.dart';
import '../../utils/content_utils.dart';

import '../../widgets/desktop_app_bar.dart';
import '../../widgets/focusable_popup_menu_button.dart';
import '../../widgets/overlay_sheet.dart';
import '../../services/storage_service.dart';
import '../../mixins/refreshable.dart';
import '../../mixins/item_updatable.dart';
import '../../i18n/strings.g.dart';
import 'state_messages.dart';
import 'tabs/library_browse_tab.dart';

import 'tabs/library_collections_tab.dart';
import 'tabs/library_genres_tab.dart';
import 'tabs/library_playlists_tab.dart';


enum LibraryTabType { browse, collections, genres, playlists }

List<LibraryTabType> _getVisibleTabs(MediaLibrary library) {
  if (library.isShared) return [LibraryTabType.browse, LibraryTabType.playlists];
  // Genres are sourced from Plex's per-section genre filter; only Plex
  // libraries expose the tab.
  if (library.backend == MediaBackend.plex) {
    return [LibraryTabType.browse, LibraryTabType.collections, LibraryTabType.genres, LibraryTabType.playlists];
  }
  return [LibraryTabType.browse, LibraryTabType.collections, LibraryTabType.playlists];
}

/// A menu action item for context menus
class ContextMenuItem {
  final String value;
  final IconData icon;
  final String label;
  final bool requiresConfirmation;
  final String? confirmationTitle;
  final String? confirmationMessage;
  final bool isDestructive;

  const ContextMenuItem({
    required this.value,
    required this.icon,
    required this.label,
    this.requiresConfirmation = false,
    this.confirmationTitle,
    this.confirmationMessage,
    this.isDestructive = false,
  });
}

class LibrariesScreen extends StatefulWidget {
  final VoidCallback? onLibraryOrderChanged;
  final MediaKind? filterKind;

  /// Notifies the parent (MainScreen) when the active library changes from
  /// within this screen — e.g. via the header library picker — so the side
  /// navigation rail's highlight stays in sync.
  final ValueChanged<String>? onLibrarySelected;

  const LibrariesScreen({super.key, this.onLibraryOrderChanged, this.filterKind, this.onLibrarySelected});

  @override
  State<LibrariesScreen> createState() => _LibrariesScreenState();
}

class _LibrariesScreenState extends State<LibrariesScreen>
    with
        Refreshable,
        FullRefreshable,
        FocusableTab,
        LibraryLoadable,
        ItemUpdatable,
        TickerProviderStateMixin,
        TabNavigationMixin {
  // GlobalKeys for tabs to enable refresh

  final _browseTabKey = GlobalKey<LibraryBrowseTabState>();
  final _collectionsTabKey = GlobalKey();
  final _genresTabKey = GlobalKey();
  final _playlistsTabKey = GlobalKey();

  String? _errorMessage;
  String? _selectedLibraryGlobalKey;
  bool _isInitialLoad = true;

  /// Flag to prevent onTabChanged from focusing when we're programmatically changing tabs
  bool _isRestoringTab = false;

  /// Track which tabs have loaded data (used to trigger focus after tab restore)
  final Set<int> _loadedTabs = {};

  // Dynamic visible tabs and their focus nodes
  List<LibraryTabType> _visibleTabs = LibraryTabType.values;
  List<FocusNode> _tabFocusNodes = List.generate(
    LibraryTabType.values.length,
    (i) => FocusNode(debugLabel: 'tab_chip_${LibraryTabType.values[i].name}'),
  );

  @override
  List<FocusNode> get tabChipFocusNodes => _tabFocusNodes;

  /// Focus node for the header library picker (shown when a movie/show kind
  /// has 2+ libraries). Lets TV D-pad reach the picker from the tab row.
  final FocusNode _libraryPickerFocusNode = FocusNode(debugLabel: 'library_picker');

  // App bar action bar
  final _actionBarKey = GlobalKey<FocusableActionBarState>();

  // Scroll controller for the outer CustomScrollView
  final ScrollController _outerScrollController = ScrollController();

  /// Reveal the floating header by jumping the outer NestedScrollView back
  /// to offset 0. The outer position is preserved across content changes
  /// (library switch, library reload, filter/sort change), so any time the
  /// inner is reset to the top we must explicitly resync the outer — the
  /// natural delta-surrender coordination only fires on user scroll gestures.
  ///
  /// Iterates `positions` rather than reading `offset` because the controller
  /// is shared between the simple CustomScrollView (loading/empty/error) and
  /// the NestedScrollView (selected library), and during the transition both
  /// can briefly be attached — `offset` would throw on `_positions.single`.
  void _resetOuterScroll() {
    if (!_outerScrollController.hasClients) return;
    for (final position in _outerScrollController.positions) {
      if (position.pixels > 0) {
        position.jumpTo(0);
      }
    }
  }

  /// Override the mixin's [focusTabBar] so we reveal the floating header
  /// (which contains the tab chips) before requesting focus. Programmatic
  /// requestFocus alone does not snap a floating SliverAppBar back into view.
  @override
  void focusTabBar() {
    _resetOuterScroll();
    super.focusTabBar();
  }

  void focusActionBar() {
    _resetOuterScroll();
    if (_actionBarKey.currentState != null && _actionBarKey.currentState!.widget.actions.isNotEmpty) {
      _actionBarKey.currentState?.requestFocusOnFirst();
    } else {
      focusTabBar();
    }
  }

  @override
  void initState() {
    super.initState();
    initTabNavigation();

    // Initialize with libraries from the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _initializeWithLibraries();
    });
  }

  /// Initialize the screen with libraries from the provider.
  /// This handles initial library selection and content loading.
  Future<void> _initializeWithLibraries() async {
    final librariesProvider = context.read<LibrariesProvider>();
    final hiddenLibrariesProvider = context.read<HiddenLibrariesProvider>();
    await hiddenLibrariesProvider.ensureInitialized();
    final allLibraries = librariesProvider.libraries;

    if (allLibraries.isEmpty) {
      // No libraries available yet
      return;
    }

    // Compute visible libraries for initial load
    final hiddenKeys = hiddenLibrariesProvider.hiddenLibraryKeys;
    var visibleLibraries = allLibraries.where((lib) => !hiddenKeys.contains(lib.globalKey)).toList();

    // Filter by MediaKind if requested
    if (widget.filterKind != null) {
      visibleLibraries = visibleLibraries.where((lib) => lib.kind == widget.filterKind).toList();
    }
    _sortLibrariesAlphabetically(visibleLibraries);

    // Load saved preferences
    final storage = await StorageService.getInstance();
    final savedLibraryKey = storage.getSelectedLibraryKey();

    // Find the library by key in visible libraries
    String? libraryGlobalKeyToLoad;
    if (savedLibraryKey != null) {
      // Check if saved library exists and is visible
      final libraryExists = visibleLibraries.any((lib) => lib.globalKey == savedLibraryKey);
      if (libraryExists) {
        libraryGlobalKeyToLoad = savedLibraryKey;
      }
    }

    // Fallback to first visible library if saved key not found
    if (libraryGlobalKeyToLoad == null && visibleLibraries.isNotEmpty) {
      libraryGlobalKeyToLoad = visibleLibraries.first.globalKey;
    }

    if (libraryGlobalKeyToLoad != null && mounted) {
      unawaited(_loadLibraryContent(libraryGlobalKeyToLoad));
    }
  }

  @override
  void onTabChanged() {
    // Save tab name when changed (but not when restoring from storage)
    if (_selectedLibraryGlobalKey != null && !tabController.indexIsChanging) {
      // Only save if this was a user-initiated tab change, not a restore
      if (!_isRestoringTab) {
        StorageService.getInstance().then((storage) {
          storage.saveLibraryTab(_selectedLibraryGlobalKey!, _visibleTabs[tabController.index].name);
        });

        // Focus first item in the current tab (only for user-initiated changes)
        // But not when navigating via tab bar (suppressAutoFocus is true)
        if (!suppressAutoFocus) {
          _focusCurrentTab();
        }
      }
    }
    // Rebuild to update chip selection state
    super.onTabChanged();
  }

  /// Focus the first item in the currently active tab.
  /// Used for initial load and tab switching - focuses the grid content directly.
  void _focusCurrentTab() {
    // Don't focus during tab animations - wait for animation to complete
    // This prevents race conditions during focus restoration
    if (tabController.indexIsChanging) {
      return;
    }
    // On mobile (touch mode), skip auto-focus to prevent ensureVisible()
    // from interfering with TabBarView page animations
    if (!InputModeTracker.isKeyboardMode(context)) return;

    // Re-enable auto-focus since user is navigating into tab content
    // Only call setState if the value actually changes to avoid unnecessary rebuilds
    if (suppressAutoFocus) {
      setState(() {
        suppressAutoFocus = false;
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final tabState = _getTabState(tabController.index);
      if (tabState != null) {
        (tabState as dynamic).focusFirstItem();
      } else {
        // State not available yet, retry after another frame
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _focusCurrentTabImmediate();
        });
      }
    });
  }

  /// Focus without additional frame delay (used for retry)
  void _focusCurrentTabImmediate() {
    final tabState = _getTabState(tabController.index);
    if (tabState != null) {
      (tabState as dynamic).focusFirstItem();
    }
  }

  /// Focus tab content when navigating DOWN from the tab bar.
  /// For browse tab, this focuses the chips bar first so DOWN navigates to grid.
  /// For other tabs, focuses the first item directly.
  void _focusCurrentTabFromTabBar() {
    if (tabController.indexIsChanging) {
      return;
    }

    if (suppressAutoFocus) {
      setState(() {
        suppressAutoFocus = false;
      });
    }

    // Scroll outer view to top to ensure tab content (including chips bar) is visible
    _resetOuterScroll();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      // If we're on the Browse tab and there are actions, focus the action bar first
      if (_visibleTabs[tabController.index] == LibraryTabType.browse &&
          _actionBarKey.currentState != null &&
          _actionBarKey.currentState!.widget.actions.isNotEmpty) {
        _actionBarKey.currentState?.requestFocusOnFirst();
        return;
      }

      final tabState = _getTabState(tabController.index);
      if (tabState != null) {
        (tabState as dynamic).focusFirstItem();
      }
    });
  }

  /// Get the state for a tab by index
  State? _getTabState(int index) {
    if (index < 0 || index >= _visibleTabs.length) return null;
    return switch (_visibleTabs[index]) {
      LibraryTabType.browse => _browseTabKey.currentState,
      LibraryTabType.collections => _collectionsTabKey.currentState,
      LibraryTabType.genres => _genresTabKey.currentState,
      LibraryTabType.playlists => _playlistsTabKey.currentState,
    };
  }

  /// Handle when a tab's data has finished loading
  void _handleTabDataLoaded(int tabIndex) {
    // Track that this tab has loaded
    _loadedTabs.add(tabIndex);

    // Don't auto-focus if suppressed (e.g., when navigating via tab bar)
    if (suppressAutoFocus) return;

    // Only focus if this is the currently active tab
    if (tabController.index == tabIndex && mounted) {
      // Use post-frame callback to ensure the widget tree is fully built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && tabController.index == tabIndex && !suppressAutoFocus) {
          _focusCurrentTab();
        }
      });
    }
  }

  /// Called by parent when the Libraries screen becomes visible.
  /// If the active tab has already loaded data (often the case after preloading
  /// while on another main tab), re-request focus so the first item is focused
  /// once the screen is actually shown.
  @override
  void focusActiveTabIfReady() {
    if (_selectedLibraryGlobalKey == null) return;
    _focusCurrentTab();
  }

  @override
  void dispose() {
    _outerScrollController.dispose();
    for (final node in _tabFocusNodes) {
      node.dispose();
    }
    _libraryPickerFocusNode.dispose();
    disposeTabNavigation();
    super.dispose();
  }

  void _updateState(VoidCallback fn) {
    if (!mounted) return;
    setState(fn);
  }

  /// Rebuild tab infrastructure when the visible tab set changes.
  void _updateVisibleTabs(List<LibraryTabType> newTabs) {
    if (listEquals(_visibleTabs, newTabs)) return;

    // Save current tab type before changing
    final currentTabType = _visibleTabs.length > tabController.index ? _visibleTabs[tabController.index] : null;

    // Dispose old focus nodes and controller
    for (final node in _tabFocusNodes) {
      node.dispose();
    }
    disposeTabNavigation();

    // Build new
    _visibleTabs = newTabs;
    _tabFocusNodes = List.generate(newTabs.length, (i) => FocusNode(debugLabel: 'tab_chip_${newTabs[i].name}'));
    initTabNavigation();

    // Restore tab position: find current tab type in new set, default to first
    final newIndex = currentTabType != null ? newTabs.indexOf(currentTabType) : -1;
    if (newIndex > 0) {
      tabController.index = newIndex;
    }
  }

  String _getTabLabel(LibraryTabType type) => switch (type) {
    LibraryTabType.browse => t.libraries.tabs.browse,
    LibraryTabType.collections => t.libraries.tabs.collections,
    LibraryTabType.genres => t.libraries.tabs.genres,
    LibraryTabType.playlists => t.libraries.tabs.playlists,
  };

  Widget _buildTabContent(
    LibraryTabType type, {
    required MediaLibrary library,
    required bool isActive,
    required int tabIndex,
  }) {
    return switch (type) {

      LibraryTabType.browse => LibraryBrowseTab(
        key: _browseTabKey,
        library: library,
        isActive: isActive,
        suppressAutoFocus: suppressAutoFocus,
        onDataLoaded: () => _handleTabDataLoaded(tabIndex),
        onBack: focusActionBar,
        onResetScroll: _resetOuterScroll,
        onFiltersChanged: () => setState(() {}),
      ),
      LibraryTabType.collections => LibraryCollectionsTab(
        key: _collectionsTabKey,
        library: library,
        isActive: isActive,
        suppressAutoFocus: suppressAutoFocus,
        onDataLoaded: () => _handleTabDataLoaded(tabIndex),
        onBack: focusTabBar,
      ),
      LibraryTabType.genres => LibraryGenresTab(
        key: _genresTabKey,
        library: library,
        isActive: isActive,
        suppressAutoFocus: suppressAutoFocus,
        onDataLoaded: () => _handleTabDataLoaded(tabIndex),
        onBack: focusTabBar,
      ),
      LibraryTabType.playlists => LibraryPlaylistsTab(
        key: _playlistsTabKey,
        library: library,
        isActive: isActive,
        suppressAutoFocus: suppressAutoFocus,
        onDataLoaded: () => _handleTabDataLoaded(tabIndex),
        onBack: focusTabBar,
      ),
    };
  }



  /// Notify parent that library order changed
  void _notifyLibraryOrderChanged() {
    widget.onLibraryOrderChanged?.call();
  }

  /// Public method to load a library by key (called from MainScreen side nav)
  @override
  void loadLibraryByKey(String libraryGlobalKey) {
    _loadLibraryContent(libraryGlobalKey);
  }

  Future<void> _loadLibraryContent(String libraryGlobalKey) async {
    final librariesProvider = context.read<LibrariesProvider>();
    final allLibraries = librariesProvider.libraries;

    // Resolve from allLibraries — hidden libraries are still navigable from the
    // sidebar's "Hidden libraries" section.
    final selectedLibrary = allLibraries.where((lib) => lib.globalKey == libraryGlobalKey).firstOrNull;
    if (selectedLibrary == null) return;

    final isLibraryChange = _selectedLibraryGlobalKey != libraryGlobalKey;

    // Update visible tabs and state in the same synchronous block so no
    // intermediate rebuild can see a mismatched controller/key pair.
    _updateVisibleTabs(_getVisibleTabs(selectedLibrary));

    _updateState(() {
      _selectedLibraryGlobalKey = libraryGlobalKey;
      _errorMessage = null;
      // Clear loaded tabs tracking for new library
      _loadedTabs.clear();
    });

    // Keep the side nav rail highlight in sync when the change originated here
    // (header picker). No-op cost when MainScreen already drove the change.
    if (isLibraryChange) {
      widget.onLibrarySelected?.call(libraryGlobalKey);
    }

    // The new TabBarView mounts with fresh inner positions at offset 0;
    // bring the floating header back too. Also covers the case where the
    // newly-active tab is not browse (which would otherwise have no inner
    // jumpTo to catch via the browse-tab callback).
    if (isLibraryChange) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _resetOuterScroll();
      });
    }

    // Mark that initial load is complete
    if (_isInitialLoad) {
      _isInitialLoad = false;
    }

    // Save selected library key and restore saved tab (async — safe after state is consistent)
    final storage = await StorageService.getInstance();
    if (!mounted) return;
    await storage.saveSelectedLibraryKey(libraryGlobalKey);

    // Restore saved tab by name
    final savedTabName = storage.getLibraryTab(libraryGlobalKey);
    final savedType = LibraryTabType.values.where((t) => t.name == savedTabName).firstOrNull;
    final targetTabIndex = savedType != null ? _visibleTabs.indexOf(savedType) : -1;
    if (targetTabIndex > 0) {
      // Set flag to prevent _onTabChanged from triggering focus
      _isRestoringTab = true;
      // Use animateTo with zero duration for instant switch without animation race conditions
      tabController.animateTo(targetTabIndex, duration: Duration.zero);
      // Clear flag synchronously - animateTo with zero duration completes immediately
      _isRestoringTab = false;
    }

    // Focus is handled by onDataLoaded callbacks from each tab.
    // However, on first load the tab might finish loading before the tab index
    // is restored. Check if the current tab has already loaded and focus if so.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _selectedLibraryGlobalKey == libraryGlobalKey && _loadedTabs.contains(tabController.index)) {
        _focusCurrentTab();
      }
    });
  }

  @override
  void updateItemInLists(String itemId, MediaItem updatedItem) {
    // Delegate to the active tab — parent doesn't maintain its own item list
  }

  // Public method to refresh content (for normal navigation)
  @override
  void refresh() {
    // Reinitialize with current libraries
    _initializeWithLibraries();
  }



  // Public method to fully reload all content (for profile switches)
  @override
  void fullRefresh() {
    appLogger.d('LibrariesScreen.fullRefresh() called - reloading all content');
    setState(() {
      _selectedLibraryGlobalKey = null;
      _errorMessage = null;
    });

    // Reinitialize with current libraries from provider
    _initializeWithLibraries();
  }

  Future<void> _toggleLibraryVisibility(MediaLibrary library) async {
    if (!mounted) return;
    final librariesProvider = context.read<LibrariesProvider>();
    final hiddenLibrariesProvider = Provider.of<HiddenLibrariesProvider>(context, listen: false);
    final isHidden = hiddenLibrariesProvider.hiddenLibraryKeys.contains(library.globalKey);

    if (isHidden) {
      await hiddenLibrariesProvider.unhideLibrary(library.globalKey);
    } else {
      // Check if we're hiding the currently selected library
      final isCurrentlySelected = _selectedLibraryGlobalKey == library.globalKey;

      await hiddenLibrariesProvider.hideLibrary(library.globalKey);

      // If we just hid the selected library, select the first visible one
      if (isCurrentlySelected) {
        // Compute visible libraries after hiding
        final allLibraries = librariesProvider.libraries;
        final visibleLibraries = allLibraries
            .where((lib) => !hiddenLibrariesProvider.hiddenLibraryKeys.contains(lib.globalKey))
            .toList();

        if (visibleLibraries.isNotEmpty) {
          unawaited(_loadLibraryContent(visibleLibraries.first.globalKey));
        }
      }
    }
  }

  List<ContextMenuItem> _getLibraryMenuItems(MediaLibrary library) {
    // Refresh metadata is the only admin action both backends support — Plex
    // hits `/library/sections/{id}/refresh?force=1`, Jellyfin posts to
    // `/Items/{id}/Refresh` (the library view is itself an item).
    final refresh = ContextMenuItem(
      value: 'refresh',
      icon: Symbols.sync_rounded,
      label: t.libraries.refreshMetadata,
      requiresConfirmation: true,
      confirmationTitle: t.libraries.refreshMetadata,
      confirmationMessage: t.libraries.refreshMetadataConfirm(title: library.title),
      isDestructive: true,
    );
    // Scan / analyze / empty trash hit Plex-only endpoints. Gating them keeps
    // [getPlexClientForLibrary] from falling back through `_resolveClient` to
    // the first online Plex server and firing the action against the wrong
    // backend.
    if (library.backend != MediaBackend.plex) return [refresh];
    return [
      ContextMenuItem(
        value: 'scan',
        icon: Symbols.refresh_rounded,
        label: t.libraries.scanLibraryFiles,
        requiresConfirmation: true,
        confirmationTitle: t.libraries.scanLibrary,
        confirmationMessage: t.libraries.scanLibraryConfirm(title: library.title),
      ),
      ContextMenuItem(
        value: 'analyze',
        icon: Symbols.analytics_rounded,
        label: t.libraries.analyze,
        requiresConfirmation: true,
        confirmationTitle: t.libraries.analyzeLibrary,
        confirmationMessage: t.libraries.analyzeLibraryConfirm(title: library.title),
      ),
      refresh,
      ContextMenuItem(
        value: 'empty_trash',
        icon: Symbols.delete_outline_rounded,
        label: t.libraries.emptyTrash,
        requiresConfirmation: true,
        confirmationTitle: t.libraries.emptyTrash,
        confirmationMessage: t.libraries.emptyTrashConfirm(title: library.title),
        isDestructive: true,
      ),
    ];
  }

  Future<void> _handleLibraryMenuAction(String action, MediaLibrary library) async {
    // Find the menu item for confirmation details
    final menuItems = _getLibraryMenuItems(library);
    final item = menuItems.where((i) => i.value == action).firstOrNull;
    if (item == null) return;

    if (item.requiresConfirmation) {
      final confirmed = await showConfirmDialog(
        context,
        title: item.confirmationTitle ?? t.dialog.confirmAction,
        message: item.confirmationMessage ?? t.libraries.confirmActionMessage,
        confirmText: t.common.confirm,
        isDestructive: item.isDestructive,
      );
      if (!confirmed) return;
    }

    switch (action) {
      case 'scan':
        unawaited(_scanLibrary(library));
        break;
      case 'analyze':
        unawaited(_analyzeLibrary(library));
        break;
      case 'refresh':
        unawaited(_refreshLibraryMetadata(library));
        break;
      case 'empty_trash':
        unawaited(_emptyLibraryTrash(library));
        break;
    }
  }

  void _showLibraryManagementSheet() {
    final librariesProvider = context.read<LibrariesProvider>();
    final hiddenLibrariesProvider = Provider.of<HiddenLibrariesProvider>(context, listen: false);
    final allLibraries = librariesProvider.libraries;

    if (PlatformDetector.isTV()) {
      showDialog(
        context: context,
        builder: (context) => _LibraryManagementSheet(
          isDialog: true,
          allLibraries: List.from(allLibraries),
          hiddenLibraryKeys: hiddenLibrariesProvider.hiddenLibraryKeys,
          onReorder: (reorderedLibraries) {
            librariesProvider.updateLibraryOrder(reorderedLibraries);
            _notifyLibraryOrderChanged();
          },
          onToggleVisibility: _toggleLibraryVisibility,
          getLibraryMenuItems: _getLibraryMenuItems,
          onLibraryMenuAction: _handleLibraryMenuAction,
        ),
      );
    } else {
      OverlaySheetController.of(context).show(
        showDragHandle: true,
        builder: (context) => _LibraryManagementSheet(
          allLibraries: List.from(allLibraries),
          hiddenLibraryKeys: hiddenLibrariesProvider.hiddenLibraryKeys,
          onReorder: (reorderedLibraries) {
            librariesProvider.updateLibraryOrder(reorderedLibraries);
            _notifyLibraryOrderChanged();
          },
          onToggleVisibility: _toggleLibraryVisibility,
          getLibraryMenuItems: _getLibraryMenuItems,
          onLibraryMenuAction: _handleLibraryMenuAction,
        ),
      );
    }
  }

  Future<void> _performLibraryAction({
    required MediaLibrary library,
    required Future<void> Function(PlexClient client) action,
    required String progressMessage,
    required String successMessage,
    required String Function(Object error) failureMessage,
  }) async {
    try {
      final client = context.getPlexClientForLibrary(library);

      if (mounted) {
        showAppSnackBar(context, progressMessage, duration: const Duration(seconds: 2));
      }

      await action(client);

      if (mounted) {
        showSuccessSnackBar(context, successMessage);
      }
    } catch (e) {
      appLogger.e('Library action failed', error: e);
      if (mounted) {
        showErrorSnackBar(context, failureMessage(e));
      }
    }
  }

  /// Backend-neutral counterpart to [_performLibraryAction] for ops that exist
  /// on the [MediaServerClient] interface (currently just refresh metadata).
  /// Resolves the client through `getMediaClientForLibrary` so a Jellyfin
  /// library is routed to its own server, not a fallback Plex one.
  Future<void> _performMediaLibraryAction({
    required MediaLibrary library,
    required Future<void> Function(MediaServerClient client) action,
    required String progressMessage,
    required String successMessage,
    required String Function(Object error) failureMessage,
  }) async {
    try {
      final client = context.getMediaClientForLibrary(library);

      if (mounted) {
        showAppSnackBar(context, progressMessage, duration: const Duration(seconds: 2));
      }

      await action(client);

      if (mounted) {
        showSuccessSnackBar(context, successMessage);
      }
    } catch (e) {
      appLogger.e('Library action failed', error: e);
      if (mounted) {
        showErrorSnackBar(context, failureMessage(e));
      }
    }
  }

  Future<void> _scanLibrary(MediaLibrary library) {
    return _performLibraryAction(
      library: library,
      action: (client) => client.scanLibrary(library.id),
      progressMessage: t.messages.libraryScanning(title: library.title),
      successMessage: t.messages.libraryScanStarted(title: library.title),
      failureMessage: (error) => t.messages.libraryScanFailed(error: error.toString()),
    );
  }

  Future<void> _refreshLibraryMetadata(MediaLibrary library) {
    return _performMediaLibraryAction(
      library: library,
      action: (client) => client.refreshLibraryMetadata(library.id),
      progressMessage: t.messages.metadataRefreshing(title: library.title),
      successMessage: t.messages.metadataRefreshStarted(title: library.title),
      failureMessage: (error) => t.messages.metadataRefreshFailed(error: error.toString()),
    );
  }

  Future<void> _emptyLibraryTrash(MediaLibrary library) {
    return _performLibraryAction(
      library: library,
      action: (client) => client.emptyLibraryTrash(library.id),
      progressMessage: t.libraries.emptyingTrash(title: library.title),
      successMessage: t.libraries.trashEmptied(title: library.title),
      failureMessage: (error) => t.libraries.failedToEmptyTrash(error: error),
    );
  }

  Future<void> _analyzeLibrary(MediaLibrary library) {
    return _performLibraryAction(
      library: library,
      action: (client) => client.analyzeLibrary(library.id),
      progressMessage: t.libraries.analyzing(title: library.title),
      successMessage: t.libraries.analysisStarted(title: library.title),
      failureMessage: (error) => t.libraries.failedToAnalyze(error: error),
    );
  }

  /// Sort libraries by their display title, case-insensitively.
  void _sortLibrariesAlphabetically(List<MediaLibrary> libraries) {
    libraries.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
  }

  /// Header dropdown for switching between libraries of the current kind.
  /// Returns null when there are fewer than two libraries (nothing to pick),
  /// so movie/show kinds with a single library keep the current behaviour.
  Widget? _buildLibraryPicker(List<MediaLibrary> libraries, MediaLibrary? selectedLibrary) {
    if (libraries.length < 2) return null;

    final theme = Theme.of(context);
    final label = selectedLibrary?.title ?? libraries.first.title;

    return FocusablePopupMenuButton<String>(
      focusNode: _libraryPickerFocusNode,
      tooltip: t.libraries.title,
      onSelected: (globalKey) => unawaited(_loadLibraryContent(globalKey)),
      onNavigateLeft: onTabBarBack,
      onNavigateRight: () => getTabChipFocusNode(0).requestFocus(),
      onNavigateDown: _focusCurrentTabFromTabBar,
      icon: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 220),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const AppIcon(Symbols.arrow_drop_down_rounded, fill: 1),
          ],
        ),
      ),
      itemBuilder: (_) => [
        for (final library in libraries)
          PopupMenuItem<String>(
            value: library.globalKey,
            child: Row(
              children: [
                SizedBox(
                  width: 28,
                  child: library.globalKey == selectedLibrary?.globalKey
                      ? const AppIcon(Symbols.check_rounded, fill: 1)
                      : null,
                ),
                Expanded(child: Text(library.title, overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildAppBarTitle(MediaLibrary? selectedLibrary, List<MediaLibrary> libraries) {
    final useLogo = widget.filterKind == MediaKind.movie || widget.filterKind == MediaKind.show;

    final titleWidget = useLogo
        ? Image.asset(
            'assets/lumi-text.png',
            width: 100,
            filterQuality: FilterQuality.medium,
          )
        : Text(
            selectedLibrary?.title ?? t.libraries.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          );

    // Library dropdown — only when this movie/show kind has 2+ libraries.
    final picker = useLogo ? _buildLibraryPicker(libraries, selectedLibrary) : null;

    // On desktop/TV with side nav, show title and tabs in app bar
    if (PlatformDetector.shouldUseSideNavigation(context)) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget,
          if (picker != null) ...[const SizedBox(width: 12), picker],
          const SizedBox(width: 24),
          for (int i = 0; i < _visibleTabs.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            buildTabChip(
              _getTabLabel(_visibleTabs[i]),
              i,
              onSelectWhenActive: _focusCurrentTab,
              onNavigateDown: _focusCurrentTabFromTabBar,
              onNavigateRightFromLast:
                  () => PlatformDetector.isTV() ? null : _actionBarKey.currentState?.requestFocusOnFirst(),
              onNavigateLeftFromFirst: picker != null ? () => _libraryPickerFocusNode.requestFocus() : null,
            ),
          ],
        ],
      );
    }

    // On mobile, the title is shown here; tabs are moved to the AppBar bottom
    if (picker != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget,
          const SizedBox(width: 12),
          picker,
        ],
      );
    }
    return titleWidget;
  }

  PreferredSizeWidget? _buildMobileTabBar() {
    if (PlatformDetector.shouldUseSideNavigation(context) || _selectedLibraryGlobalKey == null) {
      return null;
    }

    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < _visibleTabs.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                buildTabChip(
                  _getTabLabel(_visibleTabs[i]),
                  i,
                  onSelectWhenActive: _focusCurrentTab,
                  onNavigateDown: _focusCurrentTabFromTabBar,
                  onNavigateRightFromLast: () => _actionBarKey.currentState?.requestFocusOnFirst(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildTVActionBar() {
    if (!PlatformDetector.isTV() || _selectedLibraryGlobalKey == null) {
      return null;
    }

    // Only show for Browse tab currently
    if (_visibleTabs.isEmpty || tabController.index >= _visibleTabs.length) return null;
    if (_visibleTabs[tabController.index] != LibraryTabType.browse) return null;

    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: _buildFocusableActionBar(),
      ),
    );
  }

  Widget _buildFocusableActionBar() {
    return FocusableActionBar(
      key: _actionBarKey,
      onNavigateLeft: () => getTabChipFocusNode(_visibleTabs.length - 1).requestFocus(),
      onNavigateDown: () {
        if (suppressAutoFocus) {
          setState(() {
            suppressAutoFocus = false;
          });
        }
        _resetOuterScroll();
        _focusCurrentTabImmediate();
      },
      onNavigateUp: focusTabBar,
      actions: [
        if (_visibleTabs.isNotEmpty &&
            tabController.index < _visibleTabs.length &&
            _visibleTabs[tabController.index] == LibraryTabType.browse) ...[
          FocusableAction(
            tooltip: t.libraries.filters,
            onPressed: () => _browseTabKey.currentState?.showFiltersBottomSheet(),
            child: IconButton(
              onPressed: () => _browseTabKey.currentState?.showFiltersBottomSheet(),
              icon: Badge(
                label: Text(_browseTabKey.currentState?.selectedFiltersCount.toString() ?? '0'),
                isLabelVisible: (_browseTabKey.currentState?.selectedFiltersCount ?? 0) > 0,
                child: const AppIcon(Symbols.filter_alt_rounded),
              ),
            ),
          ),
          FocusableAction(
            tooltip: _browseTabKey.currentState?.selectedSortLabel ?? t.libraries.sort,
            onPressed: () => _browseTabKey.currentState?.showSortBottomSheet(),
            child: IconButton(
              onPressed: () => _browseTabKey.currentState?.showSortBottomSheet(),
              icon: Badge(
                isLabelVisible: _browseTabKey.currentState?.isSortDescending ?? false,
                label: const AppIcon(Symbols.arrow_downward_rounded, size: 10, color: Colors.white),
                child: const AppIcon(Symbols.sort_rounded),
              ),
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    // Watch libraries provider for updates
    final librariesProvider = context.watch<LibrariesProvider>();
    final allLibraries = librariesProvider.libraries;
    final isLoadingLibraries = librariesProvider.isLoading;

    // Watch for hidden libraries changes to trigger rebuild
    final hiddenLibrariesProvider = context.watch<HiddenLibrariesProvider>();
    final hiddenKeys = hiddenLibrariesProvider.hiddenLibraryKeys;

    // Compute visible libraries (filtered from all libraries), alphabetically
    // ordered so the picker list and the default selection are consistent.
    var visibleLibraries = allLibraries.where((lib) => !hiddenKeys.contains(lib.globalKey)).toList();
    if (widget.filterKind != null) {
      visibleLibraries = visibleLibraries.where((lib) => lib.kind == widget.filterKind).toList();
    }
    _sortLibrariesAlphabetically(visibleLibraries);

    // Resolve selected library defensively — may be null if server temporarily dropped during refresh
    final selectedLibrary = _selectedLibraryGlobalKey != null
        ? allLibraries.where((lib) => lib.globalKey == _selectedLibraryGlobalKey).firstOrNull
        : null;

    // Auto-select first library if current selection is missing or invalid
    if (selectedLibrary == null &&
        visibleLibraries.isNotEmpty &&
        !isLoadingLibraries) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _initializeWithLibraries();
        }
      });
    }

    Widget appBar({required bool pinned, bool? isFloating}) {
      final isTV = PlatformDetector.isTV();
      return DesktopSliverAppBar(
        title: _buildAppBarTitle(selectedLibrary, visibleLibraries),
        pinned: pinned,
        floating: isFloating ?? false,
        snap: isFloating ?? false,
        bottom: isTV ? _buildTVActionBar() : _buildMobileTabBar(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          if (!isTV) _buildFocusableActionBar(),
        ],
      );
    }

    Widget buildSimpleScroll({required Widget body}) {
      return CustomScrollView(
        controller: _outerScrollController,
        slivers: [
          appBar(pinned: false),
          SliverFillRemaining(child: body),
        ],
      );
    }

    Widget body;
    if (isLoadingLibraries) {
      body = buildSimpleScroll(body: const Center(child: CircularProgressIndicator()));
    } else if (_errorMessage != null && visibleLibraries.isEmpty && selectedLibrary == null) {
      body = buildSimpleScroll(
        body: ErrorStateWidget(
          message: _errorMessage!,
          icon: Symbols.error_outline_rounded,
          onRetry: () {
            final librariesProvider = context.read<LibrariesProvider>();
            librariesProvider.refresh();
          },
        ),
      );
    } else if (visibleLibraries.isEmpty && selectedLibrary == null) {
      body = buildSimpleScroll(
        body: allLibraries.isEmpty
            ? EmptyStateWidget(message: t.libraries.noLibrariesFound, icon: Symbols.video_library_rounded)
            : EmptyStateWidget(
                message: t.libraries.allLibrariesHidden,
                icon: Symbols.visibility_off_rounded,
                onAction: _showLibraryManagementSheet,
                actionLabel: t.libraries.manageLibraries,
                actionIcon: Symbols.edit_rounded,
              ),
      );
    } else if (selectedLibrary != null) {
      body = NestedScrollView(
        controller: _outerScrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: appBar(pinned: true),
          ),
        ],
        body: TabBarView(
          key: ValueKey(_selectedLibraryGlobalKey),
          controller: tabController,
          // Disable swipe on desktop - trackpad scrolling triggers accidental tab switches
          // See: https://github.com/flutter/flutter/issues/11132
          physics: PlatformDetector.isDesktop(context) ? const NeverScrollableScrollPhysics() : null,
          // Wrap each tab in ClipRect so horizontal overflow (e.g. hub rows
          // with Clip.none) doesn't bleed into adjacent tabs during swipe transitions.
          children: [
            for (int i = 0; i < _visibleTabs.length; i++)
              ClipRect(
                child: _buildTabContent(
                  _visibleTabs[i],
                  library: selectedLibrary,
                  isActive: tabController.index == i,
                  tabIndex: i,
                ),
              ),
          ],
        ),
      );
    } else {
      body = buildSimpleScroll(body: const SizedBox.shrink());
    }

    return Scaffold(
      body: ScrollConfiguration(behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false), child: body),
    );
  }
}

class _LibraryManagementSheet extends StatefulWidget {
  final bool isDialog;
  final List<MediaLibrary> allLibraries;
  final Set<String> hiddenLibraryKeys;
  final Function(List<MediaLibrary>) onReorder;
  final Function(MediaLibrary) onToggleVisibility;
  final List<ContextMenuItem> Function(MediaLibrary) getLibraryMenuItems;
  final void Function(String action, MediaLibrary library) onLibraryMenuAction;

  const _LibraryManagementSheet({
    this.isDialog = false,
    required this.allLibraries,
    required this.hiddenLibraryKeys,
    required this.onReorder,
    required this.onToggleVisibility,
    required this.getLibraryMenuItems,
    required this.onLibraryMenuAction,
  });

  @override
  State<_LibraryManagementSheet> createState() => _LibraryManagementSheetState();
}

class _LibraryManagementSheetState extends State<_LibraryManagementSheet> {
  late List<MediaLibrary> _tempLibraries;

  // Keyboard navigation state
  int _focusedIndex = 0;
  int _focusedColumn = 0; // 0 = row, 1 = visibility button, 2 = options button
  int? _movingIndex; // Non-null when in move mode
  int? _originalIndex; // Original position before move (for cancel)
  List<MediaLibrary>? _originalOrder; // Original order before move (for cancel)
  final FocusNode _listFocusNode = FocusNode();
  final ScrollController _dialogScrollController = ScrollController();
  bool _backKeyDownSeen = false;

  @override
  void initState() {
    super.initState();
    _tempLibraries = List.from(widget.allLibraries);
  }

  @override
  void dispose() {
    _listFocusNode.dispose();
    _dialogScrollController.dispose();
    super.dispose();
  }

  void _ensureFocusedVisible() {
    if (!widget.isDialog) return;
    if (!_dialogScrollController.hasClients) return;

    const double itemHeight = 72.0; // Material ListTile with subtitle
    const double listTopPadding = 8.0;
    final double targetTop = listTopPadding + (_focusedIndex * itemHeight);
    final double targetBottom = targetTop + itemHeight;

    final double viewportTop = _dialogScrollController.offset;
    final double viewportHeight = _dialogScrollController.position.viewportDimension;
    final double viewportBottom = viewportTop + viewportHeight;

    // Already fully visible — skip
    if (targetTop >= viewportTop && targetBottom <= viewportBottom) return;

    // Place item at ~25% from top of viewport
    final double destination = (targetTop - viewportHeight * 0.25).clamp(
      0.0,
      _dialogScrollController.position.maxScrollExtent,
    );

    _dialogScrollController.animateTo(destination, duration: const Duration(milliseconds: 150), curve: Curves.easeOut);
  }

  KeyEventResult _handleKeyEvent(FocusNode _, KeyEvent event) {
    final key = event.logicalKey;

    // Track back key down/up pairing. If focus was elsewhere during KeyDown
    // (e.g., on a bottom sheet) and returns here before KeyUp, we get a stray
    // KeyUp that would incorrectly pop the dialog. Consume it instead.
    if (key.isBackKey) {
      if (event is KeyDownEvent) {
        _backKeyDownSeen = true;
      } else if (event is KeyUpEvent && !_backKeyDownSeen) {
        return KeyEventResult.handled;
      }
      if (event is KeyUpEvent) {
        _backKeyDownSeen = false;
      }
    }

    final backResult = handleBackKeyAction(event, () {
      if (_movingIndex != null) {
        // Cancel move - restore original position
        setState(() {
          if (_originalOrder != null) {
            _tempLibraries = List.from(_originalOrder!);
          }
          _focusedIndex = _originalIndex ?? 0;
          _movingIndex = null;
          _originalIndex = null;
          _originalOrder = null;
        });
      } else {
        OverlaySheetController.popAdaptive(context);
      }
    });
    if (backResult != KeyEventResult.ignored) {
      return backResult;
    }

    if (!event.isActionable) return KeyEventResult.ignored;

    if (_movingIndex != null) {
      // Move mode - arrows reorder the item
      if (key.isUpKey && _movingIndex! > 0) {
        setState(() {
          final item = _tempLibraries.removeAt(_movingIndex!);
          _tempLibraries.insert(_movingIndex! - 1, item);
          _movingIndex = _movingIndex! - 1;
          _focusedIndex = _movingIndex!;
        });
        _ensureFocusedVisible();
        return KeyEventResult.handled;
      }
      if (key.isDownKey && _movingIndex! < _tempLibraries.length - 1) {
        setState(() {
          final item = _tempLibraries.removeAt(_movingIndex!);
          _tempLibraries.insert(_movingIndex! + 1, item);
          _movingIndex = _movingIndex! + 1;
          _focusedIndex = _movingIndex!;
        });
        _ensureFocusedVisible();
        return KeyEventResult.handled;
      }
      if (key.isSelectKey) {
        // Confirm move - apply the reorder
        widget.onReorder(_tempLibraries);
        setState(() {
          _movingIndex = null;
          _originalIndex = null;
          _originalOrder = null;
        });
        return KeyEventResult.handled;
      }
    } else {
      // Navigation mode
      if (key.isUpKey && _focusedIndex > 0) {
        setState(() {
          _focusedIndex--;
          _focusedColumn = 0; // Reset to row when changing rows
        });
        _ensureFocusedVisible();
        return KeyEventResult.handled;
      }
      if (key.isDownKey && _focusedIndex < _tempLibraries.length - 1) {
        setState(() {
          _focusedIndex++;
          _focusedColumn = 0; // Reset to row when changing rows
        });
        _ensureFocusedVisible();
        return KeyEventResult.handled;
      }
      if (key.isLeftKey && _focusedColumn > 0) {
        setState(() => _focusedColumn--);
        return KeyEventResult.handled;
      }
      if (key.isRightKey && _focusedColumn < 2) {
        setState(() => _focusedColumn++);
        return KeyEventResult.handled;
      }
      if (key.isSelectKey) {
        if (_focusedColumn == 0) {
          // Enter move mode
          setState(() {
            _movingIndex = _focusedIndex;
            _originalIndex = _focusedIndex;
            _originalOrder = List.from(_tempLibraries);
          });
        } else if (_focusedColumn == 1) {
          // Toggle visibility
          final library = _tempLibraries[_focusedIndex];
          widget.onToggleVisibility(library);
        } else if (_focusedColumn == 2) {
          // Show options menu
          final library = _tempLibraries[_focusedIndex];
          _showLibraryMenuBottomSheet(context, library);
        }
        return KeyEventResult.handled;
      }
    }

    // Block d-pad keys at boundaries so focus doesn't escape the dialog
    if (key.isDpadDirection) {
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _reorderLibraries(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final library = _tempLibraries.removeAt(oldIndex);
      _tempLibraries.insert(newIndex, library);
    });
    // Apply immediately
    widget.onReorder(_tempLibraries);
  }

  void _showLibraryMenuBottomSheet(BuildContext outerContext, MediaLibrary library) {
    final menuItems = widget.getLibraryMenuItems(library);
    OverlaySheetController.pushAdaptive<String>(
      outerContext,
      builder: (context) => SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(library.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
            ...menuItems.indexed.map(
              (entry) => ListTile(
                leading: AppIcon(entry.$2.icon, fill: 1),
                title: Text(entry.$2.label),
                onTap: () {
                  // Close the entire overlay sheet, then let the parent handle
                  // confirmation and execution (parent state is always mounted)
                  OverlaySheetController.closeAdaptive(context);
                  widget.onLibraryMenuAction(entry.$2.value, library);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get set of library names that appear more than once (not globally unique)
  Set<String> _getNonUniqueLibraryNames() {
    final nameCounts = <String, int>{};
    for (final lib in _tempLibraries) {
      nameCounts[lib.title] = (nameCounts[lib.title] ?? 0) + 1;
    }
    return nameCounts.entries.where((e) => e.value > 1).map((e) => e.key).toSet();
  }

  @override
  Widget build(BuildContext context) {
    // Watch provider to rebuild when hidden libraries change
    final hiddenLibrariesProvider = context.watch<HiddenLibrariesProvider>();
    final hiddenLibraryKeys = hiddenLibrariesProvider.hiddenLibraryKeys;

    if (widget.isDialog) {
      return Dialog(
        child: PopScope(
          canPop: false, // Prevent system back from double-popping; handled by _handleKeyEvent
          // ignore: no-empty-block - required callback, blocks system back on Android TV
          onPopInvokedWithResult: (didPop, result) {},
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  const AppIcon(Symbols.edit_rounded, fill: 1),
                  const SizedBox(width: 12),
                  Text(t.libraries.manageLibraries),
                ],
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const AppIcon(Symbols.close_rounded, fill: 1),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            body: Focus(
              focusNode: _listFocusNode,
              autofocus: InputModeTracker.isKeyboardMode(context),
              onKeyEvent: _handleKeyEvent,
              child: _buildFlatLibraryListDialog(hiddenLibraryKeys),
            ),
          ),
        ),
      );
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
              ),
              child: Row(
                children: [
                  const AppIcon(Symbols.edit_rounded, fill: 1),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      t.libraries.manageLibraries,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: const AppIcon(Symbols.close_rounded, fill: 1),
                    onPressed: () => OverlaySheetController.popAdaptive(context),
                  ),
                ],
              ),
            ),

            // Library list (grouped by server if multiple servers)
            Expanded(
              child: Focus(
                focusNode: _listFocusNode,
                autofocus: InputModeTracker.isKeyboardMode(context),
                onKeyEvent: _handleKeyEvent,
                child: _buildFlatLibraryList(scrollController, hiddenLibraryKeys),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Build library list for dialog (TV) using ListView with scroll-into-view support
  Widget _buildFlatLibraryListDialog(Set<String> hiddenLibraryKeys) {
    final nonUniqueNames = _getNonUniqueLibraryNames();
    final isKeyboardMode = InputModeTracker.isKeyboardMode(context);

    return ReorderableListView.builder(
      scrollController: _dialogScrollController,
      onReorder: _reorderLibraries,
      itemCount: _tempLibraries.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final library = _tempLibraries[index];
        final showServerName = nonUniqueNames.contains(library.title) && library.serverName != null;
        final isFocused = isKeyboardMode && index == _focusedIndex;
        final isMoving = index == _movingIndex;

        return _buildLibraryTile(
          library,
          index,
          hiddenLibraryKeys,
          showServerName: showServerName,
          isFocused: isFocused,
          isMoving: isMoving,
          focusedColumn: isFocused ? _focusedColumn : null,
        );
      },
    );
  }

  /// Build flat library list with server subtitle for non-unique names
  Widget _buildFlatLibraryList(ScrollController scrollController, Set<String> hiddenLibraryKeys) {
    final nonUniqueNames = _getNonUniqueLibraryNames();
    final isKeyboardMode = InputModeTracker.isKeyboardMode(context);

    return ReorderableListView.builder(
      scrollController: scrollController,
      onReorder: _reorderLibraries,
      itemCount: _tempLibraries.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final library = _tempLibraries[index];
        final showServerName = nonUniqueNames.contains(library.title) && library.serverName != null;
        final isFocused = isKeyboardMode && index == _focusedIndex;
        final isMoving = index == _movingIndex;
        return _buildLibraryTile(
          library,
          index,
          hiddenLibraryKeys,
          showServerName: showServerName,
          isFocused: isFocused,
          isMoving: isMoving,
          focusedColumn: isFocused ? _focusedColumn : null,
        );
      },
    );
  }

  /// Build a single library tile
  Widget _buildLibraryTile(
    MediaLibrary library,
    int index,
    Set<String> hiddenLibraryKeys, {
    bool showServerName = false,
    bool isFocused = false,
    bool isMoving = false,
    int? focusedColumn,
  }) {
    final isHidden = hiddenLibraryKeys.contains(library.globalKey);
    final colorScheme = Theme.of(context).colorScheme;

    // Determine background color based on state
    Color? tileColor;
    if (isMoving) {
      tileColor = colorScheme.primaryContainer;
    } else if (isFocused && focusedColumn == 0) {
      // Only highlight row when row itself is focused (column 0)
      tileColor = colorScheme.surfaceContainerHighest;
    }

    // Button focus states
    final isVisibilityButtonFocused = isFocused && focusedColumn == 1;
    final isOptionsButtonFocused = isFocused && focusedColumn == 2;

    return Opacity(
      key: ValueKey(library.globalKey),
      opacity: isHidden ? 0.5 : 1.0,
      child: Container(
        decoration: BoxDecoration(color: tileColor),
        child: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReorderableDragStartListener(
                index: index,
                child: AppIcon(
                  isMoving ? Symbols.swap_vert_rounded : Symbols.drag_indicator_rounded,
                  fill: 1,
                  color: isMoving ? colorScheme.primary : IconTheme.of(context).color?.withValues(alpha: 0.5),
                ),
              ),
              const SizedBox(width: 8),
              AppIcon(ContentTypeHelper.getLibraryIcon(library.kind.id), fill: 1),
            ],
          ),
          title: Text(library.title),
          subtitle: showServerName
              ? Text(
                  library.serverName!,
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                  ),
                )
              : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: FocusTheme.focusBackgroundDecoration(
                  context,
                  isFocused: isVisibilityButtonFocused,
                  borderRadius: 20,
                ),
                child: IconButton(
                  icon: AppIcon(isHidden ? Symbols.visibility_off_rounded : Symbols.visibility_rounded, fill: 1),
                  tooltip: isHidden ? t.libraries.showLibrary : t.libraries.hideLibrary,
                  onPressed: () => widget.onToggleVisibility(library),
                ),
              ),
              Container(
                decoration: FocusTheme.focusBackgroundDecoration(context, isFocused: isOptionsButtonFocused, borderRadius: 20),
                child: IconButton(
                  icon: const AppIcon(Symbols.more_vert_rounded, fill: 1),
                  tooltip: t.libraries.libraryOptions,
                  onPressed: () => _showLibraryMenuBottomSheet(context, library),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
