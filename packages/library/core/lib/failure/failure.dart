import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  /// General Failures
  const factory Failure.noFailure() = NoFailure;
  const factory Failure.deleted() = DeletedFailure;
  const factory Failure.unexpectedError({
    @Default('An unexpected error occurred') String message,
  }) = UnexpectedError;

  /// Network Failures
  const factory Failure.timeout() = TimeoutFailure;
  const factory Failure.noConnection() = NoConnectionFailure;
  const factory Failure.serverFailure() = ServerFailure;

  /// Represents a failure caused by an HTTP error with a status code
  /// between 300 and 499, including redirection (3xx) and client errors (4xx).
  const factory Failure.requestFailure() = RequestFailure;
}
