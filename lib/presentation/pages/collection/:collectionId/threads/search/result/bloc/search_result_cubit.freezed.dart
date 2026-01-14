// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchResultState {
  String get collectionId => throw _privateConstructorUsedError;
  ThreadsFilter get filter => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of SearchResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResultStateCopyWith<SearchResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultStateCopyWith<$Res> {
  factory $SearchResultStateCopyWith(
    SearchResultState value,
    $Res Function(SearchResultState) then,
  ) = _$SearchResultStateCopyWithImpl<$Res, SearchResultState>;
  @useResult
  $Res call({
    String collectionId,
    ThreadsFilter filter,
    bool isLoading,
    String? error,
  });

  $ThreadsFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$SearchResultStateCopyWithImpl<$Res, $Val extends SearchResultState>
    implements $SearchResultStateCopyWith<$Res> {
  _$SearchResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
    Object? filter = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            collectionId: null == collectionId
                ? _value.collectionId
                : collectionId // ignore: cast_nullable_to_non_nullable
                      as String,
            filter: null == filter
                ? _value.filter
                : filter // ignore: cast_nullable_to_non_nullable
                      as ThreadsFilter,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of SearchResultState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsFilterCopyWith<$Res> get filter {
    return $ThreadsFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResultStateImplCopyWith<$Res>
    implements $SearchResultStateCopyWith<$Res> {
  factory _$$SearchResultStateImplCopyWith(
    _$SearchResultStateImpl value,
    $Res Function(_$SearchResultStateImpl) then,
  ) = __$$SearchResultStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String collectionId,
    ThreadsFilter filter,
    bool isLoading,
    String? error,
  });

  @override
  $ThreadsFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$SearchResultStateImplCopyWithImpl<$Res>
    extends _$SearchResultStateCopyWithImpl<$Res, _$SearchResultStateImpl>
    implements _$$SearchResultStateImplCopyWith<$Res> {
  __$$SearchResultStateImplCopyWithImpl(
    _$SearchResultStateImpl _value,
    $Res Function(_$SearchResultStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collectionId = null,
    Object? filter = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$SearchResultStateImpl(
        collectionId: null == collectionId
            ? _value.collectionId
            : collectionId // ignore: cast_nullable_to_non_nullable
                  as String,
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as ThreadsFilter,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SearchResultStateImpl implements _SearchResultState {
  const _$SearchResultStateImpl({
    required this.collectionId,
    required this.filter,
    this.isLoading = false,
    this.error,
  });

  @override
  final String collectionId;
  @override
  final ThreadsFilter filter;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'SearchResultState(collectionId: $collectionId, filter: $filter, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultStateImpl &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, collectionId, filter, isLoading, error);

  /// Create a copy of SearchResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultStateImplCopyWith<_$SearchResultStateImpl> get copyWith =>
      __$$SearchResultStateImplCopyWithImpl<_$SearchResultStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchResultState implements SearchResultState {
  const factory _SearchResultState({
    required final String collectionId,
    required final ThreadsFilter filter,
    final bool isLoading,
    final String? error,
  }) = _$SearchResultStateImpl;

  @override
  String get collectionId;
  @override
  ThreadsFilter get filter;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of SearchResultState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResultStateImplCopyWith<_$SearchResultStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
