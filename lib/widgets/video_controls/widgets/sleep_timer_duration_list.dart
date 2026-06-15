import 'package:flutter/material.dart';
import 'package:lumi/widgets/app_icon.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../../mpv/mpv.dart';
import '../../../services/sleep_timer_service.dart';
import '../../../utils/formatters.dart';
import '../../../utils/snackbar_helper.dart';
import '../../../widgets/overlay_sheet.dart';
import '../../../i18n/strings.g.dart';

class SleepTimerDurationList extends StatelessWidget {
  final Player player;
  final SleepTimerService sleepTimer;
  final int? defaultDuration;

  const SleepTimerDurationList({super.key, required this.player, required this.sleepTimer, this.defaultDuration});

  @override
  Widget build(BuildContext context) {
    final durations = [5, 10, 15, 30, 45, 60, 90, 120];
    // Add default duration if provided and not already in list
    if (defaultDuration != null && !durations.contains(defaultDuration)) {
      durations.add(defaultDuration!);
      durations.sort();
    }

    // First row arms the timer to stop at the end of the current video instead
    // of after a fixed duration; the rest are minute durations.
    return ListView.builder(
      itemCount: durations.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          final endOfVideoLabel = t.videoSettings.sleepTimerEndOfVideo;
          return ListTile(
            leading: AppIcon(
              Symbols.hourglass_bottom_rounded,
              fill: 1,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            title: Text(endOfVideoLabel),
            selected: sleepTimer.isEndOfVideoMode,
            onTap: () {
              sleepTimer.armEndOfVideo(() {
                // Pause playback when the current video ends.
                player.pause();
              });
              OverlaySheetController.closeAdaptive(context);
              showSuccessSnackBar(context, t.messages.sleepTimerSet(label: endOfVideoLabel));
            },
          );
        }

        final minutes = durations[index - 1];
        final label = formatDurationTextual(
          minutes * 60 * 1000, // Convert minutes to milliseconds
          abbreviated: false, // Use full format for better readability
        );

        return ListTile(
          leading: AppIcon(Symbols.timer_rounded, fill: 1, color: Theme.of(context).colorScheme.onSurfaceVariant),
          title: Text(label),
          onTap: () {
            sleepTimer.startTimer(Duration(minutes: minutes), () {
              // Pause playback when timer completes
              player.pause();
            });
            OverlaySheetController.closeAdaptive(context);

            // Show confirmation snackbar
            showSuccessSnackBar(context, t.messages.sleepTimerSet(label: label));
          },
        );
      },
    );
  }
}
