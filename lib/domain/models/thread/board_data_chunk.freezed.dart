// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_data_chunk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BoardDataChunk {
  String get boardId => throw _privateConstructorUsedError;
  List<SingleImagePostWithExtension> get threads =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of BoardDataChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardDataChunkCopyWith<BoardDataChunk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardDataChunkCopyWith<$Res> {
  factory $BoardDataChunkCopyWith(
    BoardDataChunk value,
    $Res Function(BoardDataChunk) then,
  ) = _$BoardDataChunkCopyWithImpl<$Res, BoardDataChunk>;
  @useResult
  $Res call({
    String boardId,
    List<SingleImagePostWithExtension> threads,
    bool isLoading,
    String? error,
  });
}

/// @nodoc
class _$BoardDataChunkCopyWithImpl<$Res, $Val extends BoardDataChunk>
    implements $BoardDataChunkCopyWith<$Res> {
  _$BoardDataChunkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardDataChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardId = null,
    Object? threads = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            boardId: null == boardId
                ? _value.boardId
                : boardId // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BoardDataChunkImplCopyWith<$Res>
    implements $BoardDataChunkCopyWith<$Res> {
  factory _$$BoardDataChunkImplCopyWith(
    _$BoardDataChunkImpl value,
    $Res Function(_$BoardDataChunkImpl) then,
  ) = __$$BoardDataChunkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String boardId,
    List<SingleImagePostWithExtension> threads,
    bool isLoading,
    String? error,
  });
}

/// @nodoc
class __$$BoardDataChunkImplCopyWithImpl<$Res>
    extends _$BoardDataChunkCopyWithImpl<$Res, _$BoardDataChunkImpl>
    implements _$$BoardDataChunkImplCopyWith<$Res> {
  __$$BoardDataChunkImplCopyWithImpl(
    _$BoardDataChunkImpl _value,
    $Res Function(_$BoardDataChunkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BoardDataChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardId = null,
    Object? threads = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$BoardDataChunkImpl(
        boardId: null == boardId
            ? _value.boardId
            : boardId // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$BoardDataChunkImpl implements _BoardDataChunk {
  const _$BoardDataChunkImpl({
    required this.boardId,
    final List<SingleImagePostWithExtension> threads = const [],
    this.isLoading = false,
    this.error,
  }) : _threads = threads;

  @override
  final String boardId;
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
  final String? error;

  @override
  String toString() {
    return 'BoardDataChunk(boardId: $boardId, threads: $threads, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardDataChunkImpl &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            const DeepCollectionEquality().equals(other._threads, _threads) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    boardId,
    const DeepCollectionEquality().hash(_threads),
    isLoading,
    error,
  );

  /// Create a copy of BoardDataChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardDataChunkImplCopyWith<_$BoardDataChunkImpl> get copyWith =>
      __$$BoardDataChunkImplCopyWithImpl<_$BoardDataChunkImpl>(
        this,
        _$identity,
      );
}

abstract class _BoardDataChunk implements BoardDataChunk {
  const factory _BoardDataChunk({
    required final String boardId,
    final List<SingleImagePostWithExtension> threads,
    final bool isLoading,
    final String? error,
  }) = _$BoardDataChunkImpl;

  @override
  String get boardId;
  @override
  List<SingleImagePostWithExtension> get threads;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of BoardDataChunk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardDataChunkImplCopyWith<_$BoardDataChunkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
