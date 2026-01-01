// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThreadListState {
  Map<String, Board> get boardsMap => throw _privateConstructorUsedError;
  ThreadsFilter get filter => throw _privateConstructorUsedError;
  ThreadsSorting get sorting => throw _privateConstructorUsedError;

  /// Create a copy of ThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadListStateCopyWith<ThreadListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadListStateCopyWith<$Res> {
  factory $ThreadListStateCopyWith(
          ThreadListState value, $Res Function(ThreadListState) then) =
      _$ThreadListStateCopyWithImpl<$Res, ThreadListState>;
  @useResult
  $Res call(
      {Map<String, Board> boardsMap,
      ThreadsFilter filter,
      ThreadsSorting sorting});

  $ThreadsFilterCopyWith<$Res> get filter;
  $ThreadsSortingCopyWith<$Res> get sorting;
}

/// @nodoc
class _$ThreadListStateCopyWithImpl<$Res, $Val extends ThreadListState>
    implements $ThreadListStateCopyWith<$Res> {
  _$ThreadListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardsMap = null,
    Object? filter = null,
    Object? sorting = null,
  }) {
    return _then(_value.copyWith(
      boardsMap: null == boardsMap
          ? _value.boardsMap
          : boardsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Board>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ThreadsFilter,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as ThreadsSorting,
    ) as $Val);
  }

  /// Create a copy of ThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsFilterCopyWith<$Res> get filter {
    return $ThreadsFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of ThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsSortingCopyWith<$Res> get sorting {
    return $ThreadsSortingCopyWith<$Res>(_value.sorting, (value) {
      return _then(_value.copyWith(sorting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThreadListStateImplCopyWith<$Res>
    implements $ThreadListStateCopyWith<$Res> {
  factory _$$ThreadListStateImplCopyWith(_$ThreadListStateImpl value,
          $Res Function(_$ThreadListStateImpl) then) =
      __$$ThreadListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, Board> boardsMap,
      ThreadsFilter filter,
      ThreadsSorting sorting});

  @override
  $ThreadsFilterCopyWith<$Res> get filter;
  @override
  $ThreadsSortingCopyWith<$Res> get sorting;
}

/// @nodoc
class __$$ThreadListStateImplCopyWithImpl<$Res>
    extends _$ThreadListStateCopyWithImpl<$Res, _$ThreadListStateImpl>
    implements _$$ThreadListStateImplCopyWith<$Res> {
  __$$ThreadListStateImplCopyWithImpl(
      _$ThreadListStateImpl _value, $Res Function(_$ThreadListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardsMap = null,
    Object? filter = null,
    Object? sorting = null,
  }) {
    return _then(_$ThreadListStateImpl(
      boardsMap: null == boardsMap
          ? _value._boardsMap
          : boardsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Board>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ThreadsFilter,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as ThreadsSorting,
    ));
  }
}

/// @nodoc

class _$ThreadListStateImpl
    with DiagnosticableTreeMixin
    implements _ThreadListState {
  const _$ThreadListStateImpl(
      {required final Map<String, Board> boardsMap,
      required this.filter,
      required this.sorting})
      : _boardsMap = boardsMap;

  final Map<String, Board> _boardsMap;
  @override
  Map<String, Board> get boardsMap {
    if (_boardsMap is EqualUnmodifiableMapView) return _boardsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boardsMap);
  }

  @override
  final ThreadsFilter filter;
  @override
  final ThreadsSorting sorting;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadListState(boardsMap: $boardsMap, filter: $filter, sorting: $sorting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadListState'))
      ..add(DiagnosticsProperty('boardsMap', boardsMap))
      ..add(DiagnosticsProperty('filter', filter))
      ..add(DiagnosticsProperty('sorting', sorting));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._boardsMap, _boardsMap) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.sorting, sorting) || other.sorting == sorting));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_boardsMap), filter, sorting);

  /// Create a copy of ThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadListStateImplCopyWith<_$ThreadListStateImpl> get copyWith =>
      __$$ThreadListStateImplCopyWithImpl<_$ThreadListStateImpl>(
          this, _$identity);
}

abstract class _ThreadListState implements ThreadListState {
  const factory _ThreadListState(
      {required final Map<String, Board> boardsMap,
      required final ThreadsFilter filter,
      required final ThreadsSorting sorting}) = _$ThreadListStateImpl;

  @override
  Map<String, Board> get boardsMap;
  @override
  ThreadsFilter get filter;
  @override
  ThreadsSorting get sorting;

  /// Create a copy of ThreadListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadListStateImplCopyWith<_$ThreadListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
