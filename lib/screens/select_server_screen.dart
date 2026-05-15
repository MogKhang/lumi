import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import '../providers/multi_server_provider.dart';
import '../providers/libraries_provider.dart';
import '../i18n/strings.g.dart';
import '../utils/app_logger.dart';
import '../focus/focusable_button.dart';

/// Screen that lets the user pick which Plex/Jellyfin server to use.
///
/// Shown after authentication (and optional profile selection) before the
/// Home screen. The selection is persisted via [MultiServerProvider.setSelectedServerId]
/// which is the same mechanism used by the "Switch Server" option in Settings.
class SelectServerScreen extends StatefulWidget {
  const SelectServerScreen({super.key});

  @override
  State<SelectServerScreen> createState() => _SelectServerScreenState();
}

class _SelectServerScreenState extends State<SelectServerScreen> {
  String? _selectedServerId;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MultiServerProvider>();
    final allowedServers = provider.allowedServerIds ?? provider.serverManager.serverIds;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                const SizedBox(height: 24),
                // Header icon
                Icon(
                  Symbols.dns_rounded,
                  size: 48,
                  color: colorScheme.primary,
                ),
                const SizedBox(height: 16),
                // Title
                Text(
                  t.serverSelection.selectServer,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                // Subtitle
                Text(
                  t.serverSelection.selectServerDescription,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                // Server list
                Expanded(
                  child: allowedServers.isEmpty
                      ? Center(
                          child: Text(
                            t.serverSelection.noServersAvailable,
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemCount: allowedServers.length,
                          // ignore: unnecessary_underscores
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final serverId = allowedServers.elementAt(index);
                            final client = provider.serverManager.getClient(serverId);
                            final serverName = client?.serverName ?? serverId;
                            final isSelected = _selectedServerId == serverId;
                            final isOnline = provider.serverManager.isServerOnline(serverId);

                            return _ServerTile(
                              serverName: serverName,
                              isSelected: isSelected,
                              isOnline: isOnline,
                              onTap: () {
                                setState(() {
                                  _selectedServerId = serverId;
                                });
                              },
                            );
                          },
                        ),
                ),
                const SizedBox(height: 24),
                // Done button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FocusableButton(
                    onPressed: _selectedServerId != null ? _onDone : null,
                    useBackgroundFocus: true,
                    child: IgnorePointer(
                      ignoring: _selectedServerId == null,
                      child: FilledButton(
                        onPressed: _selectedServerId != null ? _onDone : null,
                        style: _selectedServerId == null 
                          ? ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(colorScheme.onSurface.withValues(alpha: 0.12)),
                              foregroundColor: WidgetStatePropertyAll(colorScheme.onSurface.withValues(alpha: 0.38)),
                            )
                          : null,
                        child: Text(t.common.done),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDone() {
    if (_selectedServerId == null) return;

    final provider = context.read<MultiServerProvider>();
    provider.setSelectedServerId(_selectedServerId);
    appLogger.d('SelectServerScreen: selected server $_selectedServerId');

    // Reload libraries for the newly selected server
    context.read<LibrariesProvider>().loadLibraries();

    // Pop with true to signal selection was made
    Navigator.pop(context, true);
  }
}

class _ServerTile extends StatefulWidget {
  final String serverName;
  final bool isSelected;
  final bool isOnline;
  final VoidCallback onTap;

  const _ServerTile({
    required this.serverName,
    required this.isSelected,
    required this.isOnline,
    required this.onTap,
  });

  @override
  State<_ServerTile> createState() => _ServerTileState();
}

class _ServerTileState extends State<_ServerTile> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final isSelected = widget.isSelected;
    final isOnline = widget.isOnline;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        onFocusChange: (value) => setState(() => _isFocused = value),
        borderRadius: BorderRadius.circular(12),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: colorScheme.primary.withValues(alpha: 0.1),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isFocused
                  ? colorScheme.primary
                  : (isSelected ? colorScheme.primary.withValues(alpha: 0.5) : colorScheme.outlineVariant),
              width: _isFocused || isSelected ? 2 : 1,
            ),
            color: _isFocused
                ? colorScheme.primary.withValues(alpha: 0.12)
                : (isSelected ? colorScheme.primary.withValues(alpha: 0.08) : colorScheme.surfaceContainerLow),
          ),
          child: Row(
            children: [
              // Server icon
              Icon(
                Symbols.dns_rounded,
                size: 24,
                color: _isFocused || isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(width: 16),
              // Server name and status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.serverName,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: _isFocused || isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: _isFocused || isSelected ? colorScheme.primary : colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isOnline ? const Color(0xFF4CAF50) : colorScheme.onSurface.withValues(alpha: 0.3),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isOnline ? t.serverSelection.online : t.serverSelection.offline,
                          style: textTheme.bodySmall?.copyWith(
                            color: isOnline ? const Color(0xFF4CAF50) : colorScheme.onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Check icon only when selected
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 1.0 : 0.0,
                child: Icon(
                  Symbols.check_circle_rounded,
                  size: 28,
                  color: colorScheme.primary,
                  fill: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
