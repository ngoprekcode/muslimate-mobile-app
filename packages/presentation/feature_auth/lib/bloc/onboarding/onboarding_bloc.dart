import 'package:domain_auth/use_case/set_seen_onboarding_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_bloc.freezed.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final SetSeenOnboardingUseCase setSeenOnboardingUseCase;

  OnboardingBloc(this.setSeenOnboardingUseCase)
      : super(const OnboardingState.idle()) {
    on<_InitEvent>(_initEvent);
    on<_SkipEvent>(_skipEvent);
    on<_NextEvent>(_nextEvent);
  }

  Future<void> _initEvent(
      _InitEvent event,
      Emitter<OnboardingState> emit,
      ) async {
    emit(const OnboardingState.pageChanged(0));
  }

  Future<void> _skipEvent(
      _SkipEvent event,
      Emitter<OnboardingState> emit,
      ) async {
    await setSeenOnboardingUseCase();
    emit(const OnboardingState.completed());
  }

  Future<void> _nextEvent(
      _NextEvent event,
      Emitter<OnboardingState> emit,
      ) async {
    if (event.isLastPage) {
      await setSeenOnboardingUseCase();
      emit(const OnboardingState.completed());
    } else {
      emit(OnboardingState.pageChanged(event.nextPage));
    }
  }
}