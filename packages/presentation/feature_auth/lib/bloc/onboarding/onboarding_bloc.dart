import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_bloc.freezed.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState.idle()) {
    on<_InitEvent>(_initEvent);
  }

  Future<void> _initEvent(
    _InitEvent event,
    Emitter<OnboardingState> emit,
  ) async {}
}
