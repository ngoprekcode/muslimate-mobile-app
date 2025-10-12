part of 'qibla_bloc.dart';

@freezed
class QiblaState with _$QiblaState {
  const factory QiblaState.idle() = QiblaIdleState;

  const factory QiblaState.loading({
    String? message,
  }) = QiblaLoadingState;

  const factory QiblaState.permissionDenied() = QiblaPermissionDeniedState;

  const factory QiblaState.ready({
    required double latitude,
    required double longitude,
    String? placeName,
    required double qiblaAngle,
    double? currentHeading,
    double? headingAccuracy,
    required bool calibrationRequired,
  }) = QiblaReadyState;

  const factory QiblaState.error({
    required String message,
  }) = QiblaErrorState;
}