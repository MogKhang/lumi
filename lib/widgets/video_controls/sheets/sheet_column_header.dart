import 'package:flutter/material.dart';

class SheetColumnHeader extends StatelessWidget {
  final String label;

  /// Optional widget rendered at the right edge of the header row (e.g. a
  /// toggle). Aligned on the same baseline as [label].
  final Widget? trailing;

  const SheetColumnHeader({super.key, required this.label, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
