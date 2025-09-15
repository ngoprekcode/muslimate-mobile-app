import 'package:feature_auth/routes/auth_routes.dart';
import 'package:feature_home/routes/home_routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [...featureAuthRoutes, ...featureHomeRoutes],
);
