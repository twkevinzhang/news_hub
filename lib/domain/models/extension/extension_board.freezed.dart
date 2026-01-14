// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExtensionBoard {
  BoardIdentity get identity => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get largeWelcomeImage => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  Set<String> get sortOptions => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionBoard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionBoardCopyWith<ExtensionBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionBoardCopyWith<$Res> {
  factory $ExtensionBoardCopyWith(
    ExtensionBoard value,
    $Res Function(ExtensionBoard) then,
  ) = _$ExtensionBoardCopyWithImpl<$Res, ExtensionBoard>;
  @useResult
  $Res call({
    BoardIdentity identity,
    String icon,
    String largeWelcomeImage,
    String url,
    Set<String> sortOptions,
  });

  $BoardIdentityCopyWith<$Res> get identity;
}

/// @nodoc
class _$ExtensionBoardCopyWithImpl<$Res, $Val extends ExtensionBoard>
    implements $ExtensionBoardCopyWith<$Res> {
  _$ExtensionBoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionBoard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
    Object? icon = null,
    Object? largeWelcomeImage = null,
    Object? url = null,
    Object? sortOptions = null,
  }) {
    return _then(
      _value.copyWith(
            identity: null == identity
                ? _value.identity
                : identity // ignore: cast_nullable_to_non_nullable
                      as BoardIdentity,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            largeWelcomeImage: null == largeWelcomeImage
                ? _value.largeWelcomeImage
                : largeWelcomeImage // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            sortOptions: null == sortOptions
                ? _value.sortOptions
                : sortOptions // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
          )
          as $Val,
    );
  }

  /// Create a copy of ExtensionBoard
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
abstract class _$$ExtensionBoardImplCopyWith<$Res>
    implements $ExtensionBoardCopyWith<$Res> {
  factory _$$ExtensionBoardImplCopyWith(
    _$ExtensionBoardImpl value,
    $Res Function(_$ExtensionBoardImpl) then,
  ) = __$$ExtensionBoardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BoardIdentity identity,
    String icon,
    String largeWelcomeImage,
    String url,
    Set<String> sortOptions,
  });

  @override
  $BoardIdentityCopyWith<$Res> get identity;
}

/// @nodoc
class __$$ExtensionBoardImplCopyWithImpl<$Res>
    extends _$ExtensionBoardCopyWithImpl<$Res, _$ExtensionBoardImpl>
    implements _$$ExtensionBoardImplCopyWith<$Res> {
  __$$ExtensionBoardImplCopyWithImpl(
    _$ExtensionBoardImpl _value,
    $Res Function(_$ExtensionBoardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExtensionBoard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
    Object? icon = null,
    Object? largeWelcomeImage = null,
    Object? url = null,
    Object? sortOptions = null,
  }) {
    return _then(
      _$ExtensionBoardImpl(
        identity: null == identity
            ? _value.identity
            : identity // ignore: cast_nullable_to_non_nullable
                  as BoardIdentity,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        largeWelcomeImage: null == largeWelcomeImage
            ? _value.largeWelcomeImage
            : largeWelcomeImage // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOptions: null == sortOptions
            ? _value._sortOptions
            : sortOptions // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
      ),
    );
  }
}

/// @nodoc

class _$ExtensionBoardImpl implements _ExtensionBoard {
  const _$ExtensionBoardImpl({
    required this.identity,
    required this.icon,
    required this.largeWelcomeImage,
    required this.url,
    required final Set<String> sortOptions,
  }) : _sortOptions = sortOptions;

  @override
  final BoardIdentity identity;
  @override
  final String icon;
  @override
  final String largeWelcomeImage;
  @override
  final String url;
  final Set<String> _sortOptions;
  @override
  Set<String> get sortOptions {
    if (_sortOptions is EqualUnmodifiableSetView) return _sortOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_sortOptions);
  }

  @override
  String toString() {
    return 'ExtensionBoard(identity: $identity, icon: $icon, largeWelcomeImage: $largeWelcomeImage, url: $url, sortOptions: $sortOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionBoardImpl &&
            (identical(other.identity, identity) ||
                other.identity == identity) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.largeWelcomeImage, largeWelcomeImage) ||
                other.largeWelcomeImage == largeWelcomeImage) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(
              other._sortOptions,
              _sortOptions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    identity,
    icon,
    largeWelcomeImage,
    url,
    const DeepCollectionEquality().hash(_sortOptions),
  );

  /// Create a copy of ExtensionBoard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionBoardImplCopyWith<_$ExtensionBoardImpl> get copyWith =>
      __$$ExtensionBoardImplCopyWithImpl<_$ExtensionBoardImpl>(
        this,
        _$identity,
      );
}

abstract class _ExtensionBoard implements ExtensionBoard {
  const factory _ExtensionBoard({
    required final BoardIdentity identity,
    required final String icon,
    required final String largeWelcomeImage,
    required final String url,
    required final Set<String> sortOptions,
  }) = _$ExtensionBoardImpl;

  @override
  BoardIdentity get identity;
  @override
  String get icon;
  @override
  String get largeWelcomeImage;
  @override
  String get url;
  @override
  Set<String> get sortOptions;

  /// Create a copy of ExtensionBoard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionBoardImplCopyWith<_$ExtensionBoardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
