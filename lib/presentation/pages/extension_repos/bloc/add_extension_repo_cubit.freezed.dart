// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_extension_repo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddExtensionRepoState {
  String? get indexUrl => throw _privateConstructorUsedError;
  Result<ExtensionRepo> get remoteRepo => throw _privateConstructorUsedError;
  Result<void> get addResult => throw _privateConstructorUsedError;

  /// Create a copy of AddExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddExtensionRepoStateCopyWith<AddExtensionRepoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddExtensionRepoStateCopyWith<$Res> {
  factory $AddExtensionRepoStateCopyWith(AddExtensionRepoState value,
          $Res Function(AddExtensionRepoState) then) =
      _$AddExtensionRepoStateCopyWithImpl<$Res, AddExtensionRepoState>;
  @useResult
  $Res call(
      {String? indexUrl,
      Result<ExtensionRepo> remoteRepo,
      Result<void> addResult});

  $ResultCopyWith<ExtensionRepo, $Res> get remoteRepo;
  $ResultCopyWith<void, $Res> get addResult;
}

/// @nodoc
class _$AddExtensionRepoStateCopyWithImpl<$Res,
        $Val extends AddExtensionRepoState>
    implements $AddExtensionRepoStateCopyWith<$Res> {
  _$AddExtensionRepoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indexUrl = freezed,
    Object? remoteRepo = null,
    Object? addResult = null,
  }) {
    return _then(_value.copyWith(
      indexUrl: freezed == indexUrl
          ? _value.indexUrl
          : indexUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteRepo: null == remoteRepo
          ? _value.remoteRepo
          : remoteRepo // ignore: cast_nullable_to_non_nullable
              as Result<ExtensionRepo>,
      addResult: null == addResult
          ? _value.addResult
          : addResult // ignore: cast_nullable_to_non_nullable
              as Result<void>,
    ) as $Val);
  }

  /// Create a copy of AddExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<ExtensionRepo, $Res> get remoteRepo {
    return $ResultCopyWith<ExtensionRepo, $Res>(_value.remoteRepo, (value) {
      return _then(_value.copyWith(remoteRepo: value) as $Val);
    });
  }

  /// Create a copy of AddExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<void, $Res> get addResult {
    return $ResultCopyWith<void, $Res>(_value.addResult, (value) {
      return _then(_value.copyWith(addResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddExtensionRepoStateImplCopyWith<$Res>
    implements $AddExtensionRepoStateCopyWith<$Res> {
  factory _$$AddExtensionRepoStateImplCopyWith(
          _$AddExtensionRepoStateImpl value,
          $Res Function(_$AddExtensionRepoStateImpl) then) =
      __$$AddExtensionRepoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? indexUrl,
      Result<ExtensionRepo> remoteRepo,
      Result<void> addResult});

  @override
  $ResultCopyWith<ExtensionRepo, $Res> get remoteRepo;
  @override
  $ResultCopyWith<void, $Res> get addResult;
}

/// @nodoc
class __$$AddExtensionRepoStateImplCopyWithImpl<$Res>
    extends _$AddExtensionRepoStateCopyWithImpl<$Res,
        _$AddExtensionRepoStateImpl>
    implements _$$AddExtensionRepoStateImplCopyWith<$Res> {
  __$$AddExtensionRepoStateImplCopyWithImpl(_$AddExtensionRepoStateImpl _value,
      $Res Function(_$AddExtensionRepoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? indexUrl = freezed,
    Object? remoteRepo = null,
    Object? addResult = null,
  }) {
    return _then(_$AddExtensionRepoStateImpl(
      indexUrl: freezed == indexUrl
          ? _value.indexUrl
          : indexUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteRepo: null == remoteRepo
          ? _value.remoteRepo
          : remoteRepo // ignore: cast_nullable_to_non_nullable
              as Result<ExtensionRepo>,
      addResult: null == addResult
          ? _value.addResult
          : addResult // ignore: cast_nullable_to_non_nullable
              as Result<void>,
    ));
  }
}

/// @nodoc

class _$AddExtensionRepoStateImpl implements _AddExtensionRepoState {
  const _$AddExtensionRepoStateImpl(
      {this.indexUrl, required this.remoteRepo, required this.addResult});

  @override
  final String? indexUrl;
  @override
  final Result<ExtensionRepo> remoteRepo;
  @override
  final Result<void> addResult;

  @override
  String toString() {
    return 'AddExtensionRepoState(indexUrl: $indexUrl, remoteRepo: $remoteRepo, addResult: $addResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddExtensionRepoStateImpl &&
            (identical(other.indexUrl, indexUrl) ||
                other.indexUrl == indexUrl) &&
            (identical(other.remoteRepo, remoteRepo) ||
                other.remoteRepo == remoteRepo) &&
            (identical(other.addResult, addResult) ||
                other.addResult == addResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, indexUrl, remoteRepo, addResult);

  /// Create a copy of AddExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddExtensionRepoStateImplCopyWith<_$AddExtensionRepoStateImpl>
      get copyWith => __$$AddExtensionRepoStateImplCopyWithImpl<
          _$AddExtensionRepoStateImpl>(this, _$identity);
}

abstract class _AddExtensionRepoState implements AddExtensionRepoState {
  const factory _AddExtensionRepoState(
      {final String? indexUrl,
      required final Result<ExtensionRepo> remoteRepo,
      required final Result<void> addResult}) = _$AddExtensionRepoStateImpl;

  @override
  String? get indexUrl;
  @override
  Result<ExtensionRepo> get remoteRepo;
  @override
  Result<void> get addResult;

  /// Create a copy of AddExtensionRepoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddExtensionRepoStateImplCopyWith<_$AddExtensionRepoStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
