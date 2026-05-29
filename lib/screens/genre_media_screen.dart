import 'package:flutter/material.dart';

import '../media/media_backend.dart';
import '../media/media_item.dart';
import '../media/media_kind.dart';
import '../services/plex_client.dart';
import '../utils/provider_extensions.dart';
import '../widgets/desktop_app_bar.dart';
import '../i18n/strings.g.dart';
import 'base_media_list_detail_screen.dart';
import 'focusable_detail_screen_mixin.dart';
import '../mixins/grid_focus_node_mixin.dart';
import '../focus/focusable_action_bar.dart';

/// Browse all items in a library section that are tagged with a given genre.
///
/// Plex-only today: uses [PlexClient.fetchLibraryItemsByGenre], which has no
/// Jellyfin counterpart. The Genres tab is only shown for Plex libraries.
class GenreMediaScreen extends StatefulWidget {
  /// Plex genre filter id (`genre=<id>`).
  final String genreId;

  /// Localized genre name shown in the app bar.
  final String genreName;

  /// Library section id to scope the query to.
  final String sectionId;

  final String serverId;
  final String? serverName;
  final MediaBackend backend;

  const GenreMediaScreen({
    super.key,
    required this.genreId,
    required this.genreName,
    required this.sectionId,
    required this.serverId,
    this.serverName,
    required this.backend,
  });

  @override
  State<GenreMediaScreen> createState() => _GenreMediaScreenState();
}

class _GenreMediaScreenState extends BaseMediaListDetailScreen<GenreMediaScreen>
    with
        StandardItemLoader<GenreMediaScreen>,
        GridFocusNodeMixin<GenreMediaScreen>,
        FocusableDetailScreenMixin<GenreMediaScreen> {
  @override
  MediaItem get mediaItem => MediaItem(
    id: '',
    backend: widget.backend,
    kind: MediaKind.unknown,
    serverId: widget.serverId,
    serverName: widget.serverName,
  );

  @override
  String get title => widget.genreName;

  @override
  String get emptyMessage => t.discover.noContentAvailable;

  @override
  bool get hasItems => items.isNotEmpty;

  @override
  void dispose() {
    disposeFocusResources();
    super.dispose();
  }

  PlexClient get _plexClient => context.getPlexClientForServer(widget.serverId);

  @override
  Future<List<MediaItem>> fetchItems() async {
    // Plex-only — the Genres tab is only shown for Plex libraries.
    return _plexClient.fetchLibraryItemsByGenre(widget.sectionId, widget.genreId);
  }

  @override
  Future<void> loadItems() async {
    await super.loadItems();
    autoFocusFirstItemAfterLoad();
  }

  @override
  List<FocusableAction> getAppBarActions() => [];

  @override
  Widget build(BuildContext context) {
    return buildDetailScaffold(
      slivers: [
        CustomAppBar(title: Text(widget.genreName), pinned: true, actions: buildFocusableAppBarActions()),
        ...buildStateSlivers(),
        if (items.isNotEmpty) buildFocusableGrid(items: items, onRefresh: updateItem),
      ],
    );
  }
}
