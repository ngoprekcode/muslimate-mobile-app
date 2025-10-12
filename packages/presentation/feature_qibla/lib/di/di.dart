import 'package:feature_qibla/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureFeatureQiblaInjection() async => getIt.init();
