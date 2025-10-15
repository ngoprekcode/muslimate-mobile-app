import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:ui' as ui;

import 'package:uikit/uikit.dart';
import 'injector.dart';

final GlobalKey<_MyAppState> myAppKey = GlobalKey<_MyAppState>();

Future<void> main() async {
  runZonedGuarded<Future<void>>(
        () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FirebaseAnalytics.instance;

      final remoteConfig = FirebaseRemoteConfig.instance;

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: kDebugMode ? Duration.zero : const Duration(hours: 1),
      ));

      try {
        await remoteConfig.ensureInitialized();
      } catch (e) {
        if (kDebugMode) debugPrint('RemoteConfig ensureInitialized failed: $e');
      }

      if (kDebugMode) {
        try {
          final activated = await remoteConfig.fetchAndActivate();
          debugPrint('RemoteConfig fetchAndActivate (debug): $activated');
          debugPrint('RemoteConfig lastFetchStatus: ${remoteConfig.lastFetchStatus}');
          debugPrint('RemoteConfig lastFetchTime: ${remoteConfig.lastFetchTime}');
          debugPrint('RemoteConfig is_maintenance_mode_active: ${remoteConfig.getBool('is_maintenance_mode_active')}');
        } catch (e) {
          debugPrint('RemoteConfig fetchAndActivate (debug) error: $e');
        }
      } else {
        unawaited(remoteConfig.fetchAndActivate().catchError((_) {}));
      }

      final getIt = GetIt.instance;
      if (!getIt.isRegistered<FirebaseRemoteConfig>()) {
        getIt.registerSingleton<FirebaseRemoteConfig>(remoteConfig);
      }

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      await configureDependencies();

      runApp(MyApp(key: myAppKey));
    },
        (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Muslimate',
      locale: _locale,
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: typographyTheme,
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
      ),
      supportedLocales: const [Locale('id'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}