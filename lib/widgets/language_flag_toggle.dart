import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../i18n/strings.g.dart';
import '../services/settings_service.dart';

/// A compact two-flag language switcher: Vietnamese (left) and English (right).
///
/// The active locale's flag is highlighted; the inactive one is greyed out.
/// Tapping a flag switches the app locale instantly via [LocaleSettings] (the
/// app-wide [TranslationProvider] rebuilds the whole tree, so no restart is
/// needed) and persists the choice to [SettingsService].
class LanguageFlagToggle extends StatefulWidget {
  const LanguageFlagToggle({super.key});

  @override
  State<LanguageFlagToggle> createState() => _LanguageFlagToggleState();
}

class _LanguageFlagToggleState extends State<LanguageFlagToggle> {
  Future<void> _select(AppLocale locale) async {
    if (LocaleSettings.currentLocale == locale) return;
    await SettingsService.instanceOrNull?.write(SettingsService.appLocale, locale);
    await LocaleSettings.setLocale(locale);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final current = LocaleSettings.currentLocale;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FlagButton(
            flag: const _VietnamFlag(),
            isActive: current == AppLocale.vi,
            onTap: () => _select(AppLocale.vi),
            semanticLabel: 'Tiếng Việt',
          ),
          const SizedBox(width: 2),
          _FlagButton(
            flag: const _UkFlag(),
            isActive: current == AppLocale.en,
            onTap: () => _select(AppLocale.en),
            semanticLabel: 'English',
          ),
        ],
      ),
    );
  }
}

class _FlagButton extends StatelessWidget {
  final Widget flag;
  final bool isActive;
  final VoidCallback onTap;
  final String semanticLabel;

  const _FlagButton({
    required this.flag,
    required this.isActive,
    required this.onTap,
    required this.semanticLabel,
  });

  static const double _size = 30;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      selected: isActive,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: isActive ? 1.0 : 0.4,
          child: Container(
            width: _size,
            height: _size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive ? const Color(0xFFEC609B) : Colors.transparent,
                width: 2,
              ),
            ),
            child: ClipOval(child: flag),
          ),
        ),
      ),
    );
  }
}

/// Vietnam flag: red field with a centered yellow five-pointed star.
class _VietnamFlag extends StatelessWidget {
  const _VietnamFlag();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _VietnamFlagPainter(),
      size: Size.infinite,
    );
  }
}

class _VietnamFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Offset.zero & size, Paint()..color = const Color(0xFFDA251D));
    final star = _starPath(
      center: Offset(size.width / 2, size.height / 2),
      outerRadius: size.width * 0.30,
      innerRadius: size.width * 0.30 * 0.42,
    );
    canvas.drawPath(star, Paint()..color = const Color(0xFFFFFF00));
  }

  Path _starPath({required Offset center, required double outerRadius, required double innerRadius}) {
    final path = Path();
    const points = 5;
    // Start at the top point (-90°).
    for (var i = 0; i < points * 2; i++) {
      final radius = i.isEven ? outerRadius : innerRadius;
      final angle = -math.pi / 2 + i * math.pi / points;
      final dx = center.dx + radius * math.cos(angle);
      final dy = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(dx, dy);
      } else {
        path.lineTo(dx, dy);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// UK Union Jack — simplified but recognizable (blue field, white + red
/// diagonal saltires, white + red upright cross).
class _UkFlag extends StatelessWidget {
  const _UkFlag();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _UkFlagPainter(),
      size: Size.infinite,
    );
  }
}

class _UkFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final rect = Offset.zero & size;
    canvas.clipRect(rect);

    canvas.drawRect(rect, Paint()..color = const Color(0xFF012169)); // blue field

    final whiteDiag = Paint()
      ..color = Colors.white
      ..strokeWidth = h * 0.30
      ..style = PaintingStyle.stroke;
    final redDiag = Paint()
      ..color = const Color(0xFFC8102E)
      ..strokeWidth = h * 0.14
      ..style = PaintingStyle.stroke;

    // Diagonal saltires (white under, red over).
    canvas.drawLine(Offset.zero, Offset(w, h), whiteDiag);
    canvas.drawLine(Offset(w, 0), Offset(0, h), whiteDiag);
    canvas.drawLine(Offset.zero, Offset(w, h), redDiag);
    canvas.drawLine(Offset(w, 0), Offset(0, h), redDiag);

    // Upright cross: white band then red band.
    canvas.drawRect(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h * 0.34),
      Paint()..color = Colors.white,
    );
    canvas.drawRect(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w * 0.34, height: h),
      Paint()..color = Colors.white,
    );
    canvas.drawRect(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h * 0.18),
      Paint()..color = const Color(0xFFC8102E),
    );
    canvas.drawRect(
      Rect.fromCenter(center: Offset(w / 2, h / 2), width: w * 0.18, height: h),
      Paint()..color = const Color(0xFFC8102E),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
