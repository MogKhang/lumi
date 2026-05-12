/// Utility class for codec-related operations.
///
/// Provides centralized codec name mappings, file extension lookups,
/// and display name formatting.
class CodecUtils {
  CodecUtils._();

  static String getSubtitleExtension(String? codec) {
    if (codec == null) return 'srt';

    switch (codec.toLowerCase()) {
      case 'subrip':
      case 'srt':
        return 'srt';
      case 'ass':
      case 'ssa':
        return 'ass';
      case 'webvtt':
      case 'vtt':
        return 'vtt';
      case 'mov_text':
        return 'srt';
      case 'pgs':
      case 'hdmv_pgs_subtitle':
        return 'sup';
      case 'dvd_subtitle':
      case 'dvdsub':
        return 'sub';
      default:
        return 'srt';
    }
  }

  /// Formats a subtitle codec name to a user-friendly display format.
  ///
  /// Converts internal codec names like 'SUBRIP' to friendly names like 'SRT'.
  static String formatSubtitleCodec(String codec) {
    final upper = codec.toUpperCase();
    
    // Handle full MIME types often returned by ExoPlayer
    if (upper.contains('SUBRIP')) return 'SRT';
    if (upper.contains('WEBVTT')) return 'VTT';
    if (upper.contains('SSA')) return 'SSA';
    if (upper.contains('ASS')) return 'ASS';
    if (upper.contains('PGS')) return 'PGS';
    if (upper.contains('DVBSUB')) return 'DVB';
    if (upper.contains('DVD')) return 'DVD';
    if (upper.contains('TTML')) return 'TTML';
    if (upper.contains('MOV_TEXT')) return 'MOV';

    return switch (upper) {
      'SUBRIP' => 'SRT',
      'DVD_SUBTITLE' => 'DVD',
      'WEBVTT' => 'VTT',
      'SSA' => 'SSA',
      'ASS' => 'ASS',
      'HDMV_PGS_SUBTITLE' => 'PGS',
      'MOV_TEXT' => 'MOV',
      _ => upper,
    };
  }

  /// Formats a video codec name to a user-friendly display format.
  ///
  /// Converts internal codec names like 'hevc' to friendly names like 'HEVC'.
  static String formatVideoCodec(String codec) {
    final lower = codec.toLowerCase();
    return switch (lower) {
      'h264' || 'avc1' || 'avc' => 'H.264',
      'hevc' || 'h265' || 'hev1' => 'HEVC',
      'av1' => 'AV1',
      'vp8' => 'VP8',
      'vp9' => 'VP9',
      'mpeg2video' || 'mpeg2' => 'MPEG-2',
      'mpeg4' => 'MPEG-4',
      'vc1' => 'VC-1',
      _ => codec.toUpperCase(),
    };
  }

  /// Formats an audio codec name to a user-friendly display format.
  static String formatAudioCodec(String codec) {
    final lower = codec.toLowerCase();
    return switch (lower) {
      'aac' => 'AAC',
      'he-aac' || 'he_aac' || 'heaac' => 'HE-AAC',
      'ac3' || 'ac-3' => 'AC3',
      'eac3' || 'ec-3' || 'ec3' => 'EAC3',
      'truehd' => 'TrueHD',
      'dts' || 'dca' => 'DTS',
      'dtshd' || 'dts-hd' || 'dts_hd' || 'dtshd_ma' || 'dts-hd_ma' || 'dts-ma' => 'DTS-HD MA',
      'dtshd_hra' || 'dts-hd_hra' => 'DTS-HD HRA',
      'flac' => 'FLAC',
      'alac' => 'ALAC',
      'mp3' || 'mp3float' => 'MP3',
      'opus' => 'Opus',
      'vorbis' => 'Vorbis',
      'pcm_s16le' || 'pcm_s24le' || 'pcm' || 'pcm_s32le' => 'PCM',
      _ => codec.toUpperCase(),
    };
  }

  /// Formats audio channels into a user-friendly display format.
  static String formatChannels(int? channels) {
    if (channels == null) return '';
    return switch (channels) {
      1 => 'Mono',
      2 => 'Stereo',
      6 => '5.1',
      8 => '7.1',
      _ => '${channels}ch',
    };
  }
}
