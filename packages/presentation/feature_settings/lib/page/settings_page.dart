import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/theme/theme_extension.dart';
import '../bloc/settings/settings_bloc.dart';
import 'package:uikit/l10n/l10n_context.dart';
import 'package:muslimate_mobile_app/main.dart' show myAppKey;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc()..add(const SettingsEvent.init()),
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  void _changeAppLocale(String localeCode) {
    // Use global key to call setLocale on MyApp state
    final state = myAppKey.currentState;
    if (state != null) {
      state.setLocale(Locale(localeCode));
    }
  }

  void _showLanguagePicker(BuildContext context, String currentLocale) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Bahasa Indonesia'),
                trailing: currentLocale == 'id' ? const Icon(Icons.check) : null,
                onTap: () {
                  context.read<SettingsBloc>().add(const SettingsEvent.changeLanguage('id'));
                  _changeAppLocale('id');
                  Navigator.of(ctx).pop();
                },
              ),
              ListTile(
                title: const Text('English'),
                trailing: currentLocale == 'en' ? const Icon(Icons.check) : null,
                onTap: () {
                  context.read<SettingsBloc>().add(const SettingsEvent.changeLanguage('en'));
                  _changeAppLocale('en');
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.languageMismatchTitle.replaceAll('Language Mismatch', 'Settings')),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          String currentLocale = ui.PlatformDispatcher.instance.locale.languageCode;
          String version = 'v1.0.0';
          if (state is SettingsLoaded) {
            currentLocale = state.locale;
            version = state.version;
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Language
                Text(
                  'Language',
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    onTap: () => _showLanguagePicker(context, currentLocale),
                    title: Text(currentLocale == 'id' ? 'Bahasa Indonesia' : 'English'),
                    subtitle: Text('Change app language'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ),
                const SizedBox(height: 24),

                // App Info
                Text('App Information', style: context.textTheme.titleMedium),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    title: const Text('Version'),
                    subtitle: Text(version),
                    leading: const Icon(Icons.info_outline),
                  ),
                ),
                const SizedBox(height: 24),

                // Feedback
                Text('Feedback & Support', style: context.textTheme.titleMedium),
                const SizedBox(height: 8),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.feedback_outlined),
                        title: const Text('Send Feedback'),
                        subtitle: const Text('Report bugs or send suggestions'),
                        onTap: () => context.read<SettingsBloc>().add(const SettingsEvent.sendFeedback()),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.mail_outline),
                        title: const Text('Contact Developer'),
                        subtitle: const Text('Email / Twitter / Website'),
                        onTap: () => context.read<SettingsBloc>().add(const SettingsEvent.openContact('mailto:developer@example.com')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Footer: small text
                Center(
                  child: Text(
                    'Thank you for using our app',
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}