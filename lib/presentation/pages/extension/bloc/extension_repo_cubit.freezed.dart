// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_repo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExtensionRepoState {
  Result<List<ExtensionRepo>> get repos => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionRepoStateCopyWith<ExtensionRepoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionRepoStateCopyWith<$Res> {
  factory $ExtensionRepoStateCopyWith(
          ExtensionRepoState value, $Res Function(ExtensionRepoState) then) =
      _$ExtensionRepoStateCopyWithImpl<$Res, ExtensionRepoState>;
  @useResult
  $Res call({Result<List<ExtensionRepo>> repos});

  $ResultCopyWith<List<ExtensionRepo>, $Res> get repos;
}

/// @nodoc
class _$ExtensionRepoStateCopyWithImpl<$Res, $Val extends ExtensionRepoState>
    implements $ExtensionRepoStateCopyWith<$Res> {
  _$ExtensionRepoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionRepoState
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

  /// Create a copy of ExtensionRepoState
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
abstract class _$$ExtensionRepoStateImplCopyWith<$Res>
    implements $ExtensionRepoStateCopyWith<$Res> {
  factory _$$ExtensionRepoStateImplCopyWith(_$ExtensionRepoStateImpl value,
          $Res Function(_$ExtensionRepoStateImpl) then) =
      __$$ExtensionRepoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Result<List<ExtensionRepo>> repos});

  @override
  $ResultCopyWith<List<ExtensionRepo>, $Res> get repos;
}

/// @nodoc
class __$$ExtensionRepoStateImplCopyWithImpl<$Res>
    extends _$ExtensionRepoStateCopyWithImpl<$Res, _$ExtensionRepoStateImpl>
    implements _$$ExtensionRepoStateImplCopyWith<$Res> {
  __$$ExtensionRepoStateImplCopyWithImpl(_$ExtensionRepoStateImpl _value,
      $Res Function(_$ExtensionRepoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repos = null,
  }) {
    return _then(_$ExtensionRepoStateImpl(
      repos: null == repos
          ? _value.repos
          : repos // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionRepo>>,
    ));
  }
}

/// @nodoc

class _$ExtensionRepoStateImpl implements _ExtensionRepoState {
  const _$ExtensionRepoStateImpl({required this.repos});

  @override
  final Result<List<ExtensionRepo>> repos;

  @override
  String toString() {
    return 'ExtensionRepoState(repos: $repos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionRepoStateImpl &&
            (identical(other.repos, repos) || other.repos == repos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repos);

  /// Create a copy of ExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionRepoStateImplCopyWith<_$ExtensionRepoStateImpl> get copyWith =>
      __$$ExtensionRepoStateImplCopyWithImpl<_$ExtensionRepoStateImpl>(
          this, _$identity);
}

abstract class _ExtensionRepoState implements ExtensionRepoState {
  const factory _ExtensionRepoState(
          {required final Result<List<ExtensionRepo>> repos}) =
      _$ExtensionRepoStateImpl;

  @override
  Result<List<ExtensionRepo>> get repos;

  /// Create a copy of ExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionRepoStateImplCopyWith<_$ExtensionRepoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
