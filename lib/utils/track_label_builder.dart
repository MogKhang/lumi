import 'codec_utils.dart';
import 'language_codes.dart';

/// Builds a track label from parts with the standard `' · '` joiner pattern.
///
/// Shared by both Plex track models and MPV track label utilities.
/// If [title] is non-empty it is added first, then [language], then [extraParts].
/// Falls back to `'$fallbackPrefix ${index + 1}'` when no parts are available.
String buildTrackLabel({
  String? title,
  String? language,
  List<String> extraParts = const [],
  required int index,
  String fallbackPrefix = 'Track',
}) {
  final parts = <String>[];
  if (title != null && title.isNotEmpty) parts.add(title);
  if (language != null && language.isNotEmpty) parts.add(language);
  parts.addAll(extraParts);
  return parts.isEmpty ? '$fallbackPrefix ${index + 1}' : parts.join(' · ');
}

String? cleanTrackMetadataValue(String? value) {
  if (value == null) return null;
  var cleaned = value.trim();
  if (cleaned.isEmpty) return null;

  final prefixed = RegExp(r'^(?:title|lang|language)\s*=\s*(.*)$', caseSensitive: false).firstMatch(cleaned);
  if (prefixed != null) {
    cleaned = prefixed.group(1)?.trim() ?? '';
  }

  if ((cleaned.startsWith('"') && cleaned.endsWith('"')) || (cleaned.startsWith("'") && cleaned.endsWith("'"))) {
    cleaned = cleaned.substring(1, cleaned.length - 1).trim();
  }

  return cleaned.isEmpty ? null : cleaned;
}

String? cleanSubtitleTitle(String? title, {String? codec}) {
  var cleaned = cleanTrackMetadataValue(title);
  if (cleaned == null) return null;

  final codecAliases = _subtitleCodecAliases(codec);
  if (codecAliases.isEmpty) return cleaned;

  final parts = cleaned.split(RegExp(r'\s+-\s+'));
  while (parts.isNotEmpty && codecAliases.contains(_metadataToken(parts.last))) {
    parts.removeLast();
  }
  cleaned = parts.join(' - ').trim();

  return cleaned.isEmpty ? null : cleaned;
}

Set<String> _subtitleCodecAliases(String? codec) {
  final aliases = <String>{
    'SUBRIP',
    'SRT',
    'WEBVTT',
    'VTT',
    'ASS',
    'SSA',
    'PGS',
    'PGSSUB',
    'HDMV_PGS_SUBTITLE',
    'DVD',
    'DVDSUB',
    'DVD_SUBTITLE',
    'DVB_SUB',
    'DVB_SUBTITLE',
  };
  if (codec != null && codec.isNotEmpty) {
    aliases.add(_metadataToken(codec));
    aliases.add(_metadataToken(CodecUtils.formatSubtitleCodec(codec)));
    aliases.add(_metadataToken(CodecUtils.getSubtitleExtension(codec)));
  }
  return aliases;
}

String _metadataToken(String value) => value.trim().toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]+'), '_');

class TrackLabelBuilder {
  TrackLabelBuilder._();

  static String buildAudioLabel({
    String? title,
    String? language,
    String? codec,
    int? channelsCount,
    required int index,
  }) {
    final lang = language != null && language.isNotEmpty ? LanguageCodes.getDisplayName(language) : 'Unknown';
    final codecStr = codec != null ? CodecUtils.formatAudioCodec(codec) : 'Unknown';
    final channelsStr = channelsCount != null ? ' ${channelsCount}ch' : '';
    
    final label = '$lang ($codecStr$channelsStr)';
    if (title != null && title.isNotEmpty) {
      return '$label | $title';
    }
    return label;
  }

  static String buildSubtitleLabel({
    String? title,
    String? language,
    String? codec,
    bool forced = false,
    bool isExternal = false,
    required int index,
  }) {
    final lang = language != null && language.isNotEmpty ? LanguageCodes.getDisplayName(language) : 'Unknown';
    final ext = codec != null ? CodecUtils.getSubtitleExtension(codec).toUpperCase() : 'SRT';
    final externalStr = isExternal ? ' External' : '';
    final forcedStr = forced ? ' (Forced)' : '';

    final label = '$lang ($ext$externalStr)$forcedStr';
    if (title != null && title.isNotEmpty) {
      return '$label | $title';
    }
    return label;
  }
}
