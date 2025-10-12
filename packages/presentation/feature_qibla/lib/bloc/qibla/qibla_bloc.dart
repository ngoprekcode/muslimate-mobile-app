import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:core/location/location_service.dart';
import 'package:core/qibla/qibla_calculator.dart';


part 'qibla_bloc.freezed.dart';
part 'qibla_event.dart';
part 'qibla_state.dart';

@injectable
class QiblaBloc extends Bloc<QiblaEvent, QiblaState> {
  final LocationService _locationService;
  StreamSubscription<Position?>? _positionSubscription;
  StreamSubscription<CompassEvent>? _compassSubscription;

  QiblaBloc(this._locationService) : super(const QiblaState.idle()) {
    on<_InitEvent>(_onInit);
    on<_RequestLocationEvent>(_onRequestLocation);
    on<_LocationUpdatedEvent>(_onLocationUpdated);
    on<_CompassHeadingUpdatedEvent>(_onCompassUpdated);
    on<_CalibrationConfirmedEvent>(_onCalibrationConfirmed);
    on<_RetryEvent>(_onRetry);
  }

  Future<void> _onInit(_InitEvent event, Emitter<QiblaState> emit) async {
    // Start by requesting location
    add(const QiblaEvent.requestLocation());
  }

  Future<void> _onRequestLocation(
      _RequestLocationEvent event,
      Emitter<QiblaState> emit,
      ) async {
    emit(const QiblaState.loading(message: 'Requesting permission...'));
    final ok = await _locationService.requestPermissionIfNeeded();
    if (!ok) {
      emit(const QiblaState.permissionDenied());
      return;
    }
    emit(const QiblaState.loading(message: 'Getting location...'));
    try {
      final pos = await _locationService.getCurrentPosition();
      final place = await _locationService.reverseGeocodeCity(pos.latitude, pos.longitude);
      // calculate qibla angle
      final qibla = calculateQibla(pos.latitude, pos.longitude);
      // listen to compass
      _startCompassListening();
      emit(QiblaState.ready(
        latitude: pos.latitude,
        longitude: pos.longitude,
        placeName: place,
        qiblaAngle: qibla,
        currentHeading: null,
        headingAccuracy: null,
        calibrationRequired: true, // initial calibration suggested
      ));
    } catch (e) {
      emit(QiblaState.error(message: e.toString()));
    }
  }

  Future<void> _onLocationUpdated(
      _LocationUpdatedEvent event,
      Emitter<QiblaState> emit,
      ) async {
    final qibla = calculateQibla(event.latitude, event.longitude);
    final s = state;
    if (s is QiblaReadyState) {
      emit(s.copyWith(
        latitude: event.latitude,
        longitude: event.longitude,
        placeName: event.placeName,
        qiblaAngle: qibla,
      ));
    } else {
      emit(QiblaState.ready(
        latitude: event.latitude,
        longitude: event.longitude,
        placeName: event.placeName,
        qiblaAngle: qibla,
        currentHeading: null,
        headingAccuracy: null,
        calibrationRequired: true,
      ));
    }
  }

  Future<void> _onCompassUpdated(
      _CompassHeadingUpdatedEvent event,
      Emitter<QiblaState> emit,
      ) async {
    final s = state;
    final heading = event.heading;
    final acc = event.headingAccuracy;

    // determine if calibration is needed: if accuracy null or large (e.g., >15 deg)
    final needCalibration = (acc == null) ? true : (acc > 15.0);

    if (s is QiblaReadyState) {
      emit(s.copyWith(
        currentHeading: heading,
        headingAccuracy: acc,
        calibrationRequired: needCalibration,
      ));
    } else {
      // If not ready but we have heading, keep it until location arrives
      // no-op
    }
  }

  Future<void> _onCalibrationConfirmed(
      _CalibrationConfirmedEvent event,
      Emitter<QiblaState> emit,
      ) async {
    final s = state;
    if (s is QiblaReadyState) {
      emit(s.copyWith(calibrationRequired: false));
    }
  }

  Future<void> _onRetry(
      _RetryEvent event,
      Emitter<QiblaState> emit,
      ) async {
    add(const QiblaEvent.requestLocation());
  }

  void _startCompassListening() {
    _compassSubscription?.cancel();
    // flutter_compass emits heading as double in degrees
    _compassSubscription = FlutterCompass.events?.listen((CompassEvent ev) {
      // heading may be null when sensor unavailable
      final heading = ev.heading;
      final acc = ev.accuracy; // may be null or in degrees (some platforms)
      if (heading != null) {
        add(QiblaEvent.compassHeadingUpdated(
          heading: heading,
          headingAccuracy: acc,
        ));
      }
    });
  }

  @override
  Future<void> close() {
    _compassSubscription?.cancel();
    _positionSubscription?.cancel();
    return super.close();
  }
}