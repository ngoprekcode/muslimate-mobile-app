// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoFailure value)?  noFailure,TResult Function( DeletedFailure value)?  deleted,TResult Function( UnexpectedError value)?  unexpectedError,TResult Function( TimeoutFailure value)?  timeout,TResult Function( NoConnectionFailure value)?  noConnection,TResult Function( ServerFailure value)?  serverFailure,TResult Function( RequestFailure value)?  requestFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoFailure() when noFailure != null:
return noFailure(_that);case DeletedFailure() when deleted != null:
return deleted(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case TimeoutFailure() when timeout != null:
return timeout(_that);case NoConnectionFailure() when noConnection != null:
return noConnection(_that);case ServerFailure() when serverFailure != null:
return serverFailure(_that);case RequestFailure() when requestFailure != null:
return requestFailure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoFailure value)  noFailure,required TResult Function( DeletedFailure value)  deleted,required TResult Function( UnexpectedError value)  unexpectedError,required TResult Function( TimeoutFailure value)  timeout,required TResult Function( NoConnectionFailure value)  noConnection,required TResult Function( ServerFailure value)  serverFailure,required TResult Function( RequestFailure value)  requestFailure,}){
final _that = this;
switch (_that) {
case NoFailure():
return noFailure(_that);case DeletedFailure():
return deleted(_that);case UnexpectedError():
return unexpectedError(_that);case TimeoutFailure():
return timeout(_that);case NoConnectionFailure():
return noConnection(_that);case ServerFailure():
return serverFailure(_that);case RequestFailure():
return requestFailure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoFailure value)?  noFailure,TResult? Function( DeletedFailure value)?  deleted,TResult? Function( UnexpectedError value)?  unexpectedError,TResult? Function( TimeoutFailure value)?  timeout,TResult? Function( NoConnectionFailure value)?  noConnection,TResult? Function( ServerFailure value)?  serverFailure,TResult? Function( RequestFailure value)?  requestFailure,}){
final _that = this;
switch (_that) {
case NoFailure() when noFailure != null:
return noFailure(_that);case DeletedFailure() when deleted != null:
return deleted(_that);case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case TimeoutFailure() when timeout != null:
return timeout(_that);case NoConnectionFailure() when noConnection != null:
return noConnection(_that);case ServerFailure() when serverFailure != null:
return serverFailure(_that);case RequestFailure() when requestFailure != null:
return requestFailure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noFailure,TResult Function()?  deleted,TResult Function( String message)?  unexpectedError,TResult Function()?  timeout,TResult Function()?  noConnection,TResult Function()?  serverFailure,TResult Function()?  requestFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoFailure() when noFailure != null:
return noFailure();case DeletedFailure() when deleted != null:
return deleted();case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that.message);case TimeoutFailure() when timeout != null:
return timeout();case NoConnectionFailure() when noConnection != null:
return noConnection();case ServerFailure() when serverFailure != null:
return serverFailure();case RequestFailure() when requestFailure != null:
return requestFailure();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noFailure,required TResult Function()  deleted,required TResult Function( String message)  unexpectedError,required TResult Function()  timeout,required TResult Function()  noConnection,required TResult Function()  serverFailure,required TResult Function()  requestFailure,}) {final _that = this;
switch (_that) {
case NoFailure():
return noFailure();case DeletedFailure():
return deleted();case UnexpectedError():
return unexpectedError(_that.message);case TimeoutFailure():
return timeout();case NoConnectionFailure():
return noConnection();case ServerFailure():
return serverFailure();case RequestFailure():
return requestFailure();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noFailure,TResult? Function()?  deleted,TResult? Function( String message)?  unexpectedError,TResult? Function()?  timeout,TResult? Function()?  noConnection,TResult? Function()?  serverFailure,TResult? Function()?  requestFailure,}) {final _that = this;
switch (_that) {
case NoFailure() when noFailure != null:
return noFailure();case DeletedFailure() when deleted != null:
return deleted();case UnexpectedError() when unexpectedError != null:
return unexpectedError(_that.message);case TimeoutFailure() when timeout != null:
return timeout();case NoConnectionFailure() when noConnection != null:
return noConnection();case ServerFailure() when serverFailure != null:
return serverFailure();case RequestFailure() when requestFailure != null:
return requestFailure();case _:
  return null;

}
}

}

/// @nodoc


class NoFailure extends Failure {
  const NoFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.noFailure()';
}


}




/// @nodoc


class DeletedFailure extends Failure {
  const DeletedFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeletedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.deleted()';
}


}




/// @nodoc


class UnexpectedError extends Failure {
  const UnexpectedError({this.message = 'An unexpected error occurred'}): super._();
  

@JsonKey() final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnexpectedErrorCopyWith<UnexpectedError> get copyWith => _$UnexpectedErrorCopyWithImpl<UnexpectedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unexpectedError(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnexpectedErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnexpectedErrorCopyWith(UnexpectedError value, $Res Function(UnexpectedError) _then) = _$UnexpectedErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnexpectedErrorCopyWithImpl<$Res>
    implements $UnexpectedErrorCopyWith<$Res> {
  _$UnexpectedErrorCopyWithImpl(this._self, this._then);

  final UnexpectedError _self;
  final $Res Function(UnexpectedError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnexpectedError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TimeoutFailure extends Failure {
  const TimeoutFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeoutFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.timeout()';
}


}




/// @nodoc


class NoConnectionFailure extends Failure {
  const NoConnectionFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoConnectionFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.noConnection()';
}


}




/// @nodoc


class ServerFailure extends Failure {
  const ServerFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.serverFailure()';
}


}




/// @nodoc


class RequestFailure extends Failure {
  const RequestFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.requestFailure()';
}


}




// dart format on
