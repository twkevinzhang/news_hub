// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_image_post_with_extension.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SingleImagePostWithExtension {
  SingleImagePost get post => throw _privateConstructorUsedError;
  Extension get extension => throw _privateConstructorUsedError;
  Board get board => throw _privateConstructorUsedError;

  /// Create a copy of SingleImagePostWithExtension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleImagePostWithExtensionCopyWith<SingleImagePostWithExtension>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleImagePostWithExtensionCopyWith<$Res> {
  factory $SingleImagePostWithExtensionCopyWith(
    SingleImagePostWithExtension value,
    $Res Function(SingleImagePostWithExtension) then,
  ) =
      _$SingleImagePostWithExtensionCopyWithImpl<
        $Res,
        SingleImagePostWithExtension
      >;
  @useResult
  $Res call({SingleImagePost post, Extension extension, Board board});

  $ExtensionCopyWith<$Res> get extension;
  $BoardCopyWith<$Res> get board;
}

/// @nodoc
class _$SingleImagePostWithExtensionCopyWithImpl<
  $Res,
  $Val extends SingleImagePostWithExtension
>
    implements $SingleImagePostWithExtensionCopyWith<$Res> {
  _$SingleImagePostWithExtensionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleImagePostWithExtension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = freezed,
    Object? extension = null,
    Object? board = null,
  }) {
    return _then(
      _value.copyWith(
            post: freezed == post
                ? _value.post
                : post // ignore: cast_nullable_to_non_nullable
                      as SingleImagePost,
            extension: null == extension
                ? _value.extension
                : extension // ignore: cast_nullable_to_non_nullable
                      as Extension,
            board: null == board
                ? _value.board
                : board // ignore: cast_nullable_to_non_nullable
                      as Board,
          )
          as $Val,
    );
  }

  /// Create a copy of SingleImagePostWithExtension
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExtensionCopyWith<$Res> get extension {
    return $ExtensionCopyWith<$Res>(_value.extension, (value) {
      return _then(_value.copyWith(extension: value) as $Val);
    });
  }

  /// Create a copy of SingleImagePostWithExtension
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoardCopyWith<$Res> get board {
    return $BoardCopyWith<$Res>(_value.board, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingleImagePostWithExtensionImplCopyWith<$Res>
    implements $SingleImagePostWithExtensionCopyWith<$Res> {
  factory _$$SingleImagePostWithExtensionImplCopyWith(
    _$SingleImagePostWithExtensionImpl value,
    $Res Function(_$SingleImagePostWithExtensionImpl) then,
  ) = __$$SingleImagePostWithExtensionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SingleImagePost post, Extension extension, Board board});

  @override
  $ExtensionCopyWith<$Res> get extension;
  @override
  $BoardCopyWith<$Res> get board;
}

/// @nodoc
class __$$SingleImagePostWithExtensionImplCopyWithImpl<$Res>
    extends
        _$SingleImagePostWithExtensionCopyWithImpl<
          $Res,
          _$SingleImagePostWithExtensionImpl
        >
    implements _$$SingleImagePostWithExtensionImplCopyWith<$Res> {
  __$$SingleImagePostWithExtensionImplCopyWithImpl(
    _$SingleImagePostWithExtensionImpl _value,
    $Res Function(_$SingleImagePostWithExtensionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SingleImagePostWithExtension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = freezed,
    Object? extension = null,
    Object? board = null,
  }) {
    return _then(
      _$SingleImagePostWithExtensionImpl(
        post: freezed == post
            ? _value.post
            : post // ignore: cast_nullable_to_non_nullable
                  as SingleImagePost,
        extension: null == extension
            ? _value.extension
            : extension // ignore: cast_nullable_to_non_nullable
                  as Extension,
        board: null == board
            ? _value.board
            : board // ignore: cast_nullable_to_non_nullable
                  as Board,
      ),
    );
  }
}

/// @nodoc

class _$SingleImagePostWithExtensionImpl extends _SingleImagePostWithExtension {
  const _$SingleImagePostWithExtensionImpl({
    required this.post,
    required this.extension,
    required this.board,
  }) : super._();

  @override
  final SingleImagePost post;
  @override
  final Extension extension;
  @override
  final Board board;

  @override
  String toString() {
    return 'SingleImagePostWithExtension(post: $post, extension: $extension, board: $board)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleImagePostWithExtensionImpl &&
            const DeepCollectionEquality().equals(other.post, post) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.board, board) || other.board == board));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(post),
    extension,
    board,
  );

  /// Create a copy of SingleImagePostWithExtension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleImagePostWithExtensionImplCopyWith<
    _$SingleImagePostWithExtensionImpl
  >
  get copyWith =>
      __$$SingleImagePostWithExtensionImplCopyWithImpl<
        _$SingleImagePostWithExtensionImpl
      >(this, _$identity);
}

abstract class _SingleImagePostWithExtension
    extends SingleImagePostWithExtension {
  const factory _SingleImagePostWithExtension({
    required final SingleImagePost post,
    required final Extension extension,
    required final Board board,
  }) = _$SingleImagePostWithExtensionImpl;
  const _SingleImagePostWithExtension._() : super._();

  @override
  SingleImagePost get post;
  @override
  Extension get extension;
  @override
  Board get board;

  /// Create a copy of SingleImagePostWithExtension
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleImagePostWithExtensionImplCopyWith<
    _$SingleImagePostWithExtensionImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
