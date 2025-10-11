part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.idle() = SettingsIdleState;
  const factory SettingsState.loading() = SettingsLoadingState;
  const factory SettingsState.loaded({required String locale, required String version}) = SettingsLoaded;
  const factory SettingsState.done() = SettingsDoneState;
}