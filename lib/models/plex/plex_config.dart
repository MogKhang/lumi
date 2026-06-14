import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/plex_device_info.dart';

class PlexConfig {
  final String baseUrl;
  final String? token;
  final String clientIdentifier;
  final String product;
  final String version;
  final String platform;
  final String? device;
  final String? deviceName;
  final bool acceptJson;
  final String? machineIdentifier;

  PlexConfig({
    required this.baseUrl,
    this.token,
    required this.clientIdentifier,
    required this.product,
    required this.version,
    this.platform = 'Flutter',
    this.device,
    this.deviceName,
    this.acceptJson = true,
    this.machineIdentifier,
  });

  static Future<PlexConfig> create({
    required String baseUrl,
    String? token,
    required String clientIdentifier,
    String? product,
    String? platform,
    String? device,
    String? deviceName,
    bool acceptJson = true,
    String? machineIdentifier,
  }) async {
    final packageInfo = await PackageInfo.fromPlatform();
    // Resolve the real device identity so Plex's "Now Playing" dashboard shows
    // the platform/device after the product name (e.g. "Lumi — Apple TV",
    // "Lumi — Khang HONOR 200") like the official clients do.
    final deviceInfo = await PlexDeviceInfo.resolve();
    return PlexConfig(
      baseUrl: baseUrl,
      token: token,
      clientIdentifier: clientIdentifier,
      product: product ?? 'Lumi',
      version: packageInfo.version,
      platform: platform ?? deviceInfo.platform,
      device: device ?? deviceInfo.device,
      deviceName: deviceName ?? deviceInfo.deviceName,
      acceptJson: acceptJson,
      machineIdentifier: machineIdentifier,
    );
  }

  Map<String, String> get headers {
    final headers = {
      'X-Plex-Client-Identifier': clientIdentifier,
      'X-Plex-Product': product,
      'X-Plex-Version': version,
      'X-Plex-Platform': platform,
      'X-Plex-Client-Profile-Name': 'Generic',
      'X-Plex-Device': ?device,
      'X-Plex-Device-Name': ?deviceName,
      if (acceptJson) 'Accept': 'application/json',
      'Accept-Charset': 'utf-8',
    };

    if (token != null) {
      headers['X-Plex-Token'] = token!;
    }

    return headers;
  }

  PlexConfig copyWith({
    String? baseUrl,
    String? token,
    String? clientIdentifier,
    String? product,
    String? version,
    String? platform,
    String? device,
    String? deviceName,
    bool? acceptJson,
    String? machineIdentifier,
  }) {
    return PlexConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      token: token ?? this.token,
      clientIdentifier: clientIdentifier ?? this.clientIdentifier,
      product: product ?? this.product,
      version: version ?? this.version,
      platform: platform ?? this.platform,
      device: device ?? this.device,
      deviceName: deviceName ?? this.deviceName,
      acceptJson: acceptJson ?? this.acceptJson,
      machineIdentifier: machineIdentifier ?? this.machineIdentifier,
    );
  }
}
