import 'package:flutter/material.dart';
import 'package:plezy/widgets/app_icon.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../focus/dpad_navigator.dart';
import '../../focus/focusable_button.dart';
import '../../focus/input_mode_tracker.dart';
import '../../media/media_sort.dart';
import '../../utils/scroll_utils.dart';
import '../../widgets/bottom_sheet_header.dart';
import '../../widgets/focusable_list_tile.dart';
import '../../widgets/overlay_sheet.dart';
import '../../i18n/strings.g.dart';

class SortBottomSheet extends StatefulWidget {
  final List<MediaSort> sortOptions;
  final MediaSort? selectedSort;
  final bool isSortDescending;
  final Function(MediaSort, bool) onSortChanged;
  final VoidCallback? onClear;

  const SortBottomSheet({
    super.key,
    required this.sortOptions,
    required this.selectedSort,
    required this.isSortDescending,
    required this.onSortChanged,
    this.onClear,
  });

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  late MediaSort? _currentSort;
  late bool _currentDescending;
  late final FocusNode _initialFocusNode;
  final _firstItemKey = GlobalKey();
  late List<MediaSort> _filteredSortOptions;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _currentSort = widget.selectedSort;
    _currentDescending = widget.isSortDescending;
    _initialFocusNode = FocusNode(debugLabel: 'SortBottomSheetInitialFocus');

    // Filter out unwanted sort options
    const excludedKeys = {
      'criticRating',
      'audienceRating',
      'duration',
      'viewedAt',
      'resolution',
    };

    _filteredSortOptions = widget.sortOptions.where((s) {
      final key = s.key.toLowerCase();
      final title = s.title.toLowerCase();
      
      // Check common Plex/Jellyfin keys for these categories
      final isExcluded = excludedKeys.contains(key) ||
          title.contains('critic rating') ||
          title.contains('audience rating') ||
          title.contains('duration') ||
          title.contains('date viewed') ||
          title.contains('resolution');
          
      return !isExcluded;
    }).toList();

    // Scroll to selected item, then handle focus
    final selectedIndex = widget.selectedSort != null
        ? _filteredSortOptions.indexWhere((s) => s.key == widget.selectedSort!.key)
        : -1;
    if (selectedIndex > 0) {
      scrollToCurrentItem(_scrollController, _firstItemKey, selectedIndex);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (!InputModeTracker.isKeyboardMode(context)) return;
      final ctx = _initialFocusNode.context;
      if (ctx != null) {
        Scrollable.ensureVisible(ctx, alignment: 0.5);
      }
      // Schedule after overlay's _autoFocus second callback so we override it.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _initialFocusNode.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _initialFocusNode.dispose();
    super.dispose();
  }

  void _handleSortSelect(MediaSort sort) {
    final descending = (_currentSort?.key == sort.key) ? _currentDescending : sort.isDefaultDescending;
    setState(() {
      _currentSort = sort;
      _currentDescending = descending;
    });
    widget.onSortChanged(sort, descending);
  }

  void _handleDirectionChange(MediaSort sort, bool descending) {
    setState(() {
      _currentDescending = descending;
    });
    widget.onSortChanged(sort, descending);
    OverlaySheetController.of(context).close();
  }

  void _handleClear() {
    setState(() {
      _currentSort = null;
      _currentDescending = false;
    });
    widget.onClear?.call();
    OverlaySheetController.of(context).close();
  }

  Widget _buildSortDirectionButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
    required bool isLeft,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 48,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.secondaryContainer : Colors.transparent,
          borderRadius: isLeft
              ? const BorderRadius.horizontal(left: Radius.circular(19))
              : const BorderRadius.horizontal(right: Radius.circular(19)),
        ),
        child: Center(
          child: AppIcon(
            icon,
            fill: 1,
            size: 18,
            color: isSelected ? colorScheme.onSecondaryContainer : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomSheetHeader(
          title: t.libraries.sortBy,
          action: widget.onClear != null
              ? FocusableButton(
                  onPressed: _handleClear,
                  child: TextButton(onPressed: _handleClear, child: Text(t.common.clear)),
                )
              : null,
        ),
        Flexible(
          child: RadioGroup<MediaSort>(
            groupValue: _currentSort,
            onChanged: (value) {
              if (value != null) _handleSortSelect(value);
            },
            child: ListView.builder(
              controller: _scrollController,
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _filteredSortOptions.length,
              itemBuilder: (context, index) {
                final sort = _filteredSortOptions[index];
                final isSelected = _currentSort?.key == sort.key;

                return Focus(
                  key: index == 0 ? _firstItemKey : null,
                  canRequestFocus: false,
                  skipTraversal: true,
                  onKeyEvent: (node, event) {
                    if (!event.isActionable) return KeyEventResult.ignored;
                    if (!isSelected) return KeyEventResult.ignored;
                    if (event.logicalKey.isLeftKey) {
                      _handleDirectionChange(sort, false);
                      return KeyEventResult.handled;
                    }
                    if (event.logicalKey.isRightKey) {
                      _handleDirectionChange(sort, true);
                      return KeyEventResult.handled;
                    }
                    return KeyEventResult.ignored;
                  },
                  child: FocusableRadioListTile<MediaSort>(
                    focusNode: (widget.selectedSort?.key == sort.key || (widget.selectedSort == null && index == 0))
                        ? _initialFocusNode
                        : null,
                    title: Text(sort.title),
                    value: sort,
                    secondary: isSelected
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildSortDirectionButton(
                                  icon: Symbols.arrow_upward_rounded,
                                  isSelected: !_currentDescending,
                                  onPressed: () => _handleDirectionChange(sort, false),
                                  isLeft: true,
                                ),
                                Container(
                                  width: 1,
                                  height: 24,
                                  color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
                                ),
                                _buildSortDirectionButton(
                                  icon: Symbols.arrow_downward_rounded,
                                  isSelected: _currentDescending,
                                  onPressed: () => _handleDirectionChange(sort, true),
                                  isLeft: false,
                                ),
                              ],
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
