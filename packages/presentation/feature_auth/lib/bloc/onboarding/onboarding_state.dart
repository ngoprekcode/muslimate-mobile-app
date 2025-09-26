part of 'onboarding_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.idle() = _Idle;
  const factory OnboardingState.pageChanged(int page) = _PageChanged;
  const factory OnboardingState.completed() = _Completed;
}