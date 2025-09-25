part of 'onboarding_bloc.dart';

@freezed
class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.init() = _InitEvent;
  const factory OnboardingEvent.skip() = _SkipEvent;
  const factory OnboardingEvent.next({
    required int nextPage,
    required bool isLastPage,
  }) = _NextEvent;
}