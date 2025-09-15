import 'package:core/di/di.dart';
import 'package:data_auth/di/di.dart';
import 'package:domain_auth/di/di.dart';
import 'package:feature_auth/di/di.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:muslimate_mobile_app/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await configureUIKitInjection();

  /// Configure data_layer
  configureDataAuthInjection();

  /// Configure domain_layer
  configureDomainAuthInjection();

  /// Configure presentation_layer
  configureFeatureAuthInjection();
  getIt.init();
}
