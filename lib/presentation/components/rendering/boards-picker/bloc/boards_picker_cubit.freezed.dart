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
  Map<String, String> get chosenBoards => throw _privateConstructorUsedError;
  Map<String, String> get submittedChosenBoards =>
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
      Map<String, String> chosenBoards,
      Map<String, String> submittedChosenBoards});

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
    Object? chosenBoards = null,
    Object? submittedChosenBoards = null,
  }) {
    return _then(_value.copyWith(
      extensionBoards: null == extensionBoards
          ? _value.extensionBoards
          : extensionBoards // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionWithBoards>>,
      chosenBoards: null == chosenBoards
          ? _value.chosenBoards
          : chosenBoards // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      submittedChosenBoards: null == submittedChosenBoards
          ? _value.submittedChosenBoards
          : submittedChosenBoards // ignore: cast_nullable_to_non_nullable
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
      Map<String, String> chosenBoards,
      Map<String, String> submittedChosenBoards});

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
    Object? chosenBoards = null,
    Object? submittedChosenBoards = null,
  }) {
    return _then(_$BoardsPickerStateImpl(
      extensionBoards: null == extensionBoards
          ? _value.extensionBoards
          : extensionBoards // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionWithBoards>>,
      chosenBoards: null == chosenBoards
          ? _value._chosenBoards
          : chosenBoards // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      submittedChosenBoards: null == submittedChosenBoards
          ? _value._submittedChosenBoards
          : submittedChosenBoards // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$BoardsPickerStateImpl implements _BoardsPickerState {
  const _$BoardsPickerStateImpl(
      {required this.extensionBoards,
      required final Map<String, String> chosenBoards,
      required final Map<String, String> submittedChosenBoards})
      : _chosenBoards = chosenBoards,
        _submittedChosenBoards = submittedChosenBoards;

  @override
  final Result<List<ExtensionWithBoards>> extensionBoards;
  final Map<String, String> _chosenBoards;
  @override
  Map<String, String> get chosenBoards {
    if (_chosenBoards is EqualUnmodifiableMapView) return _chosenBoards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chosenBoards);
  }

  final Map<String, String> _submittedChosenBoards;
  @override
  Map<String, String> get submittedChosenBoards {
    if (_submittedChosenBoards is EqualUnmodifiableMapView)
      return _submittedChosenBoards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_submittedChosenBoards);
  }

  @override
  String toString() {
    return 'BoardsPickerState(extensionBoards: $extensionBoards, chosenBoards: $chosenBoards, submittedChosenBoards: $submittedChosenBoards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardsPickerStateImpl &&
            (identical(other.extensionBoards, extensionBoards) ||
                other.extensionBoards == extensionBoards) &&
            const DeepCollectionEquality()
                .equals(other._chosenBoards, _chosenBoards) &&
            const DeepCollectionEquality()
                .equals(other._submittedChosenBoards, _submittedChosenBoards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      extensionBoards,
      const DeepCollectionEquality().hash(_chosenBoards),
      const DeepCollectionEquality().hash(_submittedChosenBoards));

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
          required final Map<String, String> chosenBoards,
          required final Map<String, String> submittedChosenBoards}) =
      _$BoardsPickerStateImpl;

  @override
  Result<List<ExtensionWithBoards>> get extensionBoards;
  @override
  Map<String, String> get chosenBoards;
  @override
  Map<String, String> get submittedChosenBoards;

  /// Create a copy of BoardsPickerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardsPickerStateImplCopyWith<_$BoardsPickerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
