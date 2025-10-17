import 'dart:convert';
import 'package:feature_auth/bloc/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/uikit.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (BuildContext context, SplashState state) async {
          if (state is SplashMaintenanceState) {
            context.goNamed('maintenance');
            return;
          }

          if (state is SplashDoneState) {
            // check update first
            final handled = await checkForAppUpdateAndShowIfNeeded(context);
            if (handled == UpdateHandled.hard) return;

            if (state.hasSeenOnboarding) {
              context.goNamed('home');
            } else {
              context.goNamed('onboarding');
            }
          }
        },
        child: Center(
          child: AppAssets.images.imgMuslimateLogo.image(
            width: size.width * 0.40,
            height: size.width * 0.40,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Future<UpdateHandled> checkForAppUpdateAndShowIfNeeded(BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;
    try {
      final remoteConfig = GetIt.instance<FirebaseRemoteConfig>();
      final raw = remoteConfig.getString('app_update_config');
      if (raw.trim().isEmpty) {
        if (kDebugMode) debugPrint('app_update_config empty');
        return UpdateHandled.none;
      }

      final Map<String, dynamic> data = json.decode(raw) as Map<String, dynamic>;
      final minimum = data['minimum'] as Map<String, dynamic>? ?? {};
      final latest = data['latest'] as Map<String, dynamic>? ?? {};
      final playStoreUrl = (data['play_store_url'] as String?) ?? '';
      final appStoreUrl = (data['app_store_url'] as String?) ?? '';

      final minVersion = (minimum['version'] as String?) ?? '0.0.0';
      final minBuild = (minimum['build_number'] as String?) ?? '0';
      final latestVersion = (latest['version'] as String?) ?? minVersion;
      final latestBuild = (latest['build_number'] as String?) ?? minBuild;

      final packageInfo = await PackageInfo.fromPlatform();
      final installedVersion = packageInfo.version;
      final installedBuild = packageInfo.buildNumber;

      final cmpToMin = _compareVersionOrBuild(installedVersion, installedBuild, minVersion, minBuild);
      if (cmpToMin < 0) {
        // HARD update -> show blocking dialog (non-dismissible)
        await showHardUpdateDialog(
          context: context,
          title: localizations.updateHardTitle,
          message: localizations.updateHardMessage,
          updateNowLabel: localizations.updateNow,
          playStoreUrl: playStoreUrl,
          appStoreUrl: appStoreUrl,
        );
        return UpdateHandled.hard;
      }

      final cmpToLatest = _compareVersionOrBuild(installedVersion, installedBuild, latestVersion, latestBuild);
      if (cmpToLatest < 0) {
        // SOFT update -> show optional dialog
        await showSoftUpdateDialog(
          context: context,
          title: localizations.updateSoftTitle,
          message: localizations.updateSoftMessage,
          updateNowLabel: localizations.updateNow,
          laterLabel: localizations.later,
          playStoreUrl: playStoreUrl,
          appStoreUrl: appStoreUrl,
        );
        return UpdateHandled.soft;
      }

      return UpdateHandled.none;
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('checkForAppUpdateAndShowIfNeeded failed: $e\n$st');
      }
      return UpdateHandled.none;
    }
  }

  int _compareVersionOrBuild(String installedVersion, String installedBuild, String targetVersion, String targetBuild) {
    final ivParts = installedVersion.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final tvParts = targetVersion.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    for (var i = 0; i < 3; i++) {
      final a = i < ivParts.length ? ivParts[i] : 0;
      final b = i < tvParts.length ? tvParts[i] : 0;
      if (a != b) return a - b;
    }
    final ib = int.tryParse(installedBuild) ?? 0;
    final tb = int.tryParse(targetBuild) ?? 0;
    return ib - tb;
  }
}

/// --- NEW HARD UPDATE DIALOG (replaces HardUpdateScreen) ---
Future<void> showHardUpdateDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String updateNowLabel,
  required String playStoreUrl,
  required String appStoreUrl,
}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false, // cannot dismiss
    builder: (ctx) {
      return WillPopScope(
        onWillPop: () async => false, // block back button
        child: AlertDialog(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () async {
                final url = Theme.of(context).platform == TargetPlatform.iOS
                    ? appStoreUrl
                    : playStoreUrl;
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                }
              },
              child: Text(updateNowLabel),
            ),
          ],
        ),
      );
    },
  );
}

/// --- EXISTING SOFT UPDATE DIALOG (unchanged) ---
Future<void> showSoftUpdateDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String updateNowLabel,
  required String laterLabel,
  required String playStoreUrl,
  required String appStoreUrl,
}) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (ctx) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(laterLabel),
          ),
          ElevatedButton(
            onPressed: () async {
              final url = Theme.of(context).platform == TargetPlatform.iOS
                  ? appStoreUrl
                  : playStoreUrl;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
              }
            },
            child: Text(updateNowLabel),
          ),
        ],
      );
    },
  );
}

enum UpdateHandled { none, soft, hard }