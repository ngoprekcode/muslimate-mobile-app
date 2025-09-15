import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: AppAssets.images.imgMuslimateLogo.image()),
    );
  }
}
