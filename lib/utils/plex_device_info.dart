import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import 'platform_detector.dart';

/// Resolves the device identity Lumi advertises to Plex via the
/// `X-Plex-Platform`, `X-Plex-Device` and `X-Plex-Device-Name` headers.
///
/// Plex's "Now Playing" dashboard renders each stream as
/// `{X-Plex-Product} ({X-Plex-Device})` and surfaces `X-Plex-Device-Name`
/// as the friendly device label. The official clients populate these so the
/// dashboard reads e.g. "Plex for Apple TV — Apple TV" or
/// "Plex for Android — Khang HONOR 200". Without these headers Lumi shows up
/// as just "Lumi" with no device/platform suffix.
///
/// Resolution happens once (it hits the platform plugin) and is cached for the
/// process lifetime.
class PlexDeviceInfo {
  /// OS/platform family for `X-Plex-Platform` — e.g. `Android`, `iOS`,
  /// `tvOS`, `macOS`, `Windows`, `Linux`.
  final String platform;

  /// Device type/category for `X-Plex-Device`, shown after the product name
  /// in the dashboard — e.g. `Apple TV`, `iPhone`, `iPad`, `Android`,
  /// `Android TV`, `Windows`, `OSX`.
  final String device;

  /// Friendly per-device name for `X-Plex-Device-Name` — e.g. the user's
  /// device name ("Khang's iPhone", "HONOR 200", a computer name).
  final String deviceName;

  const PlexDeviceInfo({required this.platform, required this.device, required this.deviceName});

  static PlexDeviceInfo? _cached;

  /// Resolve (and cache) the device identity. Safe to call repeatedly.
  ///
  /// [TvDetectionService] must already be initialized for accurate Android TV /
  /// Apple TV classification; this reads its synchronous flags.
  static Future<PlexDeviceInfo> resolve() async {
    if (_cached != null) return _cached!;

    final deviceInfo = DeviceInfoPlugin();
    String platform;
    String device;
    String deviceName;

    final isTv = PlatformDetector.isTV();
    final isAppleTv = PlatformDetector.isAppleTV();

    try {
      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        // brand + model gives "HONOR 200", "samsung SM-...", etc. Plex's own
        // Android client reports the same shape.
        final brand = _capitalize(info.brand);
        final model = info.model;
        deviceName = model.toLowerCase().startsWith(info.brand.toLowerCase()) ? model : '$brand $model'.trim();
        if (isTv) {
          platform = 'Android';
          device = 'Android TV';
        } else {
          platform = 'Android';
          device = 'Android';
        }
      } else if (Platform.isIOS) {
        if (isAppleTv) {
          // tvOS build (or detected Apple TV hardware).
          final info = await deviceInfo.iosInfo;
          platform = 'tvOS';
          device = 'Apple TV';
          deviceName = info.name.isNotEmpty ? info.name : 'Apple TV';
        } else {
          final info = await deviceInfo.iosInfo;
          platform = 'iOS';
          // model is "iPhone" / "iPad" / "iPod touch".
          final model = info.model;
          device = model.contains('iPad')
              ? 'iPad'
              : model.contains('iPod')
              ? 'iPod'
              : 'iPhone';
          deviceName = info.name.isNotEmpty ? info.name : device;
        }
      } else if (Platform.isMacOS) {
        final info = await deviceInfo.macOsInfo;
        platform = 'macOS';
        // Plex labels Mac desktop clients "OSX".
        device = 'OSX';
        deviceName = info.computerName.isNotEmpty ? info.computerName : 'Mac';
      } else if (Platform.isWindows) {
        final info = await deviceInfo.windowsInfo;
        platform = 'Windows';
        device = 'Windows';
        deviceName = info.computerName.isNotEmpty ? info.computerName : 'Windows';
      } else if (Platform.isLinux) {
        final info = await deviceInfo.linuxInfo;
        platform = 'Linux';
        device = 'Linux';
        deviceName = info.name.isNotEmpty ? info.name : 'Linux';
      } else {
        platform = Platform.operatingSystem;
        device = Platform.operatingSystem;
        deviceName = Platform.localHostname;
      }
    } catch (_) {
      // device_info_plus can throw on some platforms/permissions — fall back
      // to OS-derived values rather than failing playback identity entirely.
      platform = Platform.operatingSystem;
      device = isAppleTv
          ? 'Apple TV'
          : isTv
          ? 'TV'
          : Platform.operatingSystem;
      deviceName = Platform.localHostname.isNotEmpty ? Platform.localHostname : 'Lumi';
    }

    return _cached = PlexDeviceInfo(platform: platform, device: device, deviceName: deviceName);
  }

  /// Synchronous access to the resolved identity, or null if [resolve] has not
  /// completed yet.
  static PlexDeviceInfo? get cached => _cached;

  static String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }
}
