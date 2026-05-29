import '../i18n/strings.g.dart';

/// Helpers for mapping a Plex genre (always English) to its local poster
/// asset and its translated display name.
///
/// Posters live at `assets/genres/<slug>.jpg`, 1000x1500px. The slug is a
/// lowercased, hyphenated form of the English genre name with `+` spelled out
/// as `plus`. Examples:
///   "Science Fiction" -> science-fiction
///   "Martial Arts"    -> martial-arts
///   "18+"             -> 18-plus
///   "TV Movie"        -> tv-movie
String genreSlug(String englishName) {
  final lower = englishName.trim().toLowerCase().replaceAll('+', '-plus');
  return lower
      .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
      .replaceAll(RegExp(r'-{2,}'), '-')
      .replaceAll(RegExp(r'^-|-$'), '');
}

/// Asset path of the poster for [englishName]. The file is supplied manually;
/// the genre card falls back to a placeholder when the asset is missing.
String genrePosterAsset(String englishName) => 'assets/genres/${genreSlug(englishName)}.jpg';

/// Localized display name for an English genre name. Falls back to the English
/// name when no translation exists for the active locale.
String translatedGenreName(String englishName) => t.genres.names[englishName] ?? englishName;
