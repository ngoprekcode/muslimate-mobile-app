part of 'onboarding_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.idle() = OnboardingIdleState;
  const factory OnboardingState.done() = OnboardingDoneState;
}
