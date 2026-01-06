// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepoState {
  Result<List<Repo>> get repos => throw _privateConstructorUsedError;

  /// Create a copy of RepoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepoStateCopyWith<RepoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoStateCopyWith<$Res> {
  factory $RepoStateCopyWith(RepoState value, $Res Function(RepoState) then) =
      _$RepoStateCopyWithImpl<$Res, RepoState>;
  @useResult
  $Res call({Result<List<Repo>> repos});

  $ResultCopyWith<List<Repo>, $Res> get repos;
}

/// @nodoc
class _$RepoStateCopyWithImpl<$Res, $Val extends RepoState>
    implements $RepoStateCopyWith<$Res> {
  _$RepoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepoState
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
              as Result<List<Repo>>,
    ) as $Val);
  }

  /// Create a copy of RepoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<Repo>, $Res> get repos {
    return $ResultCopyWith<List<Repo>, $Res>(_value.repos, (value) {
      return _then(_value.copyWith(repos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepoStateImplCopyWith<$Res>
    implements $RepoStateCopyWith<$Res> {
  factory _$$RepoStateImplCopyWith(
          _$RepoStateImpl value, $Res Function(_$RepoStateImpl) then) =
      __$$RepoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result<List<Repo>> repos});

  @override
  $ResultCopyWith<List<Repo>, $Res> get repos;
}

/// @nodoc
class __$$RepoStateImplCopyWithImpl<$Res>
    extends _$RepoStateCopyWithImpl<$Res, _$RepoStateImpl>
    implements _$$RepoStateImplCopyWith<$Res> {
  __$$RepoStateImplCopyWithImpl(
      _$RepoStateImpl _value, $Res Function(_$RepoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
  }) {
    return _then(_$RepoStateImpl(
      repos: null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Result<List<Repo>>,
    ));
  }
}

/// @nodoc

class _$RepoStateImpl implements _RepoState {
  const _$RepoStateImpl({required this.repos});

  @override
  final Result<List<Repo>> repos;

  @override
  String toString() {
    return 'RepoState(repos: $repos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepoStateImpl &&
            (identical(other.repos, repos) || other.repos == repos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos);

  /// Create a copy of RepoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepoStateImplCopyWith<_$RepoStateImpl> get copyWith =>
      __$$RepoStateImplCopyWithImpl<_$RepoStateImpl>(this, _$identity);
}

abstract class _RepoState implements RepoState {
  const factory _RepoState({required final Result<List<Repo>> repos}) =
      _$RepoStateImpl;

  @override
  Result<List<Repo>> get repos;

  /// Create a copy of RepoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepoStateImplCopyWith<_$RepoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
