import 'package:flutter/material.dart';

import '../utils/platform_detector.dart';

/// Captures iPhone/iPad status-bar taps and scrolls the nearest primary scroll
/// view to the top — the standard iOS "tap the clock to go up" behavior.
///
/// Flutter's [Scaffold] forwards the native scroll-to-top callback to the
/// [PrimaryScrollController], but on some iOS versions the tap also arrives as
/// an ordinary pointer over the Flutter view, which can activate controls
/// sitting under the status bar. This widget overlays a transparent tap target
/// across the top safe-area inset so those taps reliably scroll to the top
/// instead of hitting the content beneath.
class IosStatusBarTapScrollToTop extends StatelessWidget {
  final Widget child;

  /// Optional explicit controller. Falls back to the ambient
  /// [PrimaryScrollController] when omitted.
  final ScrollController? controller;

  const IosStatusBarTapScrollToTop({super.key, required this.child, this.controller});

  void _scrollToTop(BuildContext context) {
    if (!PlatformDetector.isHandheldIOS(context)) return;
    if (!(ModalRoute.of(context)?.isCurrent ?? true)) return;
    final scrollController = controller ?? PrimaryScrollController.maybeOf(context);
    if (scrollController == null || !scrollController.hasClients) return;
    scrollController.animateTo(0, duration: const Duration(milliseconds: 1000), curve: Curves.easeOutCirc);
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    if (!PlatformDetector.isHandheldIOS(context) || topInset <= 0) return child;

    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: topInset,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            excludeFromSemantics: true,
            onTap: () => _scrollToTop(context),
            child: const SizedBox.expand(),
          ),
        ),
      ],
    );
  }
}
