import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../connection/connection_registry.dart';
import '../../profiles/active_plex_identity.dart';
import '../../profiles/active_profile_provider.dart';
import '../../profiles/plex_home_service.dart';
import '../../profiles/profile_connection_registry.dart';
import '../../providers/companion_remote_provider.dart';
import '../../utils/app_logger.dart';

/// Start the companion-remote host server, resolving the active Plex identity
/// and ensuring the LAN crypto context is ready first. No-op (returns true) if
/// the host is already running. Returns whether the host ended up running.
///
/// Shared by the startup auto-start path and the live Settings toggle so both
/// use identical setup.
Future<bool> startCompanionRemoteHost(BuildContext context) async {
  final companionRemote = context.read<CompanionRemoteProvider>();
  if (companionRemote.isHostServerRunning) return true;

  try {
    final connections = context.read<ConnectionRegistry>();
    final activeProfile = context.read<ActiveProfileProvider>();
    final profileConnections = context.read<ProfileConnectionRegistry>();
    final plexHome = context.read<PlexHomeService>();
    final identity = await resolveActivePlexIdentity(
      activeProfile: activeProfile,
      connections: connections,
      profileConnections: profileConnections,
    );
    if (!context.mounted) return false;
    final home = identity == null ? null : await plexHome.materializePlexHomeForConnection(identity.account.id);
    if (!context.mounted) return false;
    final ok = await companionRemote.ensureCryptoReady(
      home,
      connections: connections,
      activeProfile: activeProfile,
      profileConnections: profileConnections,
      identity: identity,
      plexHomeForConnection: plexHome.materializePlexHomeForConnection,
    );
    if (!context.mounted || !ok) return false;

    await companionRemote.startHostServer();
    return companionRemote.isHostServerRunning;
  } catch (e) {
    appLogger.e('CompanionRemote: Failed to start server', error: e);
    return false;
  }
}

/// Apply the "Companion Remote Server" enable/disable setting live: start the
/// host when enabled, stop it when disabled. Wired to the Settings toggle so it
/// takes effect immediately instead of only at next launch.
Future<void> applyCompanionRemoteServerSetting(BuildContext context, bool enabled) async {
  final companionRemote = context.read<CompanionRemoteProvider>();
  if (!enabled) {
    await companionRemote.stopHostServer();
    return;
  }
  await startCompanionRemoteHost(context);
}
