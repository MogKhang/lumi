import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../focus/focusable_wrapper.dart';
import '../i18n/strings.g.dart';
import '../services/settings_service.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final trackColor = isDark
        ? const Color(0xFF3B3B4F) // Brighter premium dark/violet-grey for dark mode
        : const Color(0xFFE2E2EC); // Crisp light grey-blue for light mode

    final sliderColor = isDark
        ? const Color(0xFFFFFFFF) // White in Dark mode
        : const Color(0xFF000000); // Black in Light mode

    return AnimatedToggle(
      initialPosition: isVi,
      onToggleCallback: (value) {
        final nextLocale = value == 0 ? AppLocale.vi : AppLocale.en;
        _select(nextLocale);
      },
      buttonColor: sliderColor,
      backgroundColor: trackColor,
      widgets: const [
        _VietnamFlag(),
        _UkFlag(),
      ],
    );
  }
}

class AnimatedToggle extends StatefulWidget {
  final List<Widget> widgets;
  final ValueChanged<int> onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final bool initialPosition;

  const AnimatedToggle({
    super.key,
    required this.widgets,
    required this.onToggleCallback,
    required this.initialPosition,
    this.backgroundColor = const Color(0xFF2C2C3E),
    this.buttonColor = const Color(0xFFEC609B),
  });

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  late bool initialPosition;

  @override
  void initState() {
    super.initState();
    initialPosition = widget.initialPosition;
  }

  @override
  void didUpdateWidget(covariant AnimatedToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialPosition != widget.initialPosition) {
      initialPosition = widget.initialPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Compact, nice and neat size configuration
    const double trackWidth = 80.0;
    const double trackHeight = 36.0;
    const double slideSize = 32.0;
    const double flagSize = 20.0;
    const double paddingSize = 2.0;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final toggleWidget = GestureDetector(
      onTap: () {
        initialPosition = !initialPosition;
        final index = initialPosition ? 0 : 1;
        widget.onToggleCallback(index);
        setState(() {});
      },
      child: Container(
        width: trackWidth,
        height: trackHeight,
        decoration: ShapeDecoration(
          color: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(trackHeight / 2),
            side: BorderSide(
              color: isDark 
                  ? Colors.white.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.08),
              width: 1.0,
            ),
          ),
        ),
        child: Stack(
          children: [
            // Left background flag slot (OFF position, Vietnamese flag)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(paddingSize),
                child: Container(
                  width: slideSize,
                  height: slideSize,
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 0.45, // Brighter flag visibility
                    child: SizedBox(
                      width: flagSize,
                      height: flagSize,
                      child: ClipOval(child: widget.widgets[0]),
                    ),
                  ),
                ),
              ),
            ),
            // Right background flag slot (ON position, UK flag)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(paddingSize),
                child: Container(
                  width: slideSize,
                  height: slideSize,
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 0.45, // Brighter flag visibility
                    child: SizedBox(
                      width: flagSize,
                      height: flagSize,
                      child: ClipOval(child: widget.widgets[1]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: FocusableWrapper(
        borderRadius: trackHeight / 2, // 18.0
        disableScale: true,
        onSelect: () {
          initialPosition = !initialPosition;
          final index = initialPosition ? 0 : 1;
          widget.onToggleCallback(index);
          setState(() {});
        },
        child: SizedBox(
          width: trackWidth,
          height: trackHeight,
          child: Stack(
            children: <Widget>[
              toggleWidget,
              // Seamless animated active flag selector (ON/OFF)
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.decelerate,
                alignment:
                    initialPosition ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(paddingSize),
                  child: Container(
                    width: slideSize,
                    height: slideSize,
                    alignment: Alignment.center,
                    child: Container(
                      width: flagSize,
                      height: flagSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark ? Colors.white.withValues(alpha: 0.9) : Colors.black.withValues(alpha: 0.8),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: initialPosition ? widget.widgets[0] : widget.widgets[1],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
