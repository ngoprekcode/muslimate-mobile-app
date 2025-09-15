import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// TODO [Ilham] - Adjust UI size & another UI needs.
      /// Binding this Page with BLOC & connect with UseCase in domain_auth
      body: Center(child: AppAssets.images.imgMuslimateLogo.image()),
    );
  }
}
