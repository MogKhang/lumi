import '../../../mpv/mpv.dart';
import '../../../services/settings_service.dart';

/// Apply (or clear) the opaque subtitle box on [player].
///
/// When [on], draws a fully-opaque black background box behind the subtitles
/// and thickens the border to 4 so the box reads a bit larger. When off,
/// restores the user's configured background (from [SettingsService]) and
/// border size.
Future<void> applySubtitleOpaqueBox(Player player, bool on) async {
  final s = SettingsService.instanceOrNull;
  if (on) {
    await player.setProperty('sub-back-color', '#000000');
    await player.setProperty('sub-border-style', 'background-box');
    await player.setProperty('sub-border-size', '20');
    return;
  }

  final opacityPercent = s?.read(SettingsService.subtitleBackgroundOpacity) ?? 0;
  final bgOpacity = (opacityPercent * 255 / 100).toInt();
  final bgColor = (s?.read(SettingsService.subtitleBackgroundColor) ?? '#000000').replaceFirst('#', '');
  await player.setProperty('sub-back-color', '#${bgOpacity.toRadixString(16).padLeft(2, '0').toUpperCase()}$bgColor');
  await player.setProperty('sub-border-style', bgOpacity > 0 ? 'background-box' : 'outline-and-shadow');
  await player.setProperty('sub-border-size', (s?.read(SettingsService.subtitleBorderSize) ?? 4).toString());
}
