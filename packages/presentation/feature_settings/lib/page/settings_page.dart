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
    final state = myAppKey.currentState;
    if (state != null) {
      state.setLocale(Locale(localeCode));
    }
  }

  void _showLanguagePicker(BuildContext context, String currentLocale) {
    final l = context.l10n;
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(l.languageIndonesian),
                trailing: currentLocale == 'id' ? const Icon(Icons.check) : null,
                onTap: () {
                  context.read<SettingsBloc>().add(const SettingsEvent.changeLanguage('id'));
                  _changeAppLocale('id');
                  Navigator.of(ctx).pop();
                },
              ),
              ListTile(
                title: Text(l.languageEnglish),
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
    final l = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.settingsTitle),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          String currentLocale = ui.PlatformDispatcher.instance.locale.languageCode;
          String version = l.settingsVersionDefault; // fallback text if state not loaded
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
                Text(l.settingsLanguage, style: context.textTheme.titleMedium),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    onTap: () => _showLanguagePicker(context, currentLocale),
                    title: Text(currentLocale == 'id' ? l.languageIndonesian : l.languageEnglish),
                    subtitle: Text(l.settingsChangeLanguageSubtitle),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ),
                const SizedBox(height: 24),

                // App Info
                Text(l.settingsAppInformation, style: context.textTheme.titleMedium),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    title: Text(l.settingsVersionLabel),
                    subtitle: Text(version),
                    leading: const Icon(Icons.info_outline),
                  ),
                ),
                const SizedBox(height: 24),

                // Feedback
                Text(l.settingsFeedbackSupport, style: context.textTheme.titleMedium),
                const SizedBox(height: 8),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.feedback_outlined),
                        title: Text(l.settingsSendFeedbackTitle),
                        subtitle: Text(l.settingsSendFeedbackSubtitle),
                        onTap: () => context.read<SettingsBloc>().add(const SettingsEvent.sendFeedback()),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        leading: const Icon(Icons.mail_outline),
                        title: Text(l.settingsContactDeveloperTitle),
                        subtitle: Text(l.settingsContactDeveloperSubtitle),
                        onTap: () => context.read<SettingsBloc>().add(const SettingsEvent.openContact('mailto:developer@example.com')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Footer: small text
                Center(
                  child: Text(
                    l.settingsFooterThanks,
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