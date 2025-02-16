// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_by_boards_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterByBoardsState {
  Result<List<ExtensionWithBoards>> get installedExtensions =>
      throw _privateConstructorUsedError;
  Set<String> get extensionPkgNames => throw _privateConstructorUsedError;
  Set<String> get boardIds => throw _privateConstructorUsedError;

  /// Create a copy of FilterByBoardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterByBoardsStateCopyWith<FilterByBoardsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterByBoardsStateCopyWith<$Res> {
  factory $FilterByBoardsStateCopyWith(
          FilterByBoardsState value, $Res Function(FilterByBoardsState) then) =
      _$FilterByBoardsStateCopyWithImpl<$Res, FilterByBoardsState>;
  @useResult
  $Res call(
      {Result<List<ExtensionWithBoards>> installedExtensions,
      Set<String> extensionPkgNames,
      Set<String> boardIds});

  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get installedExtensions;
}

/// @nodoc
class _$FilterByBoardsStateCopyWithImpl<$Res, $Val extends FilterByBoardsState>
    implements $FilterByBoardsStateCopyWith<$Res> {
  _$FilterByBoardsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterByBoardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installedExtensions = null,
    Object? extensionPkgNames = null,
    Object? boardIds = null,
  }) {
    return _then(_value.copyWith(
      installedExtensions: null == installedExtensions
          ? _value.installedExtensions
          : installedExtensions // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionWithBoards>>,
      extensionPkgNames: null == extensionPkgNames
          ? _value.extensionPkgNames
          : extensionPkgNames // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      boardIds: null == boardIds
          ? _value.boardIds
          : boardIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }

  /// Create a copy of FilterByBoardsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get installedExtensions {
    return $ResultCopyWith<List<ExtensionWithBoards>, $Res>(
        _value.installedExtensions, (value) {
      return _then(_value.copyWith(installedExtensions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FilterByBoardsStateImplCopyWith<$Res>
    implements $FilterByBoardsStateCopyWith<$Res> {
  factory _$$FilterByBoardsStateImplCopyWith(_$FilterByBoardsStateImpl value,
          $Res Function(_$FilterByBoardsStateImpl) then) =
      __$$FilterByBoardsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<List<ExtensionWithBoards>> installedExtensions,
      Set<String> extensionPkgNames,
      Set<String> boardIds});

  @override
  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get installedExtensions;
}

/// @nodoc
class __$$FilterByBoardsStateImplCopyWithImpl<$Res>
    extends _$FilterByBoardsStateCopyWithImpl<$Res, _$FilterByBoardsStateImpl>
    implements _$$FilterByBoardsStateImplCopyWith<$Res> {
  __$$FilterByBoardsStateImplCopyWithImpl(_$FilterByBoardsStateImpl _value,
      $Res Function(_$FilterByBoardsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterByBoardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? installedExtensions = null,
    Object? extensionPkgNames = null,
    Object? boardIds = null,
  }) {
    return _then(_$FilterByBoardsStateImpl(
      installedExtensions: null == installedExtensions
          ? _value.installedExtensions
          : installedExtensions // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionWithBoards>>,
      extensionPkgNames: null == extensionPkgNames
          ? _value._extensionPkgNames
          : extensionPkgNames // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      boardIds: null == boardIds
          ? _value._boardIds
          : boardIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc

class _$FilterByBoardsStateImpl implements _FilterByBoardsState {
  const _$FilterByBoardsStateImpl(
      {required this.installedExtensions,
      required final Set<String> extensionPkgNames,
      required final Set<String> boardIds})
      : _extensionPkgNames = extensionPkgNames,
        _boardIds = boardIds;

  @override
  final Result<List<ExtensionWithBoards>> installedExtensions;
  final Set<String> _extensionPkgNames;
  @override
  Set<String> get extensionPkgNames {
    if (_extensionPkgNames is EqualUnmodifiableSetView)
      return _extensionPkgNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_extensionPkgNames);
  }

  final Set<String> _boardIds;
  @override
  Set<String> get boardIds {
    if (_boardIds is EqualUnmodifiableSetView) return _boardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_boardIds);
  }

  @override
  String toString() {
    return 'FilterByBoardsState(installedExtensions: $installedExtensions, extensionPkgNames: $extensionPkgNames, boardIds: $boardIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByBoardsStateImpl &&
            (identical(other.installedExtensions, installedExtensions) ||
                other.installedExtensions == installedExtensions) &&
            const DeepCollectionEquality()
                .equals(other._extensionPkgNames, _extensionPkgNames) &&
            const DeepCollectionEquality().equals(other._boardIds, _boardIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      installedExtensions,
      const DeepCollectionEquality().hash(_extensionPkgNames),
      const DeepCollectionEquality().hash(_boardIds));

  /// Create a copy of FilterByBoardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByBoardsStateImplCopyWith<_$FilterByBoardsStateImpl> get copyWith =>
      __$$FilterByBoardsStateImplCopyWithImpl<_$FilterByBoardsStateImpl>(
          this, _$identity);
}

abstract class _FilterByBoardsState implements FilterByBoardsState {
  const factory _FilterByBoardsState(
      {required final Result<List<ExtensionWithBoards>> installedExtensions,
      required final Set<String> extensionPkgNames,
      required final Set<String> boardIds}) = _$FilterByBoardsStateImpl;

  @override
  Result<List<ExtensionWithBoards>> get installedExtensions;
  @override
  Set<String> get extensionPkgNames;
  @override
  Set<String> get boardIds;

  /// Create a copy of FilterByBoardsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterByBoardsStateImplCopyWith<_$FilterByBoardsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
