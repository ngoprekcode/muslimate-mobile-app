import 'package:flutter/material.dart';
import 'package:uikit/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class MaintenancePage extends StatelessWidget {
  final String? statusUrl;

  const MaintenancePage({
    Key? key,
    this.statusUrl,
  }) : super(key: key);

  Future<void> _openStatusUrl(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    if (statusUrl == null) return;
    final uri = Uri.tryParse(statusUrl!);
    if (uri == null) return;

    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.featureMaintenanceUnableToOpen)),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.featureMaintenanceUnableToOpen)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final isWide = width > 600;
              final maxContentWidth = isWide ? 700.0 : width - 48.0;
              final iconSize = isWide ? 140.0 : 84.0;

              final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ) ??
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);

              final bodyStyle = Theme.of(context).textTheme.bodyMedium ??
                  const TextStyle(fontSize: 14);

              final captionStyle = Theme.of(context).textTheme.bodySmall ??
                  const TextStyle(fontSize: 12, color: Colors.grey);

              return Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxContentWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.build_circle_outlined,
                        size: iconSize,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        l10n.featureMaintenanceTitle,
                        style: titleStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          l10n.featureMaintenanceMessage,
                          textAlign: TextAlign.center,
                          style: bodyStyle,
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (statusUrl != null)
                        ElevatedButton(
                          onPressed: () => _openStatusUrl(context),
                          child: Text(l10n.featureMaintenanceAction),
                        ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.featureMaintenanceAppreciation,
                        style: captionStyle,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}