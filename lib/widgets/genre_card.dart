import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../focus/focusable_wrapper.dart';
import '../media/media_genre.dart';
import '../utils/genre_assets.dart';
import '../utils/platform_detector.dart';
import 'app_icon.dart';

/// A focusable poster card for a genre. Mirrors the [MediaCard] grid layout
/// (poster filling the cell, title below) but draws a local asset poster and
/// a localized genre name. Tapping/selecting invokes [onTap].
class GenreCard extends StatelessWidget {
  final MediaGenre genre;
  final VoidCallback onTap;
  final FocusNode? focusNode;
  final VoidCallback? onBack;
  final VoidCallback? onNavigateUp;
  final VoidCallback? onNavigateDown;
  final VoidCallback? onNavigateLeft;
  final VoidCallback? onNavigateRight;
  final ValueChanged<bool>? onFocusChange;
  final bool disableScale;

  const GenreCard({
    super.key,
    required this.genre,
    required this.onTap,
    this.focusNode,
    this.onBack,
    this.onNavigateUp,
    this.onNavigateDown,
    this.onNavigateLeft,
    this.onNavigateRight,
    this.onFocusChange,
    this.disableScale = false,
  });

  @override
  Widget build(BuildContext context) {
    final name = translatedGenreName(genre.title);

    return FocusableWrapper(
      focusNode: focusNode,
      onSelect: onTap,
      onBack: onBack,
      onNavigateUp: onNavigateUp,
      onNavigateDown: onNavigateDown,
      onNavigateLeft: onNavigateLeft,
      onNavigateRight: onNavigateRight,
      onFocusChange: onFocusChange,
      disableScale: disableScale,
      useComfortableZone: !PlatformDetector.isTV(),
      scrollAlignment: 0.5,
      semanticLabel: name,
      child: InkWell(
        canRequestFocus: false,
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 3, 3, 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: _GenrePoster(genre: genre),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, height: 1.3),
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}

/// Asset poster with a graceful placeholder when the file is missing.
class _GenrePoster extends StatelessWidget {
  final MediaGenre genre;

  const _GenrePoster({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      genrePosterAsset(genre.title),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
      errorBuilder: (context, error, stackTrace) => _placeholder(context),
    );
  }

  Widget _placeholder(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      color: scheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: AppIcon(
        Symbols.theater_comedy_rounded,
        fill: 1,
        size: 40,
        color: scheme.onSurfaceVariant,
      ),
    );
  }
}
