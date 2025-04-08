// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_infos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThreadInfosState {
  Map<String, Board> get boardsMap => throw _privateConstructorUsedError;
  ThreadsFilter get filter => throw _privateConstructorUsedError;
  ThreadsSorting get sorting => throw _privateConstructorUsedError;

  /// Create a copy of ThreadInfosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadInfosStateCopyWith<ThreadInfosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadInfosStateCopyWith<$Res> {
  factory $ThreadInfosStateCopyWith(
          ThreadInfosState value, $Res Function(ThreadInfosState) then) =
      _$ThreadInfosStateCopyWithImpl<$Res, ThreadInfosState>;
  @useResult
  $Res call(
      {Map<String, Board> boardsMap,
      ThreadsFilter filter,
      ThreadsSorting sorting});

  $ThreadsFilterCopyWith<$Res> get filter;
  $ThreadsSortingCopyWith<$Res> get sorting;
}

/// @nodoc
class _$ThreadInfosStateCopyWithImpl<$Res, $Val extends ThreadInfosState>
    implements $ThreadInfosStateCopyWith<$Res> {
  _$ThreadInfosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadInfosState
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

  /// Create a copy of ThreadInfosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsFilterCopyWith<$Res> get filter {
    return $ThreadsFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of ThreadInfosState
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
abstract class _$$ThreadInfosStateImplCopyWith<$Res>
    implements $ThreadInfosStateCopyWith<$Res> {
  factory _$$ThreadInfosStateImplCopyWith(_$ThreadInfosStateImpl value,
          $Res Function(_$ThreadInfosStateImpl) then) =
      __$$ThreadInfosStateImplCopyWithImpl<$Res>;
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
class __$$ThreadInfosStateImplCopyWithImpl<$Res>
    extends _$ThreadInfosStateCopyWithImpl<$Res, _$ThreadInfosStateImpl>
    implements _$$ThreadInfosStateImplCopyWith<$Res> {
  __$$ThreadInfosStateImplCopyWithImpl(_$ThreadInfosStateImpl _value,
      $Res Function(_$ThreadInfosStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadInfosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardsMap = null,
    Object? filter = null,
    Object? sorting = null,
  }) {
    return _then(_$ThreadInfosStateImpl(
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

class _$ThreadInfosStateImpl
    with DiagnosticableTreeMixin
    implements _ThreadInfosState {
  const _$ThreadInfosStateImpl(
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
    return 'ThreadInfosState(boardsMap: $boardsMap, filter: $filter, sorting: $sorting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadInfosState'))
      ..add(DiagnosticsProperty('boardsMap', boardsMap))
      ..add(DiagnosticsProperty('filter', filter))
      ..add(DiagnosticsProperty('sorting', sorting));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadInfosStateImpl &&
            const DeepCollectionEquality()
                .equals(other._boardsMap, _boardsMap) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.sorting, sorting) || other.sorting == sorting));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_boardsMap), filter, sorting);

  /// Create a copy of ThreadInfosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadInfosStateImplCopyWith<_$ThreadInfosStateImpl> get copyWith =>
      __$$ThreadInfosStateImplCopyWithImpl<_$ThreadInfosStateImpl>(
          this, _$identity);
}

abstract class _ThreadInfosState implements ThreadInfosState {
  const factory _ThreadInfosState(
      {required final Map<String, Board> boardsMap,
      required final ThreadsFilter filter,
      required final ThreadsSorting sorting}) = _$ThreadInfosStateImpl;

  @override
  Map<String, Board> get boardsMap;
  @override
  ThreadsFilter get filter;
  @override
  ThreadsSorting get sorting;

  /// Create a copy of ThreadInfosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadInfosStateImplCopyWith<_$ThreadInfosStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
