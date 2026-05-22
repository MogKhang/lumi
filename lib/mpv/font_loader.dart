import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../utils/app_logger.dart';

/// Extracts font files from Flutter assets to the cache directory for
/// comprehensive Unicode coverage (including CJK characters) for libass subtitles.
class SubtitleFontLoader {
  static const String _fontAssetPath = 'assets/fonts/Lexend-VariableFont_wght.ttf';
  static const String _fontName = 'Lexend';

  /// In-memory cache of the resolved font directory. The filesystem work
  /// (temp dir lookup, existence checks, asset extraction) is idempotent per
  /// process — caching the result skips ~20ms on every subsequent Player
  /// instantiation.
  static Future<String?>? _cachedFontDir;

  static Future<String?> loadSubtitleFont() {
    return _cachedFontDir ??= _loadSubtitleFontOnce();
  }

  static Future<String?> _loadSubtitleFontOnce() async {
    try {
      // Use the application support directory rather than the temp directory.
      // iOS can purge the temp directory when the app is backgrounded; the
      // app support directory persists, so the font survives across sessions
      // without needing to re-extract it every time.
      final cacheDir = await getApplicationSupportDirectory();
      final fontDir = Directory(path.join(cacheDir.path, 'subtitle_fonts'));

      if (!await fontDir.exists()) {
        await fontDir.create(recursive: true);
      }

      final fontFile = File(path.join(fontDir.path, 'Lexend-VariableFont_wght.ttf'));

      if (!await fontFile.exists()) {
        final fontData = await rootBundle.load(_fontAssetPath);
        await fontFile.writeAsBytes(fontData.buffer.asUint8List());
      }

      return fontDir.path;
    } catch (e, st) {
      appLogger.w('Failed to load subtitle font', error: e, stackTrace: st);
      return null;
    }
  }

  static String get fontName => _fontName;

  static String get fontAssetPath => _fontAssetPath;
}
