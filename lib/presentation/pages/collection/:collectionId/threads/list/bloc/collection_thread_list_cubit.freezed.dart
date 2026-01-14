// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_thread_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CollectionThreadListState {
  Collection? get collection => throw _privateConstructorUsedError;
  Map<String, List<SingleImagePostWithExtension>> get boardData =>
      throw _privateConstructorUsedError;
  Set<String> get loadingBoardIds => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  ThreadsFilter get activeFilter => throw _privateConstructorUsedError;

  /// Create a copy of CollectionThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionThreadListStateCopyWith<CollectionThreadListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionThreadListStateCopyWith<$Res> {
  factory $CollectionThreadListStateCopyWith(
    CollectionThreadListState value,
    $Res Function(CollectionThreadListState) then,
  ) = _$CollectionThreadListStateCopyWithImpl<$Res, CollectionThreadListState>;
  @useResult
  $Res call({
    Collection? collection,
    Map<String, List<SingleImagePostWithExtension>> boardData,
    Set<String> loadingBoardIds,
    String? error,
    ThreadsFilter activeFilter,
  });

  $ThreadsFilterCopyWith<$Res> get activeFilter;
}

/// @nodoc
class _$CollectionThreadListStateCopyWithImpl<
  $Res,
  $Val extends CollectionThreadListState
>
    implements $CollectionThreadListStateCopyWith<$Res> {
  _$CollectionThreadListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = freezed,
    Object? boardData = null,
    Object? loadingBoardIds = null,
    Object? error = freezed,
    Object? activeFilter = null,
  }) {
    return _then(
      _value.copyWith(
            collection: freezed == collection
                ? _value.collection
                : collection // ignore: cast_nullable_to_non_nullable
                      as Collection?,
            boardData: null == boardData
                ? _value.boardData
                : boardData // ignore: cast_nullable_to_non_nullable
                      as Map<String, List<SingleImagePostWithExtension>>,
            loadingBoardIds: null == loadingBoardIds
                ? _value.loadingBoardIds
                : loadingBoardIds // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            activeFilter: null == activeFilter
                ? _value.activeFilter
                : activeFilter // ignore: cast_nullable_to_non_nullable
                      as ThreadsFilter,
          )
          as $Val,
    );
  }

  /// Create a copy of CollectionThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsFilterCopyWith<$Res> get activeFilter {
    return $ThreadsFilterCopyWith<$Res>(_value.activeFilter, (value) {
      return _then(_value.copyWith(activeFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CollectionThreadListStateImplCopyWith<$Res>
    implements $CollectionThreadListStateCopyWith<$Res> {
  factory _$$CollectionThreadListStateImplCopyWith(
    _$CollectionThreadListStateImpl value,
    $Res Function(_$CollectionThreadListStateImpl) then,
  ) = __$$CollectionThreadListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Collection? collection,
    Map<String, List<SingleImagePostWithExtension>> boardData,
    Set<String> loadingBoardIds,
    String? error,
    ThreadsFilter activeFilter,
  });

  @override
  $ThreadsFilterCopyWith<$Res> get activeFilter;
}

/// @nodoc
class __$$CollectionThreadListStateImplCopyWithImpl<$Res>
    extends
        _$CollectionThreadListStateCopyWithImpl<
          $Res,
          _$CollectionThreadListStateImpl
        >
    implements _$$CollectionThreadListStateImplCopyWith<$Res> {
  __$$CollectionThreadListStateImplCopyWithImpl(
    _$CollectionThreadListStateImpl _value,
    $Res Function(_$CollectionThreadListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CollectionThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = freezed,
    Object? boardData = null,
    Object? loadingBoardIds = null,
    Object? error = freezed,
    Object? activeFilter = null,
  }) {
    return _then(
      _$CollectionThreadListStateImpl(
        collection: freezed == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as Collection?,
        boardData: null == boardData
            ? _value._boardData
            : boardData // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<SingleImagePostWithExtension>>,
        loadingBoardIds: null == loadingBoardIds
            ? _value._loadingBoardIds
            : loadingBoardIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        activeFilter: null == activeFilter
            ? _value.activeFilter
            : activeFilter // ignore: cast_nullable_to_non_nullable
                  as ThreadsFilter,
      ),
    );
  }
}

/// @nodoc

class _$CollectionThreadListStateImpl implements _CollectionThreadListState {
  const _$CollectionThreadListStateImpl({
    this.collection = null,
    final Map<String, List<SingleImagePostWithExtension>> boardData = const {},
    final Set<String> loadingBoardIds = const {},
    this.error,
    this.activeFilter = const ThreadsFilter(boardSorts: {}, keywords: ''),
  }) : _boardData = boardData,
       _loadingBoardIds = loadingBoardIds;

  @override
  @JsonKey()
  final Collection? collection;
  final Map<String, List<SingleImagePostWithExtension>> _boardData;
  @override
  @JsonKey()
  Map<String, List<SingleImagePostWithExtension>> get boardData {
    if (_boardData is EqualUnmodifiableMapView) return _boardData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boardData);
  }

  final Set<String> _loadingBoardIds;
  @override
  @JsonKey()
  Set<String> get loadingBoardIds {
    if (_loadingBoardIds is EqualUnmodifiableSetView) return _loadingBoardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_loadingBoardIds);
  }

  @override
  final String? error;
  @override
  @JsonKey()
  final ThreadsFilter activeFilter;

  @override
  String toString() {
    return 'CollectionThreadListState(collection: $collection, boardData: $boardData, loadingBoardIds: $loadingBoardIds, error: $error, activeFilter: $activeFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionThreadListStateImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            const DeepCollectionEquality().equals(
              other._boardData,
              _boardData,
            ) &&
            const DeepCollectionEquality().equals(
              other._loadingBoardIds,
              _loadingBoardIds,
            ) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.activeFilter, activeFilter) ||
                other.activeFilter == activeFilter));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    collection,
    const DeepCollectionEquality().hash(_boardData),
    const DeepCollectionEquality().hash(_loadingBoardIds),
    error,
    activeFilter,
  );

  /// Create a copy of CollectionThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionThreadListStateImplCopyWith<_$CollectionThreadListStateImpl>
  get copyWith =>
      __$$CollectionThreadListStateImplCopyWithImpl<
        _$CollectionThreadListStateImpl
      >(this, _$identity);
}

abstract class _CollectionThreadListState implements CollectionThreadListState {
  const factory _CollectionThreadListState({
    final Collection? collection,
    final Map<String, List<SingleImagePostWithExtension>> boardData,
    final Set<String> loadingBoardIds,
    final String? error,
    final ThreadsFilter activeFilter,
  }) = _$CollectionThreadListStateImpl;

  @override
  Collection? get collection;
  @override
  Map<String, List<SingleImagePostWithExtension>> get boardData;
  @override
  Set<String> get loadingBoardIds;
  @override
  String? get error;
  @override
  ThreadsFilter get activeFilter;

  /// Create a copy of CollectionThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionThreadListStateImplCopyWith<_$CollectionThreadListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
