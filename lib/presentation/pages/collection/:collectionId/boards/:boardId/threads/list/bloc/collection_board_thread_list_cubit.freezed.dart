// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_board_thread_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CollectionBoardThreadListState {
  Collection? get collection => throw _privateConstructorUsedError;
  CollectionBoard? get board => throw _privateConstructorUsedError;
  List<SingleImagePostWithExtension> get threads =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  ThreadsFilter get activeFilter => throw _privateConstructorUsedError;

  /// Create a copy of CollectionBoardThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionBoardThreadListStateCopyWith<CollectionBoardThreadListState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionBoardThreadListStateCopyWith<$Res> {
  factory $CollectionBoardThreadListStateCopyWith(
    CollectionBoardThreadListState value,
    $Res Function(CollectionBoardThreadListState) then,
  ) =
      _$CollectionBoardThreadListStateCopyWithImpl<
        $Res,
        CollectionBoardThreadListState
      >;
  @useResult
  $Res call({
    Collection? collection,
    CollectionBoard? board,
    List<SingleImagePostWithExtension> threads,
    bool isLoading,
    Failure? error,
    ThreadsFilter activeFilter,
  });

  $CollectionBoardCopyWith<$Res>? get board;
  $FailureCopyWith<$Res>? get error;
  $ThreadsFilterCopyWith<$Res> get activeFilter;
}

/// @nodoc
class _$CollectionBoardThreadListStateCopyWithImpl<
  $Res,
  $Val extends CollectionBoardThreadListState
>
    implements $CollectionBoardThreadListStateCopyWith<$Res> {
  _$CollectionBoardThreadListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionBoardThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = freezed,
    Object? board = freezed,
    Object? threads = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? activeFilter = null,
  }) {
    return _then(
      _value.copyWith(
            collection: freezed == collection
                ? _value.collection
                : collection // ignore: cast_nullable_to_non_nullable
                      as Collection?,
            board: freezed == board
                ? _value.board
                : board // ignore: cast_nullable_to_non_nullable
                      as CollectionBoard?,
            threads: null == threads
                ? _value.threads
                : threads // ignore: cast_nullable_to_non_nullable
                      as List<SingleImagePostWithExtension>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as Failure?,
            activeFilter: null == activeFilter
                ? _value.activeFilter
                : activeFilter // ignore: cast_nullable_to_non_nullable
                      as ThreadsFilter,
          )
          as $Val,
    );
  }

  /// Create a copy of CollectionBoardThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionBoardCopyWith<$Res>? get board {
    if (_value.board == null) {
      return null;
    }

    return $CollectionBoardCopyWith<$Res>(_value.board!, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }

  /// Create a copy of CollectionBoardThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }

  /// Create a copy of CollectionBoardThreadListState
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
abstract class _$$CollectionBoardThreadListStateImplCopyWith<$Res>
    implements $CollectionBoardThreadListStateCopyWith<$Res> {
  factory _$$CollectionBoardThreadListStateImplCopyWith(
    _$CollectionBoardThreadListStateImpl value,
    $Res Function(_$CollectionBoardThreadListStateImpl) then,
  ) = __$$CollectionBoardThreadListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Collection? collection,
    CollectionBoard? board,
    List<SingleImagePostWithExtension> threads,
    bool isLoading,
    Failure? error,
    ThreadsFilter activeFilter,
  });

  @override
  $CollectionBoardCopyWith<$Res>? get board;
  @override
  $FailureCopyWith<$Res>? get error;
  @override
  $ThreadsFilterCopyWith<$Res> get activeFilter;
}

/// @nodoc
class __$$CollectionBoardThreadListStateImplCopyWithImpl<$Res>
    extends
        _$CollectionBoardThreadListStateCopyWithImpl<
          $Res,
          _$CollectionBoardThreadListStateImpl
        >
    implements _$$CollectionBoardThreadListStateImplCopyWith<$Res> {
  __$$CollectionBoardThreadListStateImplCopyWithImpl(
    _$CollectionBoardThreadListStateImpl _value,
    $Res Function(_$CollectionBoardThreadListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CollectionBoardThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = freezed,
    Object? board = freezed,
    Object? threads = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? activeFilter = null,
  }) {
    return _then(
      _$CollectionBoardThreadListStateImpl(
        collection: freezed == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as Collection?,
        board: freezed == board
            ? _value.board
            : board // ignore: cast_nullable_to_non_nullable
                  as CollectionBoard?,
        threads: null == threads
            ? _value._threads
            : threads // ignore: cast_nullable_to_non_nullable
                  as List<SingleImagePostWithExtension>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as Failure?,
        activeFilter: null == activeFilter
            ? _value.activeFilter
            : activeFilter // ignore: cast_nullable_to_non_nullable
                  as ThreadsFilter,
      ),
    );
  }
}

/// @nodoc

class _$CollectionBoardThreadListStateImpl
    implements _CollectionBoardThreadListState {
  const _$CollectionBoardThreadListStateImpl({
    this.collection = null,
    this.board = null,
    final List<SingleImagePostWithExtension> threads = const [],
    this.isLoading = false,
    this.error,
    this.activeFilter = const ThreadsFilter(boardSorts: {}, keywords: ''),
  }) : _threads = threads;

  @override
  @JsonKey()
  final Collection? collection;
  @override
  @JsonKey()
  final CollectionBoard? board;
  final List<SingleImagePostWithExtension> _threads;
  @override
  @JsonKey()
  List<SingleImagePostWithExtension> get threads {
    if (_threads is EqualUnmodifiableListView) return _threads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_threads);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Failure? error;
  @override
  @JsonKey()
  final ThreadsFilter activeFilter;

  @override
  String toString() {
    return 'CollectionBoardThreadListState(collection: $collection, board: $board, threads: $threads, isLoading: $isLoading, error: $error, activeFilter: $activeFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionBoardThreadListStateImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.board, board) || other.board == board) &&
            const DeepCollectionEquality().equals(other._threads, _threads) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.activeFilter, activeFilter) ||
                other.activeFilter == activeFilter));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    collection,
    board,
    const DeepCollectionEquality().hash(_threads),
    isLoading,
    error,
    activeFilter,
  );

  /// Create a copy of CollectionBoardThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionBoardThreadListStateImplCopyWith<
    _$CollectionBoardThreadListStateImpl
  >
  get copyWith =>
      __$$CollectionBoardThreadListStateImplCopyWithImpl<
        _$CollectionBoardThreadListStateImpl
      >(this, _$identity);
}

abstract class _CollectionBoardThreadListState
    implements CollectionBoardThreadListState {
  const factory _CollectionBoardThreadListState({
    final Collection? collection,
    final CollectionBoard? board,
    final List<SingleImagePostWithExtension> threads,
    final bool isLoading,
    final Failure? error,
    final ThreadsFilter activeFilter,
  }) = _$CollectionBoardThreadListStateImpl;

  @override
  Collection? get collection;
  @override
  CollectionBoard? get board;
  @override
  List<SingleImagePostWithExtension> get threads;
  @override
  bool get isLoading;
  @override
  Failure? get error;
  @override
  ThreadsFilter get activeFilter;

  /// Create a copy of CollectionBoardThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionBoardThreadListStateImplCopyWith<
    _$CollectionBoardThreadListStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
