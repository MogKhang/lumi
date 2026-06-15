import 'package:flutter/material.dart';

/// Shows the pointer/hand cursor on desktop & web when hovering a clickable
/// control. Wrap interactive widgets so mouse users get the expected affordance.
class ClickableCursor extends StatelessWidget {
  final Widget child;
  final bool enabled;

  const ClickableCursor({super.key, required this.child, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(cursor: enabled ? SystemMouseCursors.click : MouseCursor.defer, child: child);
  }
}
