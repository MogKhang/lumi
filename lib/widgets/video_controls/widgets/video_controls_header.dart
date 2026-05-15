import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lumi/utils/formatters.dart';

import '../../../media/media_item.dart';
import '../../../media/media_item_types.dart';
import '../../../i18n/strings.g.dart';
import '../../../watch_together/widgets/watch_together_overlay.dart';
import '../../../watch_together/providers/watch_together_provider.dart';
import '../../app_bar_back_button.dart';

/// Header layout style for video controls
enum VideoHeaderStyle {
  /// Multi-line: Series name on first line, episode info on second line
  multiLine,

  /// Single-line: All info combined with separators (for macOS)
  singleLine,
}

/// Shared header widget for video controls with back button and title.
///
/// Displays the video title with optional series/episode information.
/// Supports both single-line (macOS) and multi-line (other platforms) layouts.
class VideoControlsHeader extends StatelessWidget {
  final MediaItem metadata;
  final VideoHeaderStyle style;

  /// Optional trailing widget (e.g., track/chapter controls)
  final Widget? trailing;

  /// Optional callback for back button. If null, defaults to Navigator.pop(true).
  final VoidCallback? onBack;

  const VideoControlsHeader({
    super.key,
    required this.metadata,
    this.style = VideoHeaderStyle.multiLine,
    this.trailing,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarBackButton(
          style: BackButtonStyle.video,
          semanticLabel: t.common.back,
          onPressed: onBack ?? () => Navigator.of(context).pop(true),
        ),
        const SizedBox(width: 16),
        Expanded(child: style == VideoHeaderStyle.singleLine ? _buildSingleLineTitle() : _buildMultiLineTitle()),
        Selector<WatchTogetherProvider, bool>(
          selector: (_, p) => p.isInSession,
          builder: (context, inSession, child) {
            if (!inSession) return const SizedBox.shrink();
            return const Padding(padding: EdgeInsets.only(right: 8), child: WatchTogetherSessionIndicator());
          },
        ),
        ?trailing,
      ],
    );
  }

  String? get _displayYear {
    if (metadata.isEpisode) {
      return metadata.grandparentYear?.toString();
    }
    if (metadata.year != null) return metadata.year.toString();
    if (metadata.originallyAvailableAt != null && metadata.originallyAvailableAt!.length >= 4) {
      return metadata.originallyAvailableAt!.substring(0, 4);
    }
    return null;
  }

  Widget _buildSingleLineTitle() {
    final seriesName = metadata.grandparentTitle ?? metadata.title!;
    final hasEpisodeInfo = metadata.parentIndex != null && metadata.index != null;

    final List<String> parts = [seriesName];

    final year = _displayYear;
    if (year != null) {
      parts.add(year);
    }

    if (hasEpisodeInfo) {
      parts.add('${t.mediaDetail.season} ${metadata.parentIndex}');
      parts.add('${t.mediaDetail.episode} ${metadata.index}');
    }

    return Text(
      toBulletedString(parts),
      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMultiLineTitle() {
    final List<String> secondLineParts = [];

    final year = _displayYear;
    if (year != null) {
      secondLineParts.add(year);
    }

    if (metadata.parentIndex != null && metadata.index != null) {
      secondLineParts.add('${t.mediaDetail.season} ${metadata.parentIndex}');
      secondLineParts.add('${t.mediaDetail.episode} ${metadata.index}');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          metadata.grandparentTitle ?? metadata.title!,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (secondLineParts.isNotEmpty)
          Text(
            toBulletedString(secondLineParts),
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }
}
