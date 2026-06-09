import 'package:flutter/material.dart';
import 'package:lumi/widgets/app_icon.dart';

import '../../focus/focusable_wrapper.dart';
import '../../theme/mono_tokens.dart';

/// A standardized button for video player controls with improved tap targets.
///
/// This widget ensures consistent tap target sizing across all video control
/// buttons without changing their visual appearance. The larger tap area makes
/// buttons easier to interact with, especially on mobile devices.
class VideoControlButton extends StatelessWidget {
  final IconData icon;

  final VoidCallback? onPressed;

  /// The color of the icon. Defaults to white, or the brand accent if
  /// [isActive] is true.
  final Color? color;

  /// Optional tooltip text shown on hover or long press.
  final String? tooltip;

  /// Optional semantic label for screen readers.
  /// If not provided, falls back to tooltip.
  final String? semanticLabel;

  /// Whether this button represents an active state (e.g., a feature is enabled).
  /// When true, the icon color defaults to the brand accent instead of white.
  final bool isActive;

  /// Optional FocusNode for D-pad/keyboard navigation.
  /// When provided, the button becomes focusable with visual focus indicator.
  final FocusNode? focusNode;

  /// Custom key event handler for focus navigation.
  final KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent;

  final ValueChanged<bool>? onFocusChange;

  final bool autofocus;

  const VideoControlButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.tooltip,
    this.semanticLabel,
    this.isActive = false,
    this.focusNode,
    this.onKeyEvent,
    this.onFocusChange,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the effective color: explicit color > active brand accent > default white
    final effectiveColor = color ?? (isActive ? MonoTokens.brandAccent : Colors.white);

    // Material's default hover overlay (~8% over the video) is too faint to
    // read on desktop. Use a stronger white wash so the mouse-hover highlight
    // is as visible as the keyboard/D-pad focus background (which uses ~30%).
    final overlayColor = WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.pressed)) return Colors.white.withValues(alpha: 0.3);
      if (states.contains(WidgetState.hovered)) return Colors.white.withValues(alpha: 0.22);
      return null;
    });

    final button = IconButton(
      icon: AppIcon(icon, fill: 1, color: effectiveColor),
      onPressed: onPressed,
      tooltip: tooltip,
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      style: ButtonStyle(overlayColor: overlayColor),
    );

    Widget result = semanticLabel != null
        ? Semantics(label: semanticLabel, button: true, excludeSemantics: true, child: button)
        : button;

    if (focusNode != null) {
      result = FocusableWrapper(
        focusNode: focusNode,
        onSelect: onPressed,
        onKeyEvent: onKeyEvent,
        onFocusChange: onFocusChange,
        autofocus: autofocus,
        semanticLabel: semanticLabel,
        borderRadius: 20, // Circular for icon buttons
        autoScroll: false, // Video controls don't scroll
        useBackgroundFocus: true, // Use background highlight for video controls
        child: result,
      );
    }

    return result;
  }
}
