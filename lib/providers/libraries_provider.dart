import 'package:flutter/foundation.dart';

import '../media/media_library.dart';
import '../mixins/disposable_change_notifier_mixin.dart';
import '../services/data_aggregation_service.dart';
import '../services/storage_service.dart';
import '../utils/app_logger.dart';
import '../utils/content_utils.dart';

/// Load state for the libraries provider
enum LibrariesLoadState { initial, loading, loaded, error }

/// Provider that serves as the single source of truth for library data.
/// Both SideNavigationRail and LibrariesScreen consume this provider
/// instead of independently fetching library data.
class LibrariesProvider extends ChangeNotifier with DisposableChangeNotifierMixin {
  DataAggregationService? _aggregationService;
  List<MediaLibrary> _libraries = [];
  List<MediaLibrary> _allServerLibraries = [];
  LibrariesLoadState _loadState = LibrariesLoadState.initial;
  String? _errorMessage;

  /// Coalesces concurrent `loadLibraries()` calls so two simultaneous callers
  /// see the same in-flight result instead of racing two separate fetches.
  Future<void>? _inFlightLoad;

  /// Unmodifiable list of libraries for the active server (filtered for
  /// supported types, ordered). Honors the Select-Server visibility filter,
  /// so this is what drives the browseable content of the current server.
  List<MediaLibrary> get libraries => List.unmodifiable(_libraries);

  /// Unmodifiable list of libraries across EVERY connected server (filtered for
  /// supported types). Ignores the active-server filter so the Libraries screen
  /// can offer a cross-server picker. Ordering is server-grouped by fetch order.
  List<MediaLibrary> get allServerLibraries => List.unmodifiable(_allServerLibraries);

  /// Whether libraries are currently being loaded
  bool get isLoading => _loadState == LibrariesLoadState.loading;

  /// Whether libraries have been loaded at least once
  bool get hasLoaded => _loadState == LibrariesLoadState.loaded;

  /// Current load state
  LibrariesLoadState get loadState => _loadState;

  /// Error message if loading failed
  String? get errorMessage => _errorMessage;

  /// Whether libraries are available
  bool get hasLibraries => _libraries.isNotEmpty;

  /// Initialize the provider with the aggregation service.
  /// This should be called after server connection is established.
  void initialize(DataAggregationService service) {
    _aggregationService = service;
  }

  /// Load libraries from all connected servers.
  /// Filters out music libraries and applies saved ordering.
  Future<void> loadLibraries() {
    return _inFlightLoad ??= _loadLibrariesInternal().whenComplete(() => _inFlightLoad = null);
  }

  Future<void> _loadLibrariesInternal() async {
    if (_aggregationService == null) {
      appLogger.w('LibrariesProvider: Cannot load libraries - not initialized');
      return;
    }

    _loadState = LibrariesLoadState.loading;
    _errorMessage = null;
    safeNotifyListeners();

    try {
      // Fetch libraries from every connected backend (Plex + Jellyfin).
      // The aggregation service converts Plex-typed responses to MediaLibrary
      // internally; Jellyfin clients return MediaLibrary natively.
      //
      // Two fetches: the active-server set (honors Select-Server, drives
      // browseable content) and the all-servers set (ignores the filter, feeds
      // the Libraries screen's cross-server picker). With a single connected
      // server both fetches return the same data, so the extra call is cheap.
      final results = await Future.wait([
        _aggregationService!.getMediaLibrariesFromAllServers(),
        _aggregationService!.getMediaLibrariesFromAllServers(includeAllServers: true),
      ]);
      final allLibraries = results.first;
      final everyServerLibraries = results[1];

      bool isSupported(MediaLibrary lib) => !ContentTypeHelper.isMusicLibrary(lib);

      // Filter out music libraries (not supported)
      final filteredLibraries = allLibraries.where(isSupported).toList();

      // Apply saved library order
      final storage = await StorageService.getInstance();
      final savedOrder = storage.getLibraryOrder();
      final orderedLibraries = _applyLibraryOrder(filteredLibraries, savedOrder);

      _libraries = orderedLibraries;
      _allServerLibraries = _applyLibraryOrder(everyServerLibraries.where(isSupported).toList(), savedOrder);
      _loadState = LibrariesLoadState.loaded;
      _errorMessage = null;

      appLogger.i(
        'LibrariesProvider: Loaded ${_libraries.length} libraries '
        '(${_allServerLibraries.length} across all servers)',
      );
      safeNotifyListeners();
    } catch (e, stackTrace) {
      appLogger.e('LibrariesProvider: Failed to load libraries', error: e, stackTrace: stackTrace);
      _loadState = LibrariesLoadState.error;
      _errorMessage = e.toString();
      safeNotifyListeners();
    }
  }

  /// Refresh libraries by reloading from the connected servers.
  Future<void> refresh() async {
    if (_aggregationService == null) {
      appLogger.w('LibrariesProvider: Cannot refresh - not initialized');
      return;
    }
    await loadLibraries();
  }

  /// Update the library order and persist it.
  Future<void> updateLibraryOrder(List<MediaLibrary> orderedLibraries) async {
    _libraries = List.from(orderedLibraries);
    safeNotifyListeners();

    // Save the new order
    final storage = await StorageService.getInstance();
    final libraryKeys = orderedLibraries.map((lib) => lib.globalKey).toList();
    await storage.saveLibraryOrder(libraryKeys);

    appLogger.d('LibrariesProvider: Updated library order');
  }

  /// Clear all library data (for profile switch or logout).
  void clear() {
    _libraries = [];
    _allServerLibraries = [];
    _loadState = LibrariesLoadState.initial;
    _errorMessage = null;
    safeNotifyListeners();
    appLogger.d('LibrariesProvider: Cleared library data');
  }

  /// Apply saved library order to a list of libraries.
  List<MediaLibrary> _applyLibraryOrder(List<MediaLibrary> libraries, List<String>? savedOrder) {
    if (savedOrder == null || savedOrder.isEmpty) {
      return libraries;
    }

    // Create a map for quick lookup
    final libraryMap = {for (final lib in libraries) lib.globalKey: lib};

    // Build ordered list based on saved order
    final orderedLibraries = <MediaLibrary>[];
    for (final key in savedOrder) {
      final lib = libraryMap.remove(key);
      if (lib != null) {
        orderedLibraries.add(lib);
      }
    }

    // Add any new libraries that weren't in the saved order
    orderedLibraries.addAll(libraryMap.values);

    return orderedLibraries;
  }
}
