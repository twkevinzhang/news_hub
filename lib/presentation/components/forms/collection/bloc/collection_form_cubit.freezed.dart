// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CollectionFormState {
  String get name => throw _privateConstructorUsedError;
  List<Board> get selectedBoards => throw _privateConstructorUsedError;
  Map<String, String> get boardSorts =>
      throw _privateConstructorUsedError; // boardId -> selectedSort
  Map<String, List<String>> get boardSortOptions =>
      throw _privateConstructorUsedError; // boardId -> options
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get editingCollectionId => throw _privateConstructorUsedError;

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionFormStateCopyWith<CollectionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionFormStateCopyWith<$Res> {
  factory $CollectionFormStateCopyWith(
          CollectionFormState value, $Res Function(CollectionFormState) then) =
      _$CollectionFormStateCopyWithImpl<$Res, CollectionFormState>;
  @useResult
  $Res call(
      {String name,
      List<Board> selectedBoards,
      Map<String, String> boardSorts,
      Map<String, List<String>> boardSortOptions,
      bool isSaving,
      bool isSuccess,
      String? errorMessage,
      String? editingCollectionId});
}

/// @nodoc
class _$CollectionFormStateCopyWithImpl<$Res, $Val extends CollectionFormState>
    implements $CollectionFormStateCopyWith<$Res> {
  _$CollectionFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? selectedBoards = null,
    Object? boardSorts = null,
    Object? boardSortOptions = null,
    Object? isSaving = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
    Object? editingCollectionId = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBoards: null == selectedBoards
          ? _value.selectedBoards
          : selectedBoards // ignore: cast_nullable_to_non_nullable
              as List<Board>,
      boardSorts: null == boardSorts
          ? _value.boardSorts
          : boardSorts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      boardSortOptions: null == boardSortOptions
          ? _value.boardSortOptions
          : boardSortOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      editingCollectionId: freezed == editingCollectionId
          ? _value.editingCollectionId
          : editingCollectionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionFormStateImplCopyWith<$Res>
    implements $CollectionFormStateCopyWith<$Res> {
  factory _$$CollectionFormStateImplCopyWith(_$CollectionFormStateImpl value,
          $Res Function(_$CollectionFormStateImpl) then) =
      __$$CollectionFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<Board> selectedBoards,
      Map<String, String> boardSorts,
      Map<String, List<String>> boardSortOptions,
      bool isSaving,
      bool isSuccess,
      String? errorMessage,
      String? editingCollectionId});
}

/// @nodoc
class __$$CollectionFormStateImplCopyWithImpl<$Res>
    extends _$CollectionFormStateCopyWithImpl<$Res, _$CollectionFormStateImpl>
    implements _$$CollectionFormStateImplCopyWith<$Res> {
  __$$CollectionFormStateImplCopyWithImpl(_$CollectionFormStateImpl _value,
      $Res Function(_$CollectionFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? selectedBoards = null,
    Object? boardSorts = null,
    Object? boardSortOptions = null,
    Object? isSaving = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
    Object? editingCollectionId = freezed,
  }) {
    return _then(_$CollectionFormStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selectedBoards: null == selectedBoards
          ? _value._selectedBoards
          : selectedBoards // ignore: cast_nullable_to_non_nullable
              as List<Board>,
      boardSorts: null == boardSorts
          ? _value._boardSorts
          : boardSorts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      boardSortOptions: null == boardSortOptions
          ? _value._boardSortOptions
          : boardSortOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      editingCollectionId: freezed == editingCollectionId
          ? _value.editingCollectionId
          : editingCollectionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CollectionFormStateImpl implements _CollectionFormState {
  const _$CollectionFormStateImpl(
      {this.name = '',
      final List<Board> selectedBoards = const [],
      final Map<String, String> boardSorts = const {},
      final Map<String, List<String>> boardSortOptions = const {},
      this.isSaving = false,
      this.isSuccess = false,
      this.errorMessage,
      this.editingCollectionId})
      : _selectedBoards = selectedBoards,
        _boardSorts = boardSorts,
        _boardSortOptions = boardSortOptions;

  @override
  @JsonKey()
  final String name;
  final List<Board> _selectedBoards;
  @override
  @JsonKey()
  List<Board> get selectedBoards {
    if (_selectedBoards is EqualUnmodifiableListView) return _selectedBoards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedBoards);
  }

  final Map<String, String> _boardSorts;
  @override
  @JsonKey()
  Map<String, String> get boardSorts {
    if (_boardSorts is EqualUnmodifiableMapView) return _boardSorts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boardSorts);
  }

// boardId -> selectedSort
  final Map<String, List<String>> _boardSortOptions;
// boardId -> selectedSort
  @override
  @JsonKey()
  Map<String, List<String>> get boardSortOptions {
    if (_boardSortOptions is EqualUnmodifiableMapView) return _boardSortOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boardSortOptions);
  }

// boardId -> options
  @override
  @JsonKey()
  final bool isSaving;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorMessage;
  @override
  final String? editingCollectionId;

  @override
  String toString() {
    return 'CollectionFormState(name: $name, selectedBoards: $selectedBoards, boardSorts: $boardSorts, boardSortOptions: $boardSortOptions, isSaving: $isSaving, isSuccess: $isSuccess, errorMessage: $errorMessage, editingCollectionId: $editingCollectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionFormStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._selectedBoards, _selectedBoards) &&
            const DeepCollectionEquality()
                .equals(other._boardSorts, _boardSorts) &&
            const DeepCollectionEquality()
                .equals(other._boardSortOptions, _boardSortOptions) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.editingCollectionId, editingCollectionId) ||
                other.editingCollectionId == editingCollectionId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_selectedBoards),
      const DeepCollectionEquality().hash(_boardSorts),
      const DeepCollectionEquality().hash(_boardSortOptions),
      isSaving,
      isSuccess,
      errorMessage,
      editingCollectionId);

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionFormStateImplCopyWith<_$CollectionFormStateImpl> get copyWith =>
      __$$CollectionFormStateImplCopyWithImpl<_$CollectionFormStateImpl>(
          this, _$identity);
}

abstract class _CollectionFormState implements CollectionFormState {
  const factory _CollectionFormState(
      {final String name,
      final List<Board> selectedBoards,
      final Map<String, String> boardSorts,
      final Map<String, List<String>> boardSortOptions,
      final bool isSaving,
      final bool isSuccess,
      final String? errorMessage,
      final String? editingCollectionId}) = _$CollectionFormStateImpl;

  @override
  String get name;
  @override
  List<Board> get selectedBoards;
  @override
  Map<String, String> get boardSorts; // boardId -> selectedSort
  @override
  Map<String, List<String>> get boardSortOptions; // boardId -> options
  @override
  bool get isSaving;
  @override
  bool get isSuccess;
  @override
  String? get errorMessage;
  @override
  String? get editingCollectionId;

  /// Create a copy of CollectionFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionFormStateImplCopyWith<_$CollectionFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
