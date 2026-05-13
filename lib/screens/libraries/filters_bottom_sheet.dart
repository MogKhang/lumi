import 'package:flutter/material.dart';
import 'package:plezy/widgets/app_icon.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../focus/focusable_button.dart';
import '../../media/media_filter.dart';
import '../../services/plex_client.dart';
import '../../utils/scroll_utils.dart';
import '../../widgets/app_bar_back_button.dart';
import '../../widgets/bottom_sheet_header.dart';
import '../../widgets/focusable_list_tile.dart';
import '../../widgets/overlay_sheet.dart';
import '../../utils/provider_extensions.dart';
import '../../i18n/strings.g.dart';

class FiltersBottomSheet extends StatefulWidget {
  final List<MediaFilter> filters;
  final Map<String, String> selectedFilters;
  final Function(Map<String, String>) onFiltersChanged;
  final String serverId;
  final String libraryKey;

  /// Optional pre-fetched values per filter name. When non-null the sheet
  /// reads from this instead of calling `client.getFilterValues` — used
  /// for Jellyfin libraries where values come back in the same call that
  /// lists the categories.
  final Map<String, List<MediaFilterValue>>? cachedValues;

  const FiltersBottomSheet({
    super.key,
    required this.filters,
    required this.selectedFilters,
    required this.onFiltersChanged,
    required this.serverId,
    required this.libraryKey,
    this.cachedValues,
  });

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  MediaFilter? _currentFilter;
  List<MediaFilterValue> _filterValues = [];
  bool _isLoadingValues = false;
  final Map<String, String> _tempSelectedFilters = {};
  static final Map<String, String> _filterDisplayNames = {}; // Cache for display names
  static const int _maxCachedDisplayNames = 1000;
  late List<MediaFilter> _sortedFilters;
  late final FocusNode _initialFocusNode;
  final _valuesFirstItemKey = GlobalKey();
  final _valuesScrollController = ScrollController();

  String _cacheKey(String filter, String value) => '${widget.serverId}:${widget.libraryKey}:$filter:$value';

  @override
  void initState() {
    super.initState();
    _tempSelectedFilters.addAll(widget.selectedFilters);
    _sortFilters();
    _initialFocusNode = FocusNode(debugLabel: 'FiltersBottomSheetInitialFocus');
  }

  @override
  void dispose() {
    _valuesScrollController.dispose();
    _initialFocusNode.dispose();
    super.dispose();
  }

  void _sortFilters() {
    // 1. Define the filters we want to EXCLUDE
    const excludedFilters = {
      'hdr',
      'dovi',
      'unmatched',
      'collection',
      'studio',
      'resolution',
      'edition',
    };

    // 2. Filter the incoming list
    final filtered = widget.filters.where((f) {
      final filterKey = f.filter.toLowerCase();
      final machineKey = f.key.toLowerCase();
      final titleKey = f.title.toLowerCase();
      
      return !excludedFilters.contains(filterKey) 
          && !excludedFilters.contains(machineKey)
          && !excludedFilters.contains(titleKey);
    }).toList();

    // 3. Separate boolean filters (toggles) from regular filters
    final booleanFilters = filtered.where((f) => f.filterType == 'boolean').toList();
    final regularFilters = filtered.where((f) => f.filterType != 'boolean').toList();

    // 4. Define custom sort order for regular filters
    final sortOrder = {
      'unwatched': 1,
      'inProgress': 2,
      'audioLanguage': 10,
      'subtitleLanguage': 20,
      'genre': 30,
      'year': 40,
      'decade': 50,
      'actor': 60,
      'director': 70,
      'writer': 80,
      'producer': 90,
      'country': 100,
      'network': 105,
      'contentRating': 110,
    };

    regularFilters.sort((a, b) {
      final aOrder = sortOrder[a.filter] ?? 999;
      final bOrder = sortOrder[b.filter] ?? 999;

      if (aOrder != bOrder) {
        return aOrder.compareTo(bOrder);
      }
      return a.title.compareTo(b.title);
    });

    // Also sort booleans by the same map if applicable
    booleanFilters.sort((a, b) {
      final aOrder = sortOrder[a.filter] ?? 999;
      final bOrder = sortOrder[b.filter] ?? 999;
      return aOrder.compareTo(bOrder);
    });

    // 5. Combine: booleans (Unwatched, In Progress) first, then regular filters
    _sortedFilters = [...booleanFilters, ...regularFilters];
  }

  bool _isBooleanFilter(MediaFilter filter) {
    return filter.filterType == 'boolean';
  }

  Future<void> _loadFilterValues(MediaFilter filter) async {
    setState(() {
      _currentFilter = filter;
      _isLoadingValues = true;
    });

    try {
      // Cached path (Jellyfin) — `/Items/Filters` returned values inline.
      final cached = widget.cachedValues?[filter.filter];
      // Backend-neutral lookup so a Jellyfin server with an empty/missing
      // cache row doesn't throw from `getPlexClientForServer`. Jellyfin's
      // canonical filter values come from the cached `/Items/Filters`
      // payload; if that's unavailable, an empty list is the honest answer
      // until a `getFilterValues` lands on [MediaServerClient].
      final List<MediaFilterValue> values;
      if (cached != null) {
        values = cached;
      } else {
        final client = context.tryGetMediaClientForServer(widget.serverId);
        if (client is PlexClient) {
          values = await client.getFilterValues(filter.key);
        } else {
          values = const [];
        }
      }
      if (!mounted) return;
      setState(() {
        _filterValues = values;
        _isLoadingValues = false;
      });
      // Scroll to selected value if any
      final selectedValue = _tempSelectedFilters[filter.filter];
      if (selectedValue != null) {
        // +1 because index 0 is the "All" row
        final idx = values.indexWhere((v) => _extractFilterValue(v.key, filter.filter) == selectedValue) + 1;
        if (idx > 0) {
          scrollToCurrentItem(_valuesScrollController, _valuesFirstItemKey, idx);
        }
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _filterValues = [];
        _isLoadingValues = false;
      });
    }
  }

  void _goBack() {
    setState(() {
      _currentFilter = null;
      _filterValues = [];
    });
  }

  void _applyFilters() {
    widget.onFiltersChanged(_tempSelectedFilters);
    OverlaySheetController.of(context).close();
  }

  String _extractFilterValue(String key, String filterName) {
    if (key.contains('?')) {
      final queryStart = key.indexOf('?');
      final queryString = key.substring(queryStart + 1);
      final params = Uri.splitQueryString(queryString);
      return params[filterName] ?? key;
    } else if (key.startsWith('/')) {
      return key.split('/').last;
    }
    return key;
  }

  String _getFilterTitle(MediaFilter filter) {
    final key = filter.filter;
    switch (key) {
      case 'unwatched':
        return t.libraries.filterCategories.unwatched;
      case 'inProgress':
        return t.libraries.filterCategories.inProgress;
      case 'audioLanguage':
        return t.libraries.filterCategories.audioLanguage;
      case 'subtitleLanguage':
        return t.libraries.filterCategories.subtitleLanguage;
      case 'genre':
        return t.libraries.filterCategories.genre;
      case 'year':
        return t.libraries.filterCategories.year;
      case 'contentRating':
        return t.libraries.filterCategories.contentRating;
      case 'tag':
        return t.libraries.filterCategories.tag;
      case 'decade':
        return t.libraries.filterCategories.decade;
      case 'actor':
        return t.libraries.filterCategories.actor;
      case 'director':
        return t.libraries.filterCategories.director;
      case 'writer':
        return t.libraries.filterCategories.writer;
      case 'producer':
        return t.libraries.filterCategories.producer;
      case 'country':
        return t.libraries.filterCategories.country;
      case 'network':
        return t.libraries.filterCategories.network;
      default:
        return filter.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentFilter != null) {
      // Show filter options view
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with back button
          BottomSheetHeader(
            title: _getFilterTitle(_currentFilter!),
            leading: AppBarBackButton(style: BackButtonStyle.plain, onPressed: _goBack),
          ),

          // Filter options list
          if (_isLoadingValues)
            const SizedBox(height: 120, child: Center(child: CircularProgressIndicator()))
          else
            Flexible(
              child: ListView.builder(
                controller: _valuesScrollController,
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: _filterValues.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    final isSelected = !_tempSelectedFilters.containsKey(_currentFilter!.filter);
                    return FocusableListTile(
                      key: _valuesFirstItemKey,
                      focusNode: _initialFocusNode,
                      title: Text(t.libraries.all),
                      selected: isSelected,
                      onTap: () {
                        setState(() {
                          _tempSelectedFilters.remove(_currentFilter!.filter);
                        });
                        _applyFilters();
                      },
                    );
                  }

                  final value = _filterValues[index - 1];
                  final filterValue = _extractFilterValue(value.key, _currentFilter!.filter);
                  final isSelected = _tempSelectedFilters[_currentFilter!.filter] == filterValue;

                  return FocusableListTile(
                    title: Text(value.title),
                    selected: isSelected,
                    onTap: () {
                      setState(() {
                        _tempSelectedFilters[_currentFilter!.filter] = filterValue;
                        // Cache the display name for this filter value
                        if (_filterDisplayNames.length > _maxCachedDisplayNames) {
                          _filterDisplayNames.clear();
                        }
                        _filterDisplayNames[_cacheKey(_currentFilter!.filter, filterValue)] = value.title;
                      });
                      _applyFilters();
                    },
                  );
                },
              ),
            ),
        ],
      );
    }

    // Show main filters view
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        BottomSheetHeader(
          title: t.libraries.filters,
          leading: const AppIcon(Symbols.filter_alt_rounded, fill: 1),
          action: _tempSelectedFilters.isNotEmpty
              ? FocusableButton(
                  onPressed: () {
                    setState(() {
                      _tempSelectedFilters.clear();
                    });
                    _applyFilters();
                  },
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _tempSelectedFilters.clear();
                      });
                      _applyFilters();
                    },
                    child: Text(t.common.clear),
                  ),
                )
              : null,
        ),

        // All Filters (boolean toggles first, then regular filters)
        Flexible(
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: _sortedFilters.length,
            itemBuilder: (context, index) {
              final filter = _sortedFilters[index];

              // Handle boolean filters as switches (unwatched, inProgress, unmatched, hdr, etc.)
              if (_isBooleanFilter(filter)) {
                final isActive =
                    _tempSelectedFilters.containsKey(filter.filter) && _tempSelectedFilters[filter.filter] == '1';
                return FocusableSwitchListTile(
                  focusNode: index == 0 ? _initialFocusNode : null,
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      if (value) {
                        _tempSelectedFilters[filter.filter] = '1';
                      } else {
                        _tempSelectedFilters.remove(filter.filter);
                      }
                    });
                    _applyFilters();
                  },
                  title: Text(_getFilterTitle(filter)),
                );
              }

              // Regular navigable filters - show selected value instead of checkmark
              final selectedValue = _tempSelectedFilters[filter.filter];
              String? displayValue;
              if (selectedValue != null) {
                // Try to get the cached display name, fall back to the value itself
                displayValue = _filterDisplayNames[_cacheKey(filter.filter, selectedValue)] ?? selectedValue;
              }

              return FocusableListTile(
                focusNode: index == 0 ? _initialFocusNode : null,
                title: Text(_getFilterTitle(filter)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (displayValue != null)
                      Flexible(
                        child: Text(
                          displayValue,
                          style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (displayValue != null) const SizedBox(width: 8),
                    const AppIcon(Symbols.chevron_right_rounded, fill: 1),
                  ],
                ),
                onTap: () => _loadFilterValues(filter),
              );
            },
          ),
        ),
      ],
    );
  }
}
