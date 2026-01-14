// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_identity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BoardIdentity {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String get boardName => throw _privateConstructorUsedError;

  /// Create a copy of BoardIdentity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardIdentityCopyWith<BoardIdentity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardIdentityCopyWith<$Res> {
  factory $BoardIdentityCopyWith(
    BoardIdentity value,
    $Res Function(BoardIdentity) then,
  ) = _$BoardIdentityCopyWithImpl<$Res, BoardIdentity>;
  @useResult
  $Res call({String extensionPkgName, String boardId, String boardName});
}

/// @nodoc
class _$BoardIdentityCopyWithImpl<$Res, $Val extends BoardIdentity>
    implements $BoardIdentityCopyWith<$Res> {
  _$BoardIdentityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardIdentity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? boardId = null,
    Object? boardName = null,
  }) {
    return _then(
      _value.copyWith(
            extensionPkgName: null == extensionPkgName
                ? _value.extensionPkgName
                : extensionPkgName // ignore: cast_nullable_to_non_nullable
                      as String,
            boardId: null == boardId
                ? _value.boardId
                : boardId // ignore: cast_nullable_to_non_nullable
                      as String,
            boardName: null == boardName
                ? _value.boardName
                : boardName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BoardIdentityImplCopyWith<$Res>
    implements $BoardIdentityCopyWith<$Res> {
  factory _$$BoardIdentityImplCopyWith(
    _$BoardIdentityImpl value,
    $Res Function(_$BoardIdentityImpl) then,
  ) = __$$BoardIdentityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String extensionPkgName, String boardId, String boardName});
}

/// @nodoc
class __$$BoardIdentityImplCopyWithImpl<$Res>
    extends _$BoardIdentityCopyWithImpl<$Res, _$BoardIdentityImpl>
    implements _$$BoardIdentityImplCopyWith<$Res> {
  __$$BoardIdentityImplCopyWithImpl(
    _$BoardIdentityImpl _value,
    $Res Function(_$BoardIdentityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BoardIdentity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? boardId = null,
    Object? boardName = null,
  }) {
    return _then(
      _$BoardIdentityImpl(
        extensionPkgName: null == extensionPkgName
            ? _value.extensionPkgName
            : extensionPkgName // ignore: cast_nullable_to_non_nullable
                  as String,
        boardId: null == boardId
            ? _value.boardId
            : boardId // ignore: cast_nullable_to_non_nullable
                  as String,
        boardName: null == boardName
            ? _value.boardName
            : boardName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$BoardIdentityImpl implements _BoardIdentity {
  const _$BoardIdentityImpl({
    required this.extensionPkgName,
    required this.boardId,
    required this.boardName,
  });

  @override
  final String extensionPkgName;
  @override
  final String boardId;
  @override
  final String boardName;

  @override
  String toString() {
    return 'BoardIdentity(extensionPkgName: $extensionPkgName, boardId: $boardId, boardName: $boardName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardIdentityImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.boardName, boardName) ||
                other.boardName == boardName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, extensionPkgName, boardId, boardName);

  /// Create a copy of BoardIdentity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardIdentityImplCopyWith<_$BoardIdentityImpl> get copyWith =>
      __$$BoardIdentityImplCopyWithImpl<_$BoardIdentityImpl>(this, _$identity);
}

abstract class _BoardIdentity implements BoardIdentity {
  const factory _BoardIdentity({
    required final String extensionPkgName,
    required final String boardId,
    required final String boardName,
  }) = _$BoardIdentityImpl;

  @override
  String get extensionPkgName;
  @override
  String get boardId;
  @override
  String get boardName;

  /// Create a copy of BoardIdentity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardIdentityImplCopyWith<_$BoardIdentityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
