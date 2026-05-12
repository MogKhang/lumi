import 'package:flutter/material.dart';


import '../focus/focusable_action_bar.dart';
import '../media/library_query.dart';
import '../media/media_item.dart';
import '../mixins/paginated_item_loader.dart';


import '../utils/app_logger.dart';
import '../utils/media_server_http_client.dart';

import '../widgets/desktop_app_bar.dart';
import '../i18n/strings.g.dart';
import 'base_media_list_detail_screen.dart';
import 'focusable_detail_screen_mixin.dart';
import '../mixins/grid_focus_node_mixin.dart';

/// Screen to display the contents of a collection
class CollectionDetailScreen extends StatefulWidget {
  final MediaItem collection;

  const CollectionDetailScreen({super.key, required this.collection});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends BaseMediaListDetailScreen<CollectionDetailScreen>
    with
        GridFocusNodeMixin<CollectionDetailScreen>,
        FocusableDetailScreenMixin<CollectionDetailScreen>,
        PaginatedItemLoader<CollectionDetailScreen> {
  static const int _pageSize = 200;

  @override
  MediaItem get mediaItem => widget.collection;

  @override
  String get title => widget.collection.title!;

  @override
  String get emptyMessage => t.collections.empty;

  @override
  bool get hasItems => totalSize > 0;

  @override
  void dispose() {
    disposePagination();
    disposeFocusResources();
    super.dispose();
  }

  @override
  Future<LibraryPage<MediaItem>> fetchPage(int start, int size, AbortController? abort) {
    return mediaClient.fetchCollectionPage(widget.collection.id, start: start, size: size, abort: abort);
  }

  @override
  void updateItemInLists(String itemId, MediaItem updatedItem) {
    // Search [loadedItems] (not the flat [items] snapshot, which only has
    // the first page) so refreshing an item at a scrolled-in position updates
    // the grid in place.
    for (final entry in loadedItems.entries) {
      if (entry.value.id == itemId) {
        loadedItems[entry.key] = updatedItem;
        return;
      }
    }
  }

  @override
  Future<void> loadItems() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
      items = [];
      resetPaginationState();
    });
    try {
      await loadInitialPage(_pageSize);
      if (!mounted) return;
      // Mirror loadedItems into base-class [items] once so state-sliver checks
      // (items.isEmpty vs items.isEmpty && isLoading) pick the right branch.
      // Further pages only update loadedItems; items.isEmpty stays false.
      setState(() {
        items = loadedItems.values.toList();
        isLoading = false;
      });
      appLogger.d('Loaded ${loadedItems.length} of $totalSize items for collection: ${widget.collection.title}');
      autoFocusFirstItemAfterLoad();
    } catch (e) {
      appLogger.e('Failed to load collection items', error: e);
      if (!mounted) return;
      setState(() {
        errorMessage = t.collections.failedToLoadItems(error: e.toString());
        isLoading = false;
      });
    }
  }

  @override
  List<FocusableAction> getAppBarActions() {
    return [];
  }



  @override
  Widget build(BuildContext context) {
    return buildDetailScaffold(
      slivers: [
        CustomAppBar(title: Text(widget.collection.title!), actions: buildFocusableAppBarActions()),
        ...buildStateSlivers(),
        if (hasItems)
          buildSparseFocusableGrid(
            totalItems: totalSize,
            itemAt: (index) => loadedItems[index],
            onRefresh: updateItem,
            onSkeletonVisible: (index) => ensureIndexLoaded(index, pageSize: _pageSize),
            collectionId: widget.collection.id,
            onListRefresh: loadItems,
          ),
      ],
    );
  }
}
