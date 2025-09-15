part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.idle() = HomeIdleState;
  const factory HomeState.done() = HomeDoneState;
}
