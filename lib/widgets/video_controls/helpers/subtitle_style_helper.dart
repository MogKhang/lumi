import '../../../mpv/mpv.dart';
import '../../../mpv/player/platform/player_android.dart';
import '../../../services/settings_service.dart';

/// Extra padding (dp for ExoPlayer, mpv pixels for mpv) added around the
/// subtitle text when the opaque box is ON.
const int _opaqueBoxPadding = 16;

/// Apply (or clear) the opaque subtitle box on [player].
///
/// **ExoPlayer** (Android default): background box padding is controlled by
/// [PlayerAndroid.setSubtitleStyle]'s `boxPadding` param, which sets
/// `SubtitleView.setPadding()` in dp. `borderSize` in CaptionStyleCompat is
/// the *text outline* edge type — it does NOT affect box size.
///
/// **mpv** (desktop, iOS/macOS, tvOS, Android-MPV fallback): background box
/// rendering is enabled by `sub-border-style=opaque-box` (libass BorderStyle 3).
/// In that mode `sub-border-size` maps to libass's `Outline` field, which is
/// the box padding around the text — NOT the text character outline.
/// (`background-box` is not a valid mpv value and is silently ignored.)
Future<void> applySubtitleOpaqueBox(Player player, bool on) async {
  final s = SettingsService.instanceOrNull;

  if (player is PlayerAndroid) {
    await player.setSubtitleStyle(
      fontSize: (s?.read(SettingsService.subtitleFontSize) ?? 42).toDouble(),
      textColor: s?.read(SettingsService.subtitleTextColor) ?? '#FFFFFF',
      borderSize: (s?.read(SettingsService.subtitleBorderSize) ?? 4).toDouble(),
      borderColor: s?.read(SettingsService.subtitleBorderColor) ?? '#000000',
      bgColor: on ? '#000000' : (s?.read(SettingsService.subtitleBackgroundColor) ?? '#000000'),
      bgOpacity: on ? 100 : (s?.read(SettingsService.subtitleBackgroundOpacity) ?? 0),
      subtitlePosition: s?.read(SettingsService.subtitlePosition) ?? 100,
      bold: true,
      italic: s?.read(SettingsService.subtitleItalic) ?? false,
      fontFamily: 'Lexend',
      bottomPadding: 30.0,
      boxPadding: on ? _opaqueBoxPadding : 0,
    );
    return;
  }

  // mpv path — opaque-box is the correct border-style value (libass BorderStyle=3).
  // In opaque-box mode, sub-border-size = box padding around text.
  if (on) {
    await player.setProperty('sub-back-color', '#FF000000');
    await player.setProperty('sub-border-style', 'opaque-box');
    await player.setProperty('sub-border-size', '$_opaqueBoxPadding');
    return;
  }

  final opacityPercent = s?.read(SettingsService.subtitleBackgroundOpacity) ?? 0;
  final bgOpacity = (opacityPercent * 255 / 100).toInt();
  final bgColor = (s?.read(SettingsService.subtitleBackgroundColor) ?? '#000000').replaceFirst('#', '');
  await player.setProperty('sub-back-color', '#${bgOpacity.toRadixString(16).padLeft(2, '0').toUpperCase()}$bgColor');
  await player.setProperty('sub-border-style', bgOpacity > 0 ? 'opaque-box' : 'outline-and-shadow');

  final fontSize = s?.read(SettingsService.subtitleFontSize) ?? 42;
  final mpvBorderSize = fontSize * 0.05;
  await player.setProperty('sub-border-size', mpvBorderSize.toString());
}
