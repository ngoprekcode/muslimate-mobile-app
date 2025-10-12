part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.init() = _InitEvent;
  const factory SettingsEvent.changeLanguage(String localeCode) = _ChangeLanguageEvent;
  const factory SettingsEvent.loadVersion() = _LoadVersionEvent;
  const factory SettingsEvent.sendFeedback({String? toEmail, String? subject, String? body}) = _SendFeedbackEvent;
  const factory SettingsEvent.openContact(String url) = _OpenContactEvent;
}