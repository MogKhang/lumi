import 'package:flutter/material.dart';
import '../theme/mono_tokens.dart';

class FocusTheme {
  FocusTheme._();

  static const double focusScale = 1.02;
  static const double focusBorderWidth = 2.5;
  static const double defaultBorderRadius = 8.0;

  static Color getFocusBorderColor(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  static Duration getAnimationDuration(BuildContext context) {
    return Theme.of(context).extension<MonoTokens>()?.fast ?? const Duration(milliseconds: 150);
  }

  static BoxDecoration focusDecoration(
    BuildContext context, {
    required bool isFocused,
    double borderRadius = defaultBorderRadius,
    Color? color,
  }) {
    final focusColor = color ?? getFocusBorderColor(context);

    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: isFocused ? focusColor : Colors.transparent, width: focusBorderWidth),
    );
  }

  /// Build focus decoration with background color instead of border.
  /// Useful for video controls where it should match the native hover style.
  static BoxDecoration focusBackgroundDecoration(
    BuildContext context, {
    required bool isFocused,
    double borderRadius = defaultBorderRadius,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? Colors.white : Colors.black;

    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: isFocused ? color.withValues(alpha: 0.15) : Colors.transparent,
    );
  }
}
