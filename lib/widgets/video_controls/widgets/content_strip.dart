import 'dart:async' show unawaited;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';


import '../../../focus/dpad_navigator.dart';
import '../../../focus/focusable_wrapper.dart';
import '../../../i18n/strings.g.dart';

import '../../../media/media_server_client.dart';
import '../../../mpv/mpv.dart';
import '../../../media/media_source_info.dart';

import '../../../services/download_storage_service.dart';
import '../../../utils/formatters.dart';
import '../../../utils/player_utils.dart';
import '../../../utils/provider_extensions.dart';
import '../../app_icon.dart';
import '../../optimized_media_image.dart';
import 'media_selector_thumbnail.dart';

/// Horizontal scrollable strip of chapter items shown on swipe-up.
class ContentStrip extends StatefulWidget {
  final Player player;
  final List<MediaChapter> chapters;
  final bool chaptersLoaded;
  final String? serverId;
  final Function(Duration position)? onSeekCompleted;

  /// Whether to use dpad/focus-based navigation (TV mode).
  /// When true, no tab bar is shown — pages are navigated via UP/DOWN.
  final bool useFocusNavigation;

  /// Called when navigating UP from the top-most strip page (back to buttons).
  final VoidCallback? onNavigateUp;

  /// Called on any focus activity (to reset auto-hide timer).
  final VoidCallback? onFocusActivity;

  const ContentStrip({
    super.key,
    required this.player,
    required this.chapters,
    required this.chaptersLoaded,
    this.serverId,
    this.onSeekCompleted,
    this.useFocusNavigation = false,
    this.onNavigateUp,
    this.onFocusActivity,
  });

  @override
  State<ContentStrip> createState() => ContentStripState();
}

class ContentStripState extends State<ContentStrip> {
  final ScrollController _chapterScrollController = ScrollController();
  bool _hasAutoScrolledChapters = false;

  // Focus nodes for focus navigation mode
  final List<FocusNode> _chapterFocusNodes = [];



  @override
  void dispose() {
    _chapterScrollController.dispose();
    for (final node in _chapterFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  /// Request focus on the current chapter (called by parent when strip appears).
  void requestInitialFocus() {
    if (_chapterFocusNodes.isNotEmpty) {
      final currentIndex = _getCurrentChapterIndex();
      final idx = (currentIndex ?? 0).clamp(0, _chapterFocusNodes.length - 1);
      _chapterFocusNodes[idx].requestFocus();
      _scrollToFocusedNode(_chapterFocusNodes[idx]);
    }
  }

  int? _getCurrentChapterIndex() {
    final currentPositionMs = widget.player.state.position.inMilliseconds;
    for (int i = 0; i < widget.chapters.length; i++) {
      final chapter = widget.chapters[i];
      final startMs = chapter.startTimeOffset ?? 0;
      final endMs =
          chapter.endTimeOffset ??
          (i < widget.chapters.length - 1 ? widget.chapters[i + 1].startTimeOffset ?? 0 : double.maxFinite.toInt());
      if (currentPositionMs >= startMs && currentPositionMs < endMs) {
        return i;
      }
    }
    return null;
  }

  Future<void> _handleChapterTap(Duration position) async {
    final clamped = clampSeekPosition(widget.player, position);
    await widget.player.seek(clamped);
    if (mounted) {
      widget.onSeekCompleted?.call(clamped);
    }
  }

  void _ensureFocusNodes(List<FocusNode> nodes, int count, String prefix) {
    while (nodes.length < count) {
      nodes.add(FocusNode(debugLabel: '$prefix${nodes.length}'));
    }
    while (nodes.length > count) {
      nodes.removeLast().dispose();
    }
  }

  void _scrollToFocusedNode(FocusNode node) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final context = node.context;
      if (context == null) return;
      Scrollable.ensureVisible(
        context,
        alignment: 0.5,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
      );
    });
  }

  KeyEventResult _handleFocusItemKeyEvent(FocusNode node, KeyEvent event, int index, int totalItems) {
    if (!event.isActionable) return KeyEventResult.ignored;

    final key = event.logicalKey;

    if (key == LogicalKeyboardKey.arrowLeft) {
      if (index > 0) {
        _chapterFocusNodes[index - 1].requestFocus();
        _scrollToFocusedNode(_chapterFocusNodes[index - 1]);
        widget.onFocusActivity?.call();
      }
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.arrowRight) {
      if (index < totalItems - 1) {
        _chapterFocusNodes[index + 1].requestFocus();
        _scrollToFocusedNode(_chapterFocusNodes[index + 1]);
        widget.onFocusActivity?.call();
      }
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.arrowUp) {
      // Go back to buttons
      widget.onNavigateUp?.call();
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.arrowDown) {
      // Consume to prevent bubbling
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  MediaServerClient? _tryGetClient(BuildContext context, String? serverId) {
    return context.tryGetMediaClientForServer(serverId);
  }

  double _itemWidth(bool isTablet) => isTablet ? 212.0 : 132.0; // thumb + 12 padding

  void _autoScrollTo(ScrollController controller, int index, {bool force = false, bool isTablet = false}) {
    if (!controller.hasClients) return;
    final itemWidth = _itemWidth(isTablet);
    final target = (index * itemWidth - 60).clamp(0.0, controller.position.maxScrollExtent);
    if (force || (target - controller.offset).abs() > itemWidth) {
      controller.jumpTo(target);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    final stripHeight = isTablet ? 170.0 : 106.0;
    // Add extra height for focus decoration when in focus navigation mode
    final effectiveStripHeight = widget.useFocusNavigation ? stripHeight + 16.0 : stripHeight;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.useFocusNavigation ? 0 : 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // In focus mode, show a small label for the current page
            if (widget.useFocusNavigation)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  t.videoControls.chapters,
                  style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            if (!widget.useFocusNavigation) const SizedBox(height: 8),
            SizedBox(
              height: effectiveStripHeight,
              child: _buildChapterStrip(isTablet),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterStrip(bool isTablet) {
    final thumbWidth = isTablet ? 200.0 : 120.0;
    final thumbHeight = isTablet ? 112.0 : 68.0;

    return StreamBuilder<Duration>(
      stream: widget.player.streams.position,
      initialData: widget.player.state.position,
      builder: (context, positionSnapshot) {
        final currentPosition = positionSnapshot.data ?? Duration.zero;
        final currentChapterIndex = MediaChapter.indexAtPosition(currentPosition, widget.chapters);

        // Auto-scroll to current chapter on first build
        if (!_hasAutoScrolledChapters && currentChapterIndex != null) {
          _hasAutoScrolledChapters = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _autoScrollTo(_chapterScrollController, currentChapterIndex, isTablet: isTablet);
          });
        }

        if (widget.useFocusNavigation) {
          _ensureFocusNodes(_chapterFocusNodes, widget.chapters.length, 'ChapterFocus');
        }

        return ListView.builder(
          controller: _chapterScrollController,
          scrollDirection: Axis.horizontal,
          clipBehavior: widget.useFocusNavigation ? Clip.none : Clip.hardEdge,
          itemCount: widget.chapters.length,
          padding: EdgeInsets.symmetric(horizontal: widget.useFocusNavigation ? 12 : 4),
          itemBuilder: (context, index) {
            final chapter = widget.chapters[index];
            final isCurrent = currentChapterIndex == index;

            final localThumbPath = widget.serverId != null && chapter.thumb != null
                ? DownloadStorageService.instance.getArtworkPathSync(widget.serverId!, chapter.thumb!)
                : null;

            void onTap() => unawaited(_handleChapterTap(chapter.startTime));

            final item = _buildStripItem(
              context: context,
              isCurrent: isCurrent,
              isTablet: isTablet,
              thumbnail: chapter.thumb != null
                  ? OptimizedMediaImage.thumb(
                      client: _tryGetClient(context, widget.serverId),
                      imagePath: chapter.thumb,
                      localFilePath: localThumbPath,
                      width: thumbWidth,
                      height: thumbHeight,
                      fit: BoxFit.cover,
                      errorWidget: (_, _, _) =>
                          const AppIcon(Symbols.image_rounded, fill: 1, color: Colors.white54, size: 34),
                    )
                  : null,
              title: chapter.label,
              subtitle: formatDurationTimestamp(chapter.startTime),
              onTap: onTap,
            );

            if (widget.useFocusNavigation) {
              return Align(
                alignment: Alignment.topCenter,
                child: FocusableWrapper(
                  focusNode: _chapterFocusNodes[index],
                  onSelect: onTap,
                  onKeyEvent: (node, event) =>
                      _handleFocusItemKeyEvent(node, event, index, widget.chapters.length),
                  onFocusChange: (hasFocus) {
                    if (hasFocus) widget.onFocusActivity?.call();
                  },
                  borderRadius: 6,
                  autoScroll: false,
                  useBackgroundFocus: true,
                  child: item,
                ),
              );
            }

            return item;
          },
        );
      },
    );
  }

  Widget _buildStripItem({
    required BuildContext context,
    required bool isCurrent,
    required Widget? thumbnail,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isTablet = false,
  }) {
    final itemWidth = isTablet ? 200.0 : 120.0;
    final thumbHeight = isTablet ? 112.0 : 68.0;
    final titleFontSize = isTablet ? 13.0 : 11.0;
    final subtitleFontSize = isTablet ? 12.0 : 10.0;

    final verticalMargin = widget.useFocusNavigation ? 4.0 : 0.0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: itemWidth,
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: verticalMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaSelectorThumbnail(
              width: itemWidth,
              height: thumbHeight,
              thumbnail: thumbnail,
              isCurrent: isCurrent,
              borderColor: Colors.white,
              radius: 6,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: titleFontSize,
                fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: isCurrent ? Colors.white70 : Colors.white60,
                fontSize: subtitleFontSize,
                fontWeight: isCurrent ? FontWeight.w500 : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
