// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Extension _$ExtensionFromJson(Map<String, dynamic> json) {
  return _Extension.fromJson(json);
}

/// @nodoc
mixin _$Extension {
  String get pkgName => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  int get pythonVersion => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  bool get isNsfw => throw _privateConstructorUsedError;

  /// Serializes this Extension to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Extension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionCopyWith<Extension> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionCopyWith<$Res> {
  factory $ExtensionCopyWith(Extension value, $Res Function(Extension) then) =
      _$ExtensionCopyWithImpl<$Res, Extension>;
  @useResult
  $Res call({
    String pkgName,
    String displayName,
    int version,
    int pythonVersion,
    String? lang,
    bool isNsfw,
  });
}

/// @nodoc
class _$ExtensionCopyWithImpl<$Res, $Val extends Extension>
    implements $ExtensionCopyWith<$Res> {
  _$ExtensionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Extension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pkgName = null,
    Object? displayName = null,
    Object? version = null,
    Object? pythonVersion = null,
    Object? lang = freezed,
    Object? isNsfw = null,
  }) {
    return _then(
      _value.copyWith(
            pkgName: null == pkgName
                ? _value.pkgName
                : pkgName // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as int,
            pythonVersion: null == pythonVersion
                ? _value.pythonVersion
                : pythonVersion // ignore: cast_nullable_to_non_nullable
                      as int,
            lang: freezed == lang
                ? _value.lang
                : lang // ignore: cast_nullable_to_non_nullable
                      as String?,
            isNsfw: null == isNsfw
                ? _value.isNsfw
                : isNsfw // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExtensionImplCopyWith<$Res>
    implements $ExtensionCopyWith<$Res> {
  factory _$$ExtensionImplCopyWith(
    _$ExtensionImpl value,
    $Res Function(_$ExtensionImpl) then,
  ) = __$$ExtensionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String pkgName,
    String displayName,
    int version,
    int pythonVersion,
    String? lang,
    bool isNsfw,
  });
}

/// @nodoc
class __$$ExtensionImplCopyWithImpl<$Res>
    extends _$ExtensionCopyWithImpl<$Res, _$ExtensionImpl>
    implements _$$ExtensionImplCopyWith<$Res> {
  __$$ExtensionImplCopyWithImpl(
    _$ExtensionImpl _value,
    $Res Function(_$ExtensionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Extension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pkgName = null,
    Object? displayName = null,
    Object? version = null,
    Object? pythonVersion = null,
    Object? lang = freezed,
    Object? isNsfw = null,
  }) {
    return _then(
      _$ExtensionImpl(
        pkgName: null == pkgName
            ? _value.pkgName
            : pkgName // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as int,
        pythonVersion: null == pythonVersion
            ? _value.pythonVersion
            : pythonVersion // ignore: cast_nullable_to_non_nullable
                  as int,
        lang: freezed == lang
            ? _value.lang
            : lang // ignore: cast_nullable_to_non_nullable
                  as String?,
        isNsfw: null == isNsfw
            ? _value.isNsfw
            : isNsfw // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionImpl implements _Extension {
  const _$ExtensionImpl({
    required this.pkgName,
    required this.displayName,
    required this.version,
    required this.pythonVersion,
    this.lang,
    required this.isNsfw,
  });

  factory _$ExtensionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionImplFromJson(json);

  @override
  final String pkgName;
  @override
  final String displayName;
  @override
  final int version;
  @override
  final int pythonVersion;
  @override
  final String? lang;
  @override
  final bool isNsfw;

  @override
  String toString() {
    return 'Extension(pkgName: $pkgName, displayName: $displayName, version: $version, pythonVersion: $pythonVersion, lang: $lang, isNsfw: $isNsfw)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionImpl &&
            (identical(other.pkgName, pkgName) || other.pkgName == pkgName) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.pythonVersion, pythonVersion) ||
                other.pythonVersion == pythonVersion) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    pkgName,
    displayName,
    version,
    pythonVersion,
    lang,
    isNsfw,
  );

  /// Create a copy of Extension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionImplCopyWith<_$ExtensionImpl> get copyWith =>
      __$$ExtensionImplCopyWithImpl<_$ExtensionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionImplToJson(this);
  }
}

abstract class _Extension implements Extension {
  const factory _Extension({
    required final String pkgName,
    required final String displayName,
    required final int version,
    required final int pythonVersion,
    final String? lang,
    required final bool isNsfw,
  }) = _$ExtensionImpl;

  factory _Extension.fromJson(Map<String, dynamic> json) =
      _$ExtensionImpl.fromJson;

  @override
  String get pkgName;
  @override
  String get displayName;
  @override
  int get version;
  @override
  int get pythonVersion;
  @override
  String? get lang;
  @override
  bool get isNsfw;

  /// Create a copy of Extension
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionImplCopyWith<_$ExtensionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
