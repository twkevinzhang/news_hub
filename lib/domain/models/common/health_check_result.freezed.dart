// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_check_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HealthCheckResult {
  ServingStatus get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of HealthCheckResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthCheckResultCopyWith<HealthCheckResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthCheckResultCopyWith<$Res> {
  factory $HealthCheckResultCopyWith(
    HealthCheckResult value,
    $Res Function(HealthCheckResult) then,
  ) = _$HealthCheckResultCopyWithImpl<$Res, HealthCheckResult>;
  @useResult
  $Res call({ServingStatus status, String? message});
}

/// @nodoc
class _$HealthCheckResultCopyWithImpl<$Res, $Val extends HealthCheckResult>
    implements $HealthCheckResultCopyWith<$Res> {
  _$HealthCheckResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthCheckResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? message = freezed}) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ServingStatus,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HealthCheckResultImplCopyWith<$Res>
    implements $HealthCheckResultCopyWith<$Res> {
  factory _$$HealthCheckResultImplCopyWith(
    _$HealthCheckResultImpl value,
    $Res Function(_$HealthCheckResultImpl) then,
  ) = __$$HealthCheckResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ServingStatus status, String? message});
}

/// @nodoc
class __$$HealthCheckResultImplCopyWithImpl<$Res>
    extends _$HealthCheckResultCopyWithImpl<$Res, _$HealthCheckResultImpl>
    implements _$$HealthCheckResultImplCopyWith<$Res> {
  __$$HealthCheckResultImplCopyWithImpl(
    _$HealthCheckResultImpl _value,
    $Res Function(_$HealthCheckResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HealthCheckResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? message = freezed}) {
    return _then(
      _$HealthCheckResultImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ServingStatus,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$HealthCheckResultImpl implements _HealthCheckResult {
  const _$HealthCheckResultImpl({required this.status, this.message});

  @override
  final ServingStatus status;
  @override
  final String? message;

  @override
  String toString() {
    return 'HealthCheckResult(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthCheckResultImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of HealthCheckResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthCheckResultImplCopyWith<_$HealthCheckResultImpl> get copyWith =>
      __$$HealthCheckResultImplCopyWithImpl<_$HealthCheckResultImpl>(
        this,
        _$identity,
      );
}

abstract class _HealthCheckResult implements HealthCheckResult {
  const factory _HealthCheckResult({
    required final ServingStatus status,
    final String? message,
  }) = _$HealthCheckResultImpl;

  @override
  ServingStatus get status;
  @override
  String? get message;

  /// Create a copy of HealthCheckResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthCheckResultImplCopyWith<_$HealthCheckResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
