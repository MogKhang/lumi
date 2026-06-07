import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../media/media_item.dart';
import '../media/media_kind.dart';
import '../mpv/mpv.dart';
import '../models/transcode_quality_preset.dart';
import '../providers/download_provider.dart';
import '../providers/multi_server_provider.dart';
import '../screens/video_player_screen.dart';
import '../services/external_player_service.dart';
import '../services/settings_service.dart';
import 'app_logger.dart';

const String kVideoPlayerRouteName = '/video_player';

/// Navigates to the VideoPlayerScreen with instant transitions to prevent white flash.
///
/// This utility function provides a consistent way to navigate to the video player
/// across the app, using PageRouteBuilder with zero-duration transitions to eliminate
/// the white flash that occurs with MaterialPageRoute.
///
/// Parameters:
/// - [context]: The build context for navigation
/// - [metadata]: The neutral [MediaItem] for the content to play
/// - [preferredAudioTrack]: Optional audio track to select on playback start
/// - [preferredSubtitleTrack]: Optional subtitle track to select on playback start
/// - [selectedMediaIndex]: Optional media version index to use; if not provided,
///   loads the saved preference for the series/movie. Defaults to 0 if no preference exists.
/// - [usePushReplacement]: If true, replaces current route instead of pushing;
///   useful for episode-to-episode navigation. Defaults to false.
/// - [isOffline]: If true, plays from downloaded content without requiring server connection.
///
/// Returns a Future that completes with a boolean indicating whether the content
/// was watched, or null if navigation was cancelled.
Future<bool?> navigateToVideoPlayer(
  BuildContext context, {
  required MediaItem metadata,
  AudioTrack? preferredAudioTrack,
  SubtitleTrack? preferredSubtitleTrack,
  SubtitleTrack? preferredSecondarySubtitleTrack,
  int? selectedMediaIndex,
  TranscodeQualityPreset? selectedQualityPreset,
  bool usePushReplacement = false,
  bool isOffline = false,
}) async {
  final navigator = Navigator.of(context);
  final downloadProvider = context.read<DownloadProvider>();
  // Use the manager-routed lookup so Jellyfin items don't trip the
  // Plex-only client. The player branches on the returned type internally.
  final manager = context.read<MultiServerProvider>().serverManager;
  final mediaClient = isOffline ? null : manager.getClient(metadata.serverId ?? '');

  // Enrich metadata with grandparentYear if it's an episode and missing it
  // (e.g. played from Hubs or direct navigation where enrichment hasn't happened).
  MediaItem enrichedMetadata = metadata;
  if (!isOffline &&
      mediaClient != null &&
      metadata.kind == MediaKind.episode &&
      metadata.grandparentYear == null &&
      metadata.grandparentId != null) {
    try {
      final show = await mediaClient.fetchItem(metadata.grandparentId!);
      if (show != null && (show.year != null || show.grandparentYear != null)) {
        enrichedMetadata = metadata.copyWith(
          grandparentYear: show.year ?? show.grandparentYear,
        );
      }
    } catch (_) {
      // Best effort enrichment
    }
  }

  int mediaIndex = selectedMediaIndex ?? 0;
  if (selectedMediaIndex == null) {
    try {
      final settingsService = await SettingsService.getInstance();
      final seriesKey = metadata.grandparentId ?? metadata.id;
      final savedPreference = settingsService.read(SettingsService.mediaVersionPreferences)[seriesKey];
      if (savedPreference != null) {
        mediaIndex = savedPreference;
      }
    } catch (_) {}
  }

  // Check if external player is enabled
  try {
    final settingsService = await SettingsService.getInstance();
    if (settingsService.read(SettingsService.useExternalPlayer)) {
      bool launched = false;

      if (isOffline) {
        final globalKey = metadata.globalKey;
        final videoPath = await downloadProvider.getVideoFilePath(globalKey);
        if (videoPath != null && context.mounted) {
          final videoUrl = videoPath.contains('://') ? videoPath : 'file://$videoPath';
          launched = await ExternalPlayerService.launch(context: context, videoUrl: videoUrl);
        }
      } else if (context.mounted) {
        launched = await ExternalPlayerService.launch(
          context: context,
          metadata: enrichedMetadata,
          client: mediaClient,
          mediaIndex: mediaIndex,
        );
      }

      if (launched) return null;
    }
  } catch (e) {
    appLogger.w('External player launch failed, falling back to built-in player', error: e);
  }

  // Prevent stacking an identical video player when already active
  if (!usePushReplacement &&
      VideoPlayerScreenState.activeId == enrichedMetadata.id &&
      VideoPlayerScreenState.activeMediaIndex == mediaIndex) {
    appLogger.d(
      'Video player already active for ${enrichedMetadata.id} (mediaIndex=$mediaIndex), skipping duplicate navigation',
    );
    return null;
  }

  final route = PageRouteBuilder<bool>(
    settings: const RouteSettings(name: kVideoPlayerRouteName),
    pageBuilder: (context, animation, secondaryAnimation) => VideoPlayerScreen(
      metadata: enrichedMetadata,
      preferredAudioTrack: preferredAudioTrack,
      preferredSubtitleTrack: preferredSubtitleTrack,
      preferredSecondarySubtitleTrack: preferredSecondarySubtitleTrack,
      selectedMediaIndex: mediaIndex,
      selectedQualityPreset: selectedQualityPreset,
      isOffline: isOffline,
    ),
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );

  return usePushReplacement ? navigator.pushReplacement<bool, bool>(route) : navigator.push<bool>(route);
}

/// Navigates to the video player and optionally refreshes content when returning.
///
/// This helper consolidates the common pattern of:
/// 1. Navigating to the video player
/// 2. Logging the return
/// 3. Calling a refresh callback if not offline
///
/// Parameters:
/// - [context]: The build context for navigation
/// - [metadata]: The neutral [MediaItem] for the content to play
/// - [isOffline]: If true, plays from downloaded content
/// - [onRefresh]: Optional callback to refresh data when returning from playback
///   (only called when not offline)
/// - All other parameters are passed through to [navigateToVideoPlayer]
Future<bool?> navigateToVideoPlayerWithRefresh(
  BuildContext context, {
  required MediaItem metadata,
  bool isOffline = false,
  VoidCallback? onRefresh,
  AudioTrack? preferredAudioTrack,
  SubtitleTrack? preferredSubtitleTrack,
  SubtitleTrack? preferredSecondarySubtitleTrack,
  int? selectedMediaIndex,
  bool usePushReplacement = false,
}) async {
  final result = await navigateToVideoPlayer(
    context,
    metadata: metadata,
    isOffline: isOffline,
    preferredAudioTrack: preferredAudioTrack,
    preferredSubtitleTrack: preferredSubtitleTrack,
    preferredSecondarySubtitleTrack: preferredSecondarySubtitleTrack,
    selectedMediaIndex: selectedMediaIndex,
    usePushReplacement: usePushReplacement,
  );

  appLogger.d('Returned from playback, refreshing metadata');

  if (!isOffline && onRefresh != null) {
    onRefresh();
  }

  return result;
}
