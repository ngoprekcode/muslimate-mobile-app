import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/uikit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Simulasi loading data 2 detik
    await Future.delayed(const Duration(seconds: 2));

    // TODO: nanti ganti dengan logic cek login atau onboarding
    bool isLoggedIn = false;

    if (mounted) {
      if (isLoggedIn) {
        context.go('/dashboard');
      } else {
        context.go('/onboarding');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.images.imgMuslimateLogo.image(
              width: size.width * 0.40,
              height: size.width * 0.40,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}