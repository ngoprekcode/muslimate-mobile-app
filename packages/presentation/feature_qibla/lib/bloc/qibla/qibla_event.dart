part of 'qibla_bloc.dart';

@freezed
class QiblaEvent with _$QiblaEvent {
  const factory QiblaEvent.init() = _InitEvent;
  const factory QiblaEvent.requestLocation() = _RequestLocationEvent;
  const factory QiblaEvent.locationUpdated({
    required double latitude,
    required double longitude,
    String? placeName,
  }) = _LocationUpdatedEvent;
  const factory QiblaEvent.compassHeadingUpdated({
    required double heading,
    double? headingAccuracy, // in degrees if available
  }) = _CompassHeadingUpdatedEvent;
  const factory QiblaEvent.calibrationConfirmed() = _CalibrationConfirmedEvent;
  const factory QiblaEvent.retry() = _RetryEvent;
}