// lib/presentation/pages/maintenance_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MaintenancePage extends StatelessWidget {
  final String title;
  final String message;
  final String? statusUrl;
  final String? actionLabel;

  const MaintenancePage({
    Key? key,
    this.title = 'Under Maintenance',
    this.message =
    'Our service is temporarily down for maintenance. We are working to bring things back as soon as possible. Thank you for your patience.',
    this.statusUrl,
    this.actionLabel = 'Check Status',
  }) : super(key: key);

  Future<void> _openStatusUrl(BuildContext context) async {
    if (statusUrl == null) return;
    final uri = Uri.tryParse(statusUrl!);
    if (uri == null) return;

    try {
      // launchUrl returns Future<bool> indicating success on most versions
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unable to open status page')),
        );
      }
    } catch (e) {
      // fallback: show snack
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open status page')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // prevent back navigation
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

              // modern TextTheme properties (works with Material2 & Material3)
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
                      Text(title, style: titleStyle, textAlign: TextAlign.center),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: bodyStyle,
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (statusUrl != null)
                        ElevatedButton(
                          onPressed: () => _openStatusUrl(context),
                          child: Text(actionLabel ?? 'Check Status'),
                        ),
                      const SizedBox(height: 12),
                      Text(
                        'We appreciate your patience.',
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