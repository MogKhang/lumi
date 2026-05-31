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
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = LocaleSettings.currentLocale;
    final isVi = current == AppLocale.vi;

    return Container(
      width: 88,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2C).withValues(alpha: 0.6), // Premium dark theme matching background
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.12),
          width: 1.5,
        ),
      ),
      child: Stack(
        children: [
          // Smooth sliding indicator pill
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            left: isVi ? 3 : 45,
            top: 3,
            child: Container(
              width: 38,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFEC609B), // App brand tagline pink
                    Color(0xFFC8457D),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFEC609B).withValues(alpha: 0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          // Clickable flag overlay zones
          Row(
            children: [
              Expanded(
                child: Semantics(
                  label: 'Tiếng Việt',
                  button: true,
                  selected: isVi,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _select(AppLocale.vi),
                    child: Center(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: isVi ? 1.0 : 0.5,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: const ClipOval(child: _VietnamFlag()),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Semantics(
                  label: 'English',
                  button: true,
                  selected: !isVi,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _select(AppLocale.en),
                    child: Center(
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: !isVi ? 1.0 : 0.5,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: const ClipOval(child: _UkFlag()),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
