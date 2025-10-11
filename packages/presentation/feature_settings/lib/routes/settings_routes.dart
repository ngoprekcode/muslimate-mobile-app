import 'package:feature_home/bloc/home/home_bloc.dart';
import 'package:feature_home/di/di.dart';
import 'package:feature_home/page/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/settings/settings_bloc.dart';
import '../page/settings_page.dart';

final featureSettingsRoutes = [
  GoRoute(
    path: '/settings',
    name: 'settings',
    builder: (context, state) {
      return BlocProvider(
        create: (_) => getIt<SettingsBloc>(),
        child: const SettingsPage(),
      );
    },
  ),
];
