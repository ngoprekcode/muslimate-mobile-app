import 'package:domain_auth/di/di.dart';
import 'package:feature_auth/bloc/onboarding/onboarding_bloc.dart';
import 'package:feature_auth/bloc/splash/splash_bloc.dart';
import 'package:feature_auth/page/onboarding_page.dart';
import 'package:feature_auth/page/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../page/maintenance_page.dart';

final featureAuthRoutes = [
  GoRoute(
    path: '/',
    name: 'splash',
    builder: (context, state) => BlocProvider(
      create: (_) => getIt<SplashBloc>()..add(SplashEvent.init()),
      child: const SplashPage(),
    ),
  ),
  GoRoute(
    path: '/onboarding',
    name: 'onboarding',
    builder: (context, state) => BlocProvider(
      create: (_) => getIt<OnboardingBloc>(),
      child: const OnboardingPage(),
    ),
  ),
  GoRoute(
    path: '/maintenance',
    name: 'maintenance',
    builder: (context, state) => BlocProvider(
      create: (_) => getIt<SplashBloc>()..add(SplashEvent.init()),
      child: const MaintenancePage(),
    ),
  ),
];
