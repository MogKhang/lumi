import 'package:flutter/material.dart';
import 'package:lumi/widgets/app_icon.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../widgets/focused_scroll_scaffold.dart';
import '../../i18n/strings.g.dart';
import 'licenses_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static final Future<PackageInfo> _packageInfoFuture = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    final appName = t.app.title;

    return FutureBuilder<PackageInfo>(
      future: _packageInfoFuture,
      builder: (context, snapshot) {
        final appVersion = snapshot.data?.version ?? '';
        return FocusedScrollScaffold(
          title: Text(t.about.title),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // App Icon and Name
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Image.asset('assets/lumi-text.png', width: 80, height: 80),
                        const SizedBox(height: 16),
                        Text(
                          appName,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t.about.versionLabel(version: appVersion),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          t.about.appDescription,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Disclaimer — independence from Plex/Jellyfin + no hosted
                  // content. Expanded by default so reviewers see it up front.
                  _LegalSection(
                    icon: Symbols.gpp_maybe_rounded,
                    title: t.about.disclaimerTitle,
                    body: t.about.disclaimerBody(appName: appName),
                    initiallyExpanded: true,
                  ),

                  const SizedBox(height: 12),

                  _LegalSection(
                    icon: Symbols.gavel_rounded,
                    title: t.about.termsTitle,
                    body: t.about.termsBody(appName: appName),
                  ),

                  const SizedBox(height: 12),

                  _LegalSection(
                    icon: Symbols.privacy_tip_rounded,
                    title: t.about.privacyTitle,
                    body: t.about.privacyBody(appName: appName),
                  ),

                  const SizedBox(height: 12),

                  // Open Source Licenses
                  Card(
                    child: ListTile(
                      leading: const AppIcon(Symbols.description_rounded, fill: 1),
                      title: Text(t.about.openSourceLicenses),
                      subtitle: Text(t.about.viewLicensesDescription),
                      trailing: const AppIcon(Symbols.chevron_right_rounded, fill: 1),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LicensesScreen()));
                      },
                    ),
                  ),

                  const SizedBox(height: 24),
                ]),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Collapsible card holding a block of legal text (disclaimer, terms, privacy).
class _LegalSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  final bool initiallyExpanded;

  const _LegalSection({
    required this.icon,
    required this.title,
    required this.body,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        leading: AppIcon(icon, fill: 1),
        title: Text(title, style: theme.textTheme.titleMedium),
        initiallyExpanded: initiallyExpanded,
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            body,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.5, color: theme.colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
