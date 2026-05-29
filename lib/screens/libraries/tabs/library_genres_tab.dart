import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../../../media/media_genre.dart';
import '../../../utils/genre_assets.dart';
import '../../../widgets/genre_card.dart';
import '../../../i18n/strings.g.dart';
import '../../genre_media_screen.dart';
import '../adaptive_media_grid.dart';
import 'base_library_tab.dart';
import 'library_grid_tab_state.dart';

/// Genres tab for library screen.
///
/// Lists every genre defined for the current (Plex) library as a poster card,
/// sorted alphabetically. Selecting a genre opens a filtered browse of all
/// items in that genre.
class LibraryGenresTab extends BaseLibraryTab<MediaGenre> {
  const LibraryGenresTab({
    super.key,
    required super.library,
    super.viewMode,
    super.density,
    super.onDataLoaded,
    super.isActive,
    super.suppressAutoFocus,
    super.onBack,
  });

  @override
  State<LibraryGenresTab> createState() => _LibraryGenresTabState();
}

class _LibraryGenresTabState extends LibraryGridTabState<MediaGenre, LibraryGenresTab> {
  @override
  String get focusNodeDebugLabel => 'genres_first_item';

  @override
  IconData get emptyIcon => Symbols.theater_comedy_rounded;

  @override
  String get emptyMessage => t.genres.empty;

  @override
  String get errorContext => t.genres.title;

  @override
  Future<List<MediaGenre>> loadData() async {
    final client = getClientForLibrary();
    final genres = await client.fetchGenres(widget.library.id);
    // Sort by the localized display name so ordering matches what users see.
    genres.sort(
      (a, b) => translatedGenreName(a.title).toLowerCase().compareTo(translatedGenreName(b.title).toLowerCase()),
    );
    return genres;
  }

  void _openGenre(MediaGenre genre) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GenreMediaScreen(
          genreId: genre.id,
          genreName: translatedGenreName(genre.title),
          sectionId: widget.library.id,
          serverId: widget.library.serverId ?? '',
          serverName: widget.library.serverName,
          backend: widget.library.backend,
        ),
      ),
    );
  }

  @override
  Widget buildGridItem(BuildContext context, MediaGenre genre, int index, [GridItemContext? gridContext]) {
    return GenreCard(
      key: Key(genre.id),
      genre: genre,
      focusNode: index == 0 ? firstItemFocusNode : null,
      disableScale: gridContext?.isListMode ?? false,
      onTap: () => _openGenre(genre),
      onBack: widget.onBack,
      onNavigateUp: gridContext?.isFirstRow == true ? widget.onBack : null,
      onNavigateLeft: gridContext?.isFirstColumn == true ? gridContext?.navigateToSidebar : null,
    );
  }
}
