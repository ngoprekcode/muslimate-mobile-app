import 'package:feature_qibla/bloc/qibla/qibla_bloc.dart';
import 'package:feature_qibla/di/di.dart';
import 'package:feature_qibla/page/qibla_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final featureQiblaRoutes = [
  GoRoute(
    path: '/qibla',
    name: 'qibla',
    builder: (context, state) {
      return BlocProvider(
        create: (_) => getIt<QiblaBloc>(),
        child: const QiblaPage(),
      );
    },
  ),
];
