part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.idle() = SplashIdleState;
  const factory SplashState.loading() = SplashLoadingState;
  const factory SplashState.done({required bool hasSeenOnboarding}) =
      SplashDoneState;
}
