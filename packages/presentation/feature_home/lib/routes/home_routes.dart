import 'package:feature_home/bloc/home/home_bloc.dart';
import 'package:feature_home/di/di.dart';
import 'package:feature_home/page/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final featureHomeRoutes = [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) {
      return BlocProvider(
        create: (_) => getIt<HomeBloc>(),
        child: const HomePage(),
      );
    },
  ),
];
