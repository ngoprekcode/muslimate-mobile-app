import 'package:flutter/material.dart';
import 'package:muslimate_mobile_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:ui' as ui;

import 'package:uikit/uikit.dart';
import 'injector.dart';

// simpan globalContext di luar agar bisa diakses via extension
late BuildContext globalContext;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
      builder: (context, child) {
        globalContext = context; // simpan untuk akses di extension
        return child!;
      },
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

class MyHomePage extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const MyHomePage({super.key, required this.onLocaleChange});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late final String systemLanguage; // final, hanya diset sekali
  String? selectedLanguage;

  @override
  void initState() {
    super.initState();
    systemLanguage = ui.PlatformDispatcher.instance.locale.languageCode;
    selectedLanguage = systemLanguage;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeLanguage(String? newLang) {
    if (newLang == null || newLang == selectedLanguage) return;

    setState(() {
      selectedLanguage = newLang;
    });

    widget.onLocaleChange(Locale(newLang));

    if (newLang != systemLanguage) {
      _showLanguageAlert(newLang);
    }
  }

  void _showLanguageAlert(String lang) {
    final loc = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(loc.languageMismatchTitle),
        content: Text(
          loc.languageMismatchMessage(system: systemLanguage, selected: lang),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.homeTitle),
        actions: [
          DropdownButton<String>(
            value: selectedLanguage,
            underline: const SizedBox(),
            icon: const Icon(Icons.language, color: Colors.white),
            dropdownColor: Colors.white,
            items: const [
              DropdownMenuItem(value: 'id', child: Text("ID")),
              DropdownMenuItem(value: 'en', child: Text("EN")),
            ],
            onChanged: _changeLanguage,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(loc.counterText),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: loc.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}