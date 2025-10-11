import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState.idle()) {
    on<_InitEvent>(_onInit);
    on<_ChangeLanguageEvent>(_onChangeLanguage);
    on<_LoadVersionEvent>(_onLoadVersion);
    on<_SendFeedbackEvent>(_onSendFeedback);
    on<_OpenContactEvent>(_onOpenContact);
  }

  Future<void> _onInit(_InitEvent event, Emitter<SettingsState> emit) async {
    emit(const SettingsState.loading());
    final localeCode = ui.PlatformDispatcher.instance.locale.languageCode;
    final version = await _fetchVersion();
    emit(SettingsState.loaded(locale: localeCode, version: version));
  }

  Future<void> _onChangeLanguage(_ChangeLanguageEvent event, Emitter<SettingsState> emit) async {
    // Update state to reflect new selection
    final currentVersion = (state is SettingsLoaded) ? (state as SettingsLoaded).version : await _fetchVersion();
    emit(SettingsState.loaded(locale: event.localeCode, version: currentVersion));
  }

  Future<void> _onLoadVersion(_LoadVersionEvent event, Emitter<SettingsState> emit) async {
    final version = await _fetchVersion();
    final localeCode = (state is SettingsLoaded) ? (state as SettingsLoaded).locale : ui.PlatformDispatcher.instance.locale.languageCode;
    emit(SettingsState.loaded(locale: localeCode, version: version));
  }

  Future<void> _onSendFeedback(_SendFeedbackEvent event, Emitter<SettingsState> emit) async {
    final Uri mailto = Uri(
      scheme: 'mailto',
      path: event.toEmail ?? 'developer@example.com',
      queryParameters: {
        'subject': event.subject ?? 'App Feedback',
        'body': event.body ?? ''
      },
    );
    try {
      await launchUrl(mailto);
    } catch (_) {
      // ignore: no-op
    }
  }

  Future<void> _onOpenContact(_OpenContactEvent event, Emitter<SettingsState> emit) async {
    final url = event.url;
    if (url == null) return;
    try {
      final uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // ignore
    }
  }

  Future<String> _fetchVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      return 'v${info.version}';
    } catch (_) {
      return 'v1.0.0';
    }
  }
}