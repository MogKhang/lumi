import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../i18n/strings.g.dart';
import '../services/update_service.dart';
import '../widgets/dialog_action_button.dart';

/// What the user chose in the update dialog.
enum UpdateDialogResult {
  /// Tapped "Update" — sent to the store / download page.
  update,

  /// Tapped "Remind later" — dismissed; will be re-prompted after the cooldown.
  remindLater,

  /// Tapped "Do not ask again" — startup prompts suppressed via [UpdateService].
  doNotAskAgain,
}

/// Shows the "Update Available" pop-up with three actions:
///
///   • **Update**        → opens the right destination for this platform
///                         (Play Store / App Store / macOS DMG / Windows EXE).
///   • **Remind later**  → just dismisses; the startup check will prompt again
///                         next time the cooldown elapses.
///   • **Do not ask again** → suppresses future startup prompts (the manual
///                         "Check for Updates" in Settings still works).
///
/// Returns the chosen [UpdateDialogResult], or null if dismissed by tapping
/// outside / back.
Future<UpdateDialogResult?> showUpdateAvailableDialog(
  BuildContext context,
  Map<String, dynamic> updateInfo, {
  required String title,
}) {
  return showDialog<UpdateDialogResult>(
    context: context,
    builder: (dialogContext) {
      final latestVersion = updateInfo['latestVersion'] as String;
      final releaseUrl = updateInfo['releaseUrl'] as String;

      Future<void> onUpdate() async {
        final destination = UpdateService.updateDestination(releaseUrl: releaseUrl);
        if (await canLaunchUrl(destination)) {
          await launchUrl(destination, mode: LaunchMode.externalApplication);
        } else {
          // Fall back to the GitHub release page if the store/download URL
          // can't be handled (e.g. no Play Store app, no browser).
          final fallback = Uri.parse(releaseUrl);
          if (await canLaunchUrl(fallback)) {
            await launchUrl(fallback, mode: LaunchMode.externalApplication);
          }
        }
        if (dialogContext.mounted) Navigator.pop(dialogContext, UpdateDialogResult.update);
      }

      Future<void> onDoNotAskAgain() async {
        await UpdateService.setUpdatePromptsDisabled(true);
        if (dialogContext.mounted) Navigator.pop(dialogContext, UpdateDialogResult.doNotAskAgain);
      }

      void onRemindLater() => Navigator.pop(dialogContext, UpdateDialogResult.remindLater);

      return AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.update.versionAvailable(version: latestVersion),
              style: Theme.of(dialogContext).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              t.update.currentVersion(version: updateInfo['currentVersion']),
              style: Theme.of(dialogContext).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          DialogActionButton(onPressed: onDoNotAskAgain, label: t.update.doNotAskAgain),
          DialogActionButton(onPressed: onRemindLater, label: t.update.remindLater),
          DialogActionButton(onPressed: onUpdate, label: t.update.updateNow, isPrimary: true),
        ],
      );
    },
  );
}
