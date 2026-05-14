import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../../../media/media_item.dart';
import '../../../media/media_server_client.dart';
import '../../../providers/multi_server_provider.dart';
import '../../../screens/video_player_screen.dart';
import '../../../utils/scroll_utils.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/optimized_media_image.dart';
import '../../../widgets/overlay_sheet.dart';
import 'base_video_control_sheet.dart';
import 'sheet_column_header.dart';
import '../../../i18n/strings.g.dart';

/// Sheet for selecting seasons and episodes of a TV show.
class EpisodeSheet extends StatefulWidget {
  final MediaItem metadata;

  const EpisodeSheet({
    super.key,
    required this.metadata,
  });

  @override
  State<EpisodeSheet> createState() => _EpisodeSheetState();
}

class _EpisodeSheetState extends State<EpisodeSheet> {
  final _seasonScroll = InitialItemScrollController();
  final _episodeScroll = InitialItemScrollController();

  List<MediaItem>? _seasons;
  List<MediaItem>? _episodes;
  MediaItem? _selectedSeason;

  bool _isLoadingSeasons = true;
  bool _isLoadingEpisodes = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchSeasons();
  }

  @override
  void dispose() {
    _seasonScroll.dispose();
    _episodeScroll.dispose();
    super.dispose();
  }

  Future<void> _fetchSeasons() async {
    final showId = widget.metadata.grandparentId;
    if (showId == null) {
      setState(() {
        _error = 'Show ID missing';
        _isLoadingSeasons = false;
      });
      return;
    }

    try {
      final client = context.read<MultiServerProvider>().getClientForServer(widget.metadata.serverId!);
      if (client == null) throw Exception('Server not found');

      final seasons = await client.fetchChildren(showId);
      
      // Find current season
      final currentSeasonId = widget.metadata.parentId;
      final currentSeason = seasons.where((s) => s.id == currentSeasonId).firstOrNull ?? seasons.firstOrNull;

      if (mounted) {
        setState(() {
          _seasons = seasons;
          _selectedSeason = currentSeason;
          _isLoadingSeasons = false;
        });

        if (currentSeason != null) {
          await _fetchEpisodes(currentSeason);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoadingSeasons = false;
        });
      }
    }
  }

  Future<void> _fetchEpisodes(MediaItem season) async {
    setState(() {
      _isLoadingEpisodes = true;
      _episodes = null;
    });

    try {
      final client = context.read<MultiServerProvider>().getClientForServer(widget.metadata.serverId!);
      if (client == null) throw Exception('Server not found');

      final episodes = await client.fetchChildren(season.id);

      if (mounted && _selectedSeason?.id == season.id) {
        setState(() {
          _episodes = episodes;
          _isLoadingEpisodes = false;
        });
      }
    } catch (e) {
      if (mounted && _selectedSeason?.id == season.id) {
        setState(() {
          _error = e.toString();
          _isLoadingEpisodes = false;
        });
      }
    }
  }

  void _onSeasonTap(MediaItem season) {
    if (_selectedSeason?.id == season.id) return;
    setState(() {
      _selectedSeason = season;
    });
    _fetchEpisodes(season);
  }

  void _onEpisodeTap(MediaItem episode) {
    if (episode.id == widget.metadata.id) {
      OverlaySheetController.of(context).close();
      return;
    }

    final videoPlayerState = context.findAncestorStateOfType<VideoPlayerScreenState>();
    if (videoPlayerState != null) {
      OverlaySheetController.of(context).close();
      videoPlayerState.navigateToQueueItem(episode);
    }
  }

  String _getLocalizedSeasonTitle(String? title) {
    if (title == null || title.isEmpty) return '';

    // Check for "Season X" pattern
    final seasonMatch = RegExp(r'^Season\s+(\d+)$', caseSensitive: false).firstMatch(title);
    if (seasonMatch != null) {
      final seasonNumber = seasonMatch.group(1);
      return '${t.mediaDetail.season} $seasonNumber';
    }

    return title;
  }

  @override
  Widget build(BuildContext context) {
    return BaseVideoControlSheet(
      title: t.mediaDetail.episodesListHeader,
      icon: Symbols.video_library_rounded,
      child: _error != null
          ? Center(child: Text(_error!))
          : _isLoadingSeasons
              ? const Center(child: CircularProgressIndicator())
              : Row(
                  children: [
                    // Seasons Column
                    SizedBox(
                      width: 160,
                      child: Column(
                        children: [
                          SheetColumnHeader(label: t.mediaDetail.seasonsColumn),
                          Expanded(
                            child: ListView.builder(
                              controller: _seasonScroll.controller,
                              itemCount: _seasons?.length ?? 0,
                              itemBuilder: (context, index) {
                                final season = _seasons![index];
                                final isSelected = season.id == _selectedSeason?.id;
                                final isCurrent = season.id == widget.metadata.parentId;

                                return ListTile(
                                  dense: true,
                                  title: Text(
                                    _getLocalizedSeasonTitle(season.title ?? '${t.mediaDetail.season} ${season.index}'),
                                    style: TextStyle(
                                      color: isSelected ? Theme.of(context).colorScheme.primary : (isCurrent ? Colors.white : Colors.white70),
                                      fontWeight: isSelected || isCurrent ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                  onTap: () => _onSeasonTap(season),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivider(width: 1, color: Theme.of(context).dividerColor),
                    // Episodes Column
                    Expanded(
                      child: Column(
                        children: [
                          SheetColumnHeader(label: t.mediaDetail.episodes),
                          Expanded(
                            child: _isLoadingEpisodes
                                ? const Center(child: CircularProgressIndicator())
                                : ListView.builder(
                                    controller: _episodeScroll.controller,
                                    itemCount: _episodes?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final episode = _episodes![index];
                                      final isPlaying = episode.id == widget.metadata.id;

                                      return _EpisodeTile(
                                        episode: episode,
                                        isPlaying: isPlaying,
                                        onTap: () => _onEpisodeTap(episode),
                                        client: context.read<MultiServerProvider>().getClientForServer(widget.metadata.serverId!),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}

class _EpisodeTile extends StatelessWidget {
  final MediaItem episode;
  final bool isPlaying;
  final VoidCallback onTap;
  final MediaServerClient? client;

  const _EpisodeTile({
    required this.episode,
    required this.isPlaying,
    required this.onTap,
    this.client,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final highlightColor = theme.colorScheme.primary;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: OptimizedMediaImage.thumb(
              client: client,
              imagePath: episode.thumbPath,
              width: 120,
              height: 68,
            ),
          ),
          if (isPlaying)
            Positioned.fill(
              child: Container(
                color: Colors.black45,
                child: Center(
                  child: Icon(Symbols.play_arrow_rounded, color: highlightColor, size: 32, fill: 1),
                ),
              ),
            ),
        ],
      ),
      title: Row(
        children: [
          if (episode.index != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '${t.mediaDetail.episode} ${episode.index}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              episode.title ?? '',
              style: TextStyle(
                color: isPlaying ? highlightColor : Colors.white,
                fontWeight: isPlaying ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          episode.durationMs != null
              ? formatDurationTimestamp(Duration(milliseconds: episode.durationMs!))
              : '',
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}
