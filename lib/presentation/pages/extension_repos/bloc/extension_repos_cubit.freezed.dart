// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_repos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExtensionReposState {
  Result<List<ExtensionRepo>> get repos => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionReposState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionReposStateCopyWith<ExtensionReposState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionReposStateCopyWith<$Res> {
  factory $ExtensionReposStateCopyWith(
          ExtensionReposState value, $Res Function(ExtensionReposState) then) =
      _$ExtensionReposStateCopyWithImpl<$Res, ExtensionReposState>;
  @useResult
  $Res call({Result<List<ExtensionRepo>> repos});

  $ResultCopyWith<List<ExtensionRepo>, $Res> get repos;
}

/// @nodoc
class _$ExtensionReposStateCopyWithImpl<$Res, $Val extends ExtensionReposState>
    implements $ExtensionReposStateCopyWith<$Res> {
  _$ExtensionReposStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionReposState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
  }) {
    return _then(_value.copyWith(
      repos: null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionRepo>>,
    ) as $Val);
  }

  /// Create a copy of ExtensionReposState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<ExtensionRepo>, $Res> get repos {
    return $ResultCopyWith<List<ExtensionRepo>, $Res>(_value.repos, (value) {
      return _then(_value.copyWith(repos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtensionReposStateImplCopyWith<$Res>
    implements $ExtensionReposStateCopyWith<$Res> {
  factory _$$ExtensionReposStateImplCopyWith(_$ExtensionReposStateImpl value,
          $Res Function(_$ExtensionReposStateImpl) then) =
      __$$ExtensionReposStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result<List<ExtensionRepo>> repos});

  @override
  $ResultCopyWith<List<ExtensionRepo>, $Res> get repos;
}

/// @nodoc
class __$$ExtensionReposStateImplCopyWithImpl<$Res>
    extends _$ExtensionReposStateCopyWithImpl<$Res, _$ExtensionReposStateImpl>
    implements _$$ExtensionReposStateImplCopyWith<$Res> {
  __$$ExtensionReposStateImplCopyWithImpl(_$ExtensionReposStateImpl _value,
      $Res Function(_$ExtensionReposStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtensionReposState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
  }) {
    return _then(_$ExtensionReposStateImpl(
      repos: null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionRepo>>,
    ));
  }
}

/// @nodoc

class _$ExtensionReposStateImpl implements _ExtensionReposState {
  const _$ExtensionReposStateImpl({required this.repos});

  @override
  final Result<List<ExtensionRepo>> repos;

  @override
  String toString() {
    return 'ExtensionReposState(repos: $repos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionReposStateImpl &&
            (identical(other.repos, repos) || other.repos == repos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos);

  /// Create a copy of ExtensionReposState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionReposStateImplCopyWith<_$ExtensionReposStateImpl> get copyWith =>
      __$$ExtensionReposStateImplCopyWithImpl<_$ExtensionReposStateImpl>(
          this, _$identity);
}

abstract class _ExtensionReposState implements ExtensionReposState {
  const factory _ExtensionReposState(
          {required final Result<List<ExtensionRepo>> repos}) =
      _$ExtensionReposStateImpl;

  @override
  Result<List<ExtensionRepo>> get repos;

  /// Create a copy of ExtensionReposState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionReposStateImplCopyWith<_$ExtensionReposStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
