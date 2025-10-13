import 'package:domain_auth/use_case/get_seen_onboarding_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:domain_auth/use_case/get_maintenance_mode_use_case.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetSeenOnboardingUseCase getSeenOnboardingUseCase;
  final GetMaintenanceModeUseCase getMaintenanceModeUseCase; // ADDED

  SplashBloc(
      this.getSeenOnboardingUseCase,
      this.getMaintenanceModeUseCase,
      ) : super(const SplashState.idle()) {
    on<_InitEvent>(_initEvent);
  }

  Future<void> _initEvent(_InitEvent event, Emitter<SplashState> emit) async {
    emit(const SplashState.loading()); // optional: indicate loading

    await Future.delayed(const Duration(seconds: 2));
    // Check maintenance first
    try {
      final isMaintenance = await getMaintenanceModeUseCase.call();
      if (isMaintenance) {
        emit(const SplashState.maintenanceActive());
        return; // stop further navigation
      }
    } catch (e) {
      // ignore: avoid_print
      print('Maintenance check failed: $e');
      // continue to normal flow
    }

    final isSeen = await getSeenOnboardingUseCase.call();
    emit(SplashState.done(hasSeenOnboarding: isSeen));
  }
}