import 'package:domain_auth/use_case/get_seen_onboarding_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetSeenOnboardingUseCase getSeenOnboardingUseCase;
  SplashBloc(this.getSeenOnboardingUseCase) : super(const SplashState.idle()) {
    on<_InitEvent>(_initEvent);
  }

  Future<void> _initEvent(_InitEvent event, Emitter<SplashState> emit) async {}
}
