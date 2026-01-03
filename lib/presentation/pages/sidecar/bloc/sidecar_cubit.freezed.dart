// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sidecar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SidecarState {
  SidecarStatus get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of SidecarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidecarStateCopyWith<SidecarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidecarStateCopyWith<$Res> {
  factory $SidecarStateCopyWith(
          SidecarState value, $Res Function(SidecarState) then) =
      _$SidecarStateCopyWithImpl<$Res, SidecarState>;
  @useResult
  $Res call({SidecarStatus status, String? message});
}

/// @nodoc
class _$SidecarStateCopyWithImpl<$Res, $Val extends SidecarState>
    implements $SidecarStateCopyWith<$Res> {
  _$SidecarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidecarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SidecarStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SidecarStateImplCopyWith<$Res>
    implements $SidecarStateCopyWith<$Res> {
  factory _$$SidecarStateImplCopyWith(
          _$SidecarStateImpl value, $Res Function(_$SidecarStateImpl) then) =
      __$$SidecarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SidecarStatus status, String? message});
}

/// @nodoc
class __$$SidecarStateImplCopyWithImpl<$Res>
    extends _$SidecarStateCopyWithImpl<$Res, _$SidecarStateImpl>
    implements _$$SidecarStateImplCopyWith<$Res> {
  __$$SidecarStateImplCopyWithImpl(
      _$SidecarStateImpl _value, $Res Function(_$SidecarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SidecarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
  }) {
    return _then(_$SidecarStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SidecarStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SidecarStateImpl extends _SidecarState {
  const _$SidecarStateImpl({required this.status, this.message}) : super._();

  @override
  final SidecarStatus status;
  @override
  final String? message;

  @override
  String toString() {
    return 'SidecarState(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidecarStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  /// Create a copy of SidecarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidecarStateImplCopyWith<_$SidecarStateImpl> get copyWith =>
      __$$SidecarStateImplCopyWithImpl<_$SidecarStateImpl>(this, _$identity);
}

abstract class _SidecarState extends SidecarState {
  const factory _SidecarState(
      {required final SidecarStatus status,
      final String? message}) = _$SidecarStateImpl;
  const _SidecarState._() : super._();

  @override
  SidecarStatus get status;
  @override
  String? get message;

  /// Create a copy of SidecarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidecarStateImplCopyWith<_$SidecarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
