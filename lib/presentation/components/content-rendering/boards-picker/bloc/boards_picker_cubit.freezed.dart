// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boards_picker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoardsPickerState {
  Result<List<ExtensionWithBoards>> get extensionBoards =>
      throw _privateConstructorUsedError;
  Map<String, String> get chosenBoardsSorting =>
      throw _privateConstructorUsedError;
  Map<String, String> get submittedChosenBoardsSorting =>
      throw _privateConstructorUsedError;

  /// Create a copy of BoardsPickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardsPickerStateCopyWith<BoardsPickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardsPickerStateCopyWith<$Res> {
  factory $BoardsPickerStateCopyWith(
          BoardsPickerState value, $Res Function(BoardsPickerState) then) =
      _$BoardsPickerStateCopyWithImpl<$Res, BoardsPickerState>;
  @useResult
  $Res call(
      {Result<List<ExtensionWithBoards>> extensionBoards,
      Map<String, String> chosenBoardsSorting,
      Map<String, String> submittedChosenBoardsSorting});

  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get extensionBoards;
}

/// @nodoc
class _$BoardsPickerStateCopyWithImpl<$Res, $Val extends BoardsPickerState>
    implements $BoardsPickerStateCopyWith<$Res> {
  _$BoardsPickerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardsPickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionBoards = null,
    Object? chosenBoardsSorting = null,
    Object? submittedChosenBoardsSorting = null,
  }) {
    return _then(_value.copyWith(
      extensionBoards: null == extensionBoards
          ? _value.extensionBoards
          : extensionBoards // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionWithBoards>>,
      chosenBoardsSorting: null == chosenBoardsSorting
          ? _value.chosenBoardsSorting
          : chosenBoardsSorting // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      submittedChosenBoardsSorting: null == submittedChosenBoardsSorting
          ? _value.submittedChosenBoardsSorting
          : submittedChosenBoardsSorting // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }

  /// Create a copy of BoardsPickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get extensionBoards {
    return $ResultCopyWith<List<ExtensionWithBoards>, $Res>(
        _value.extensionBoards, (value) {
      return _then(_value.copyWith(extensionBoards: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardsPickerStateImplCopyWith<$Res>
    implements $BoardsPickerStateCopyWith<$Res> {
  factory _$$BoardsPickerStateImplCopyWith(_$BoardsPickerStateImpl value,
          $Res Function(_$BoardsPickerStateImpl) then) =
      __$$BoardsPickerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<List<ExtensionWithBoards>> extensionBoards,
      Map<String, String> chosenBoardsSorting,
      Map<String, String> submittedChosenBoardsSorting});

  @override
  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get extensionBoards;
}

/// @nodoc
class __$$BoardsPickerStateImplCopyWithImpl<$Res>
    extends _$BoardsPickerStateCopyWithImpl<$Res, _$BoardsPickerStateImpl>
    implements _$$BoardsPickerStateImplCopyWith<$Res> {
  __$$BoardsPickerStateImplCopyWithImpl(_$BoardsPickerStateImpl _value,
      $Res Function(_$BoardsPickerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoardsPickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionBoards = null,
    Object? chosenBoardsSorting = null,
    Object? submittedChosenBoardsSorting = null,
  }) {
    return _then(_$BoardsPickerStateImpl(
      extensionBoards: null == extensionBoards
          ? _value.extensionBoards
          : extensionBoards // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionWithBoards>>,
      chosenBoardsSorting: null == chosenBoardsSorting
          ? _value._chosenBoardsSorting
          : chosenBoardsSorting // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      submittedChosenBoardsSorting: null == submittedChosenBoardsSorting
          ? _value._submittedChosenBoardsSorting
          : submittedChosenBoardsSorting // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$BoardsPickerStateImpl implements _BoardsPickerState {
  const _$BoardsPickerStateImpl(
      {required this.extensionBoards,
      required final Map<String, String> chosenBoardsSorting,
      required final Map<String, String> submittedChosenBoardsSorting})
      : _chosenBoardsSorting = chosenBoardsSorting,
        _submittedChosenBoardsSorting = submittedChosenBoardsSorting;

  @override
  final Result<List<ExtensionWithBoards>> extensionBoards;
  final Map<String, String> _chosenBoardsSorting;
  @override
  Map<String, String> get chosenBoardsSorting {
    if (_chosenBoardsSorting is EqualUnmodifiableMapView)
      return _chosenBoardsSorting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chosenBoardsSorting);
  }

  final Map<String, String> _submittedChosenBoardsSorting;
  @override
  Map<String, String> get submittedChosenBoardsSorting {
    if (_submittedChosenBoardsSorting is EqualUnmodifiableMapView)
      return _submittedChosenBoardsSorting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_submittedChosenBoardsSorting);
  }

  @override
  String toString() {
    return 'BoardsPickerState(extensionBoards: $extensionBoards, chosenBoardsSorting: $chosenBoardsSorting, submittedChosenBoardsSorting: $submittedChosenBoardsSorting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardsPickerStateImpl &&
            (identical(other.extensionBoards, extensionBoards) ||
                other.extensionBoards == extensionBoards) &&
            const DeepCollectionEquality()
                .equals(other._chosenBoardsSorting, _chosenBoardsSorting) &&
            const DeepCollectionEquality().equals(
                other._submittedChosenBoardsSorting,
                _submittedChosenBoardsSorting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      extensionBoards,
      const DeepCollectionEquality().hash(_chosenBoardsSorting),
      const DeepCollectionEquality().hash(_submittedChosenBoardsSorting));

  /// Create a copy of BoardsPickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardsPickerStateImplCopyWith<_$BoardsPickerStateImpl> get copyWith =>
      __$$BoardsPickerStateImplCopyWithImpl<_$BoardsPickerStateImpl>(
          this, _$identity);
}

abstract class _BoardsPickerState implements BoardsPickerState {
  const factory _BoardsPickerState(
          {required final Result<List<ExtensionWithBoards>> extensionBoards,
          required final Map<String, String> chosenBoardsSorting,
          required final Map<String, String> submittedChosenBoardsSorting}) =
      _$BoardsPickerStateImpl;

  @override
  Result<List<ExtensionWithBoards>> get extensionBoards;
  @override
  Map<String, String> get chosenBoardsSorting;
  @override
  Map<String, String> get submittedChosenBoardsSorting;

  /// Create a copy of BoardsPickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardsPickerStateImplCopyWith<_$BoardsPickerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
