import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:logger/logger.dart';
import 'package:lumi/utils/media_server_http_client.dart';
import 'base_shared_preferences_service.dart';

/// Service to check for new versions on GitHub.
/// Only enabled when the ENABLE_UPDATE_CHECK build flag is set.
///
/// Checks the latest GitHub release and, when a newer version exists, lets the
/// UI present the in-app update dialog. The dialog's "Update" button routes to
/// the right place per platform via [updateDestination] (Play Store, App Store,
/// or the macOS/Windows download pages).
class UpdateService {
  static final Logger _logger = Logger();
  static const String _githubRepo = 'mogkhang/lumi';

  static const String _keySkippedVersion = 'update_skipped_version';
  static const String _keyLastCheckTime = 'update_last_check_time';
  static const String _keyUpdatesDisabled = 'update_prompts_disabled';

  // Check cooldown: 6 hours
  static const Duration _checkCooldown = Duration(hours: 6);

  // ---------------------------------------------------------------------------
  // Store / download destinations for the in-app "Update" button.
  //
  // Each platform's Update action sends the user to the place they actually
  // install Lumi from, so they can update it themselves:
  //   - Android  -> Google Play listing
  //   - iOS/iPad -> App Store listing
  //   - Apple TV -> App Store listing (tvOS)
  //   - macOS    -> DMG download page
  //   - Windows  -> EXE installer download page
  // ---------------------------------------------------------------------------

  /// Android application id (Play Store package name).
  static const String _androidPackage = 'com.mogkhang.lumi';

  /// Apple App Store numeric id (the digits in
  /// `apps.apple.com/app/id<NUMBER>`). Shared by iOS, iPadOS and tvOS.
  ///
  /// TODO(store): Lumi is not on the App Store yet. Once the app is approved,
  /// set this to the numeric id from App Store Connect (e.g. '123456789').
  /// While empty, the iOS/tvOS Update button falls back to the GitHub release
  /// page so it always does *something* useful.
  static const String _appStoreId = '';

  /// macOS DMG download page.
  static const String _macDownloadUrl = 'https://go.khocuky.page/mac';

  /// Windows EXE installer download page.
  static const String _windowsDownloadUrl = 'https://go.khocuky.page/win';

  /// The URL the in-app "Update" button should open for the current platform.
  ///
  /// [releaseUrl] is the GitHub release page from the update check; it is used
  /// as the fallback (and on platforms without a dedicated store target).
  static Uri updateDestination({required String releaseUrl}) {
    if (Platform.isAndroid) {
      // Android routes this https listing to the Play Store app via the intent
      // system when launched externally; opens the web listing otherwise.
      return Uri.parse('https://play.google.com/store/apps/details?id=$_androidPackage');
    }
    if (Platform.isIOS) {
      // Covers iPhone, iPad and Apple TV (all report Platform.isIOS).
      if (_appStoreId.isNotEmpty) {
        return Uri.parse('https://apps.apple.com/app/id$_appStoreId');
      }
      return Uri.parse(releaseUrl);
    }
    if (Platform.isMacOS) return Uri.parse(_macDownloadUrl);
    if (Platform.isWindows) return Uri.parse(_windowsDownloadUrl);
    return Uri.parse(releaseUrl);
  }

  /// Check if update checking is enabled via build flag
  static bool get isUpdateCheckEnabled {
    return const bool.fromEnvironment('ENABLE_UPDATE_CHECK', defaultValue: false);
  }

  /// Whether the user chose "Do not ask again" — suppresses the startup update
  /// prompt entirely. The Settings → Updates "Check for Updates" action still
  /// works and re-enables prompting (see [setUpdatePromptsDisabled]).
  static Future<bool> areUpdatePromptsDisabled() async {
    final prefs = await BaseSharedPreferencesService.sharedCache();
    return prefs.getBool(_keyUpdatesDisabled) ?? false;
  }

  static Future<void> setUpdatePromptsDisabled(bool disabled) async {
    final prefs = await BaseSharedPreferencesService.sharedCache();
    await prefs.setBool(_keyUpdatesDisabled, disabled);
  }

  static Future<void> skipVersion(String version) async {
    final prefs = await BaseSharedPreferencesService.sharedCache();
    await prefs.setString(_keySkippedVersion, version);
  }

  static Future<String?> getSkippedVersion() async {
    final prefs = await BaseSharedPreferencesService.sharedCache();
    return prefs.getString(_keySkippedVersion);
  }

  static Future<void> clearSkippedVersion() async {
    final prefs = await BaseSharedPreferencesService.sharedCache();
    await prefs.remove(_keySkippedVersion);
  }

  /// Check if cooldown period has passed since last check
  static Future<bool> shouldCheckForUpdates() async {
    final prefs = await BaseSharedPreferencesService.sharedCache();
    final lastCheckString = prefs.getString(_keyLastCheckTime);

    if (lastCheckString == null) return true;

    final lastCheck = DateTime.parse(lastCheckString);
    final now = DateTime.now();
    final timeSinceLastCheck = now.difference(lastCheck);

    return timeSinceLastCheck >= _checkCooldown;
  }

  static Future<void> _updateLastCheckTime() async {
    final prefs = await BaseSharedPreferencesService.sharedCache();
    await prefs.setString(_keyLastCheckTime, DateTime.now().toIso8601String());
  }

  /// Internal method that performs the actual update check
  /// [respectCooldown] - if true (startup path), honors the check cooldown,
  /// the per-version skip, and the "Do not ask again" preference, and updates
  /// the last-check time. Manual checks pass false so they always run.
  static Future<Map<String, dynamic>?> _performUpdateCheck({required bool respectCooldown}) async {
    if (!isUpdateCheckEnabled) {
      return null;
    }

    // "Do not ask again" only suppresses the automatic startup prompt; a manual
    // check from Settings still runs and re-enables prompting.
    if (respectCooldown && await areUpdatePromptsDisabled()) {
      return null;
    }

    // Check cooldown if requested
    if (respectCooldown && !await shouldCheckForUpdates()) {
      return null;
    }

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;

      final response = await httpClient.get(
        'https://api.github.com/repos/$_githubRepo/releases/latest',
        headers: {'Accept': 'application/vnd.github+json'},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final latestVersion = data['tag_name'] as String;

        // Remove 'v' prefix if present
        final cleanVersion = latestVersion.startsWith('v') ? latestVersion.substring(1) : latestVersion;

        final hasUpdate = _isNewerVersion(cleanVersion, currentVersion);

        if (hasUpdate) {
          // Check if this version was skipped
          final skippedVersion = await getSkippedVersion();
          if (skippedVersion == cleanVersion) {
            // Update last check time even when skipped (if respecting cooldown)
            if (respectCooldown) {
              await _updateLastCheckTime();
            }
            return null;
          }

          // Update last check time on success (if respecting cooldown)
          if (respectCooldown) {
            await _updateLastCheckTime();
          }

          return {
            'hasUpdate': true,
            'currentVersion': currentVersion,
            'latestVersion': cleanVersion,
            'releaseUrl': data['html_url'] as String,
            'releaseName': data['name'] as String? ?? 'Version $cleanVersion',
            'releaseNotes': data['body'] as String? ?? '',
            'publishedAt': data['published_at'] as String,
          };
        }
      }

      // Update last check time even when no update (if respecting cooldown)
      if (respectCooldown) {
        await _updateLastCheckTime();
      }
    } catch (e) {
      _logger.e('Failed to check for updates: $e');
    }

    return null;
  }

  /// Check for updates on GitHub (manual check, ignores cooldown)
  /// Returns a map with update info, or null if no update or error
  static Future<Map<String, dynamic>?> checkForUpdates() {
    return _performUpdateCheck(respectCooldown: false);
  }

  /// Check for updates on startup (respects cooldown and skipped versions)
  /// Returns update info if available, null otherwise
  static Future<Map<String, dynamic>?> checkForUpdatesOnStartup() {
    return _performUpdateCheck(respectCooldown: true);
  }

  /// Parse version string into list of integers
  /// Handles versions like "1.2.3+4" by taking only the numeric parts
  static List<int> _parseVersionParts(String version) {
    return version.split('.').map((p) {
      final numPart = p.split('+').first.split('-').first;
      return int.tryParse(numPart) ?? 0;
    }).toList();
  }

  /// Compare two version strings
  /// Returns true if newVersion is newer than currentVersion
  static bool _isNewerVersion(String newVersion, String currentVersion) {
    try {
      final newParts = _parseVersionParts(newVersion);
      final currentParts = _parseVersionParts(currentVersion);

      // Compare each part
      final maxLength = newParts.length > currentParts.length ? newParts.length : currentParts.length;

      for (int i = 0; i < maxLength; i++) {
        final newPart = i < newParts.length ? newParts[i] : 0;
        final currentPart = i < currentParts.length ? currentParts[i] : 0;

        if (newPart > currentPart) return true;
        if (newPart < currentPart) return false;
      }

      return false;
    } catch (e) {
      _logger.e('Error comparing versions: $e');
      return false;
    }
  }
}
