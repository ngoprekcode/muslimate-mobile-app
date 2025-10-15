import 'package:feature_auth/bloc/splash/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uikit/uikit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (BuildContext context, SplashState state) {
          if (state is SplashMaintenanceState) {
            context.replaceNamed('maintenance');
            return;
          }
          if (state is SplashDoneState) {
            if (state.hasSeenOnboarding) {
              context.replaceNamed('home');
            } else {
              context.replaceNamed('onboarding');
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
}