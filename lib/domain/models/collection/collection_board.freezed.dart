// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CollectionBoard {
  BoardIdentity get identity => throw _privateConstructorUsedError;
  String get collectionId => throw _privateConstructorUsedError;
  String? get selectedSort => throw _privateConstructorUsedError;

  /// Create a copy of CollectionBoard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionBoardCopyWith<CollectionBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionBoardCopyWith<$Res> {
  factory $CollectionBoardCopyWith(
    CollectionBoard value,
    $Res Function(CollectionBoard) then,
  ) = _$CollectionBoardCopyWithImpl<$Res, CollectionBoard>;
  @useResult
  $Res call({
    BoardIdentity identity,
    String collectionId,
    String? selectedSort,
  });

  $BoardIdentityCopyWith<$Res> get identity;
}

/// @nodoc
class _$CollectionBoardCopyWithImpl<$Res, $Val extends CollectionBoard>
    implements $CollectionBoardCopyWith<$Res> {
  _$CollectionBoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionBoard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
    Object? collectionId = null,
    Object? selectedSort = freezed,
  }) {
    return _then(
      _value.copyWith(
            identity: null == identity
                ? _value.identity
                : identity // ignore: cast_nullable_to_non_nullable
                      as BoardIdentity,
            collectionId: null == collectionId
                ? _value.collectionId
                : collectionId // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedSort: freezed == selectedSort
                ? _value.selectedSort
                : selectedSort // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CollectionBoard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoardIdentityCopyWith<$Res> get identity {
    return $BoardIdentityCopyWith<$Res>(_value.identity, (value) {
      return _then(_value.copyWith(identity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CollectionBoardImplCopyWith<$Res>
    implements $CollectionBoardCopyWith<$Res> {
  factory _$$CollectionBoardImplCopyWith(
    _$CollectionBoardImpl value,
    $Res Function(_$CollectionBoardImpl) then,
  ) = __$$CollectionBoardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BoardIdentity identity,
    String collectionId,
    String? selectedSort,
  });

  @override
  $BoardIdentityCopyWith<$Res> get identity;
}

/// @nodoc
class __$$CollectionBoardImplCopyWithImpl<$Res>
    extends _$CollectionBoardCopyWithImpl<$Res, _$CollectionBoardImpl>
    implements _$$CollectionBoardImplCopyWith<$Res> {
  __$$CollectionBoardImplCopyWithImpl(
    _$CollectionBoardImpl _value,
    $Res Function(_$CollectionBoardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CollectionBoard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
    Object? collectionId = null,
    Object? selectedSort = freezed,
  }) {
    return _then(
      _$CollectionBoardImpl(
        identity: null == identity
            ? _value.identity
            : identity // ignore: cast_nullable_to_non_nullable
                  as BoardIdentity,
        collectionId: null == collectionId
            ? _value.collectionId
            : collectionId // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedSort: freezed == selectedSort
            ? _value.selectedSort
            : selectedSort // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CollectionBoardImpl implements _CollectionBoard {
  const _$CollectionBoardImpl({
    required this.identity,
    required this.collectionId,
    this.selectedSort,
  });

  @override
  final BoardIdentity identity;
  @override
  final String collectionId;
  @override
  final String? selectedSort;

  @override
  String toString() {
    return 'CollectionBoard(identity: $identity, collectionId: $collectionId, selectedSort: $selectedSort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionBoardImpl &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.selectedSort, selectedSort) ||
                other.selectedSort == selectedSort));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, identity, collectionId, selectedSort);

  /// Create a copy of CollectionBoard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionBoardImplCopyWith<_$CollectionBoardImpl> get copyWith =>
      __$$CollectionBoardImplCopyWithImpl<_$CollectionBoardImpl>(
        this,
        _$identity,
      );
}

abstract class _CollectionBoard implements CollectionBoard {
  const factory _CollectionBoard({
    required final BoardIdentity identity,
    required final String collectionId,
    final String? selectedSort,
  }) = _$CollectionBoardImpl;

  @override
  BoardIdentity get identity;
  @override
  String get collectionId;
  @override
  String? get selectedSort;

  /// Create a copy of CollectionBoard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionBoardImplCopyWith<_$CollectionBoardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
