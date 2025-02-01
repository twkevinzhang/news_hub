// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExtensionDto _$ExtensionDtoFromJson(Map<String, dynamic> json) {
  return _ExtensionDto.fromJson(json);
}

/// @nodoc
mixin _$ExtensionDto {
  @JsonKey(name: 'repo_base_url', required: true)
  String get repoBaseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'pkg_name', required: true)
  String get pkgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name', required: true)
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'zip_name', required: true)
  String get zipName => throw _privateConstructorUsedError;
  @JsonKey(name: 'address', required: true)
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'version', required: true)
  int get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'python_version', required: true)
  int get pythonVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'lang', required: true)
  String get lang => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_nsfw', required: true)
  bool get isNsfw => throw _privateConstructorUsedError;
  @JsonKey(name: 'site', required: true)
  SiteDto get site => throw _privateConstructorUsedError;
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards => throw _privateConstructorUsedError;

  /// Serializes this ExtensionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionDtoCopyWith<ExtensionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionDtoCopyWith<$Res> {
  factory $ExtensionDtoCopyWith(
          ExtensionDto value, $Res Function(ExtensionDto) then) =
      _$ExtensionDtoCopyWithImpl<$Res, ExtensionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'repo_base_url', required: true) String repoBaseUrl,
      @JsonKey(name: 'pkg_name', required: true) String pkgName,
      @JsonKey(name: 'display_name', required: true) String displayName,
      @JsonKey(name: 'zip_name', required: true) String zipName,
      @JsonKey(name: 'address', required: true) String address,
      @JsonKey(name: 'version', required: true) int version,
      @JsonKey(name: 'python_version', required: true) int pythonVersion,
      @JsonKey(name: 'lang', required: true) String lang,
      @JsonKey(name: 'is_nsfw', required: true) bool isNsfw,
      @JsonKey(name: 'site', required: true) SiteDto site,
      @JsonKey(name: 'boards', required: true) List<BoardDto> boards});

  $SiteDtoCopyWith<$Res> get site;
}

/// @nodoc
class _$ExtensionDtoCopyWithImpl<$Res, $Val extends ExtensionDto>
    implements $ExtensionDtoCopyWith<$Res> {
  _$ExtensionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repoBaseUrl = null,
    Object? pkgName = null,
    Object? displayName = null,
    Object? zipName = null,
    Object? address = null,
    Object? version = null,
    Object? pythonVersion = null,
    Object? lang = null,
    Object? isNsfw = null,
    Object? site = null,
    Object? boards = null,
  }) {
    return _then(_value.copyWith(
      repoBaseUrl: null == repoBaseUrl
          ? _value.repoBaseUrl
          : repoBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pkgName: null == pkgName
          ? _value.pkgName
          : pkgName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      zipName: null == zipName
          ? _value.zipName
          : zipName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      pythonVersion: null == pythonVersion
          ? _value.pythonVersion
          : pythonVersion // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      isNsfw: null == isNsfw
          ? _value.isNsfw
          : isNsfw // ignore: cast_nullable_to_non_nullable
              as bool,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as SiteDto,
      boards: null == boards
          ? _value.boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<BoardDto>,
    ) as $Val);
  }

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SiteDtoCopyWith<$Res> get site {
    return $SiteDtoCopyWith<$Res>(_value.site, (value) {
      return _then(_value.copyWith(site: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtensionDtoImplCopyWith<$Res>
    implements $ExtensionDtoCopyWith<$Res> {
  factory _$$ExtensionDtoImplCopyWith(
          _$ExtensionDtoImpl value, $Res Function(_$ExtensionDtoImpl) then) =
      __$$ExtensionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'repo_base_url', required: true) String repoBaseUrl,
      @JsonKey(name: 'pkg_name', required: true) String pkgName,
      @JsonKey(name: 'display_name', required: true) String displayName,
      @JsonKey(name: 'zip_name', required: true) String zipName,
      @JsonKey(name: 'address', required: true) String address,
      @JsonKey(name: 'version', required: true) int version,
      @JsonKey(name: 'python_version', required: true) int pythonVersion,
      @JsonKey(name: 'lang', required: true) String lang,
      @JsonKey(name: 'is_nsfw', required: true) bool isNsfw,
      @JsonKey(name: 'site', required: true) SiteDto site,
      @JsonKey(name: 'boards', required: true) List<BoardDto> boards});

  @override
  $SiteDtoCopyWith<$Res> get site;
}

/// @nodoc
class __$$ExtensionDtoImplCopyWithImpl<$Res>
    extends _$ExtensionDtoCopyWithImpl<$Res, _$ExtensionDtoImpl>
    implements _$$ExtensionDtoImplCopyWith<$Res> {
  __$$ExtensionDtoImplCopyWithImpl(
      _$ExtensionDtoImpl _value, $Res Function(_$ExtensionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repoBaseUrl = null,
    Object? pkgName = null,
    Object? displayName = null,
    Object? zipName = null,
    Object? address = null,
    Object? version = null,
    Object? pythonVersion = null,
    Object? lang = null,
    Object? isNsfw = null,
    Object? site = null,
    Object? boards = null,
  }) {
    return _then(_$ExtensionDtoImpl(
      repoBaseUrl: null == repoBaseUrl
          ? _value.repoBaseUrl
          : repoBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pkgName: null == pkgName
          ? _value.pkgName
          : pkgName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      zipName: null == zipName
          ? _value.zipName
          : zipName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      pythonVersion: null == pythonVersion
          ? _value.pythonVersion
          : pythonVersion // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      isNsfw: null == isNsfw
          ? _value.isNsfw
          : isNsfw // ignore: cast_nullable_to_non_nullable
              as bool,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as SiteDto,
      boards: null == boards
          ? _value._boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<BoardDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionDtoImpl implements _ExtensionDto {
  const _$ExtensionDtoImpl(
      {@JsonKey(name: 'repo_base_url', required: true)
      required this.repoBaseUrl,
      @JsonKey(name: 'pkg_name', required: true) required this.pkgName,
      @JsonKey(name: 'display_name', required: true) required this.displayName,
      @JsonKey(name: 'zip_name', required: true) required this.zipName,
      @JsonKey(name: 'address', required: true) required this.address,
      @JsonKey(name: 'version', required: true) required this.version,
      @JsonKey(name: 'python_version', required: true)
      required this.pythonVersion,
      @JsonKey(name: 'lang', required: true) required this.lang,
      @JsonKey(name: 'is_nsfw', required: true) required this.isNsfw,
      @JsonKey(name: 'site', required: true) required this.site,
      @JsonKey(name: 'boards', required: true)
      required final List<BoardDto> boards})
      : _boards = boards;

  factory _$ExtensionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionDtoImplFromJson(json);

  @override
  @JsonKey(name: 'repo_base_url', required: true)
  final String repoBaseUrl;
  @override
  @JsonKey(name: 'pkg_name', required: true)
  final String pkgName;
  @override
  @JsonKey(name: 'display_name', required: true)
  final String displayName;
  @override
  @JsonKey(name: 'zip_name', required: true)
  final String zipName;
  @override
  @JsonKey(name: 'address', required: true)
  final String address;
  @override
  @JsonKey(name: 'version', required: true)
  final int version;
  @override
  @JsonKey(name: 'python_version', required: true)
  final int pythonVersion;
  @override
  @JsonKey(name: 'lang', required: true)
  final String lang;
  @override
  @JsonKey(name: 'is_nsfw', required: true)
  final bool isNsfw;
  @override
  @JsonKey(name: 'site', required: true)
  final SiteDto site;
  final List<BoardDto> _boards;
  @override
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards {
    if (_boards is EqualUnmodifiableListView) return _boards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boards);
  }

  @override
  String toString() {
    return 'ExtensionDto(repoBaseUrl: $repoBaseUrl, pkgName: $pkgName, displayName: $displayName, zipName: $zipName, address: $address, version: $version, pythonVersion: $pythonVersion, lang: $lang, isNsfw: $isNsfw, site: $site, boards: $boards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionDtoImpl &&
            (identical(other.repoBaseUrl, repoBaseUrl) ||
                other.repoBaseUrl == repoBaseUrl) &&
            (identical(other.pkgName, pkgName) || other.pkgName == pkgName) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.zipName, zipName) || other.zipName == zipName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.pythonVersion, pythonVersion) ||
                other.pythonVersion == pythonVersion) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw) &&
            (identical(other.site, site) || other.site == site) &&
            const DeepCollectionEquality().equals(other._boards, _boards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      repoBaseUrl,
      pkgName,
      displayName,
      zipName,
      address,
      version,
      pythonVersion,
      lang,
      isNsfw,
      site,
      const DeepCollectionEquality().hash(_boards));

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionDtoImplCopyWith<_$ExtensionDtoImpl> get copyWith =>
      __$$ExtensionDtoImplCopyWithImpl<_$ExtensionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionDtoImplToJson(
      this,
    );
  }
}

abstract class _ExtensionDto implements ExtensionDto {
  const factory _ExtensionDto(
      {@JsonKey(name: 'repo_base_url', required: true)
      required final String repoBaseUrl,
      @JsonKey(name: 'pkg_name', required: true) required final String pkgName,
      @JsonKey(name: 'display_name', required: true)
      required final String displayName,
      @JsonKey(name: 'zip_name', required: true) required final String zipName,
      @JsonKey(name: 'address', required: true) required final String address,
      @JsonKey(name: 'version', required: true) required final int version,
      @JsonKey(name: 'python_version', required: true)
      required final int pythonVersion,
      @JsonKey(name: 'lang', required: true) required final String lang,
      @JsonKey(name: 'is_nsfw', required: true) required final bool isNsfw,
      @JsonKey(name: 'site', required: true) required final SiteDto site,
      @JsonKey(name: 'boards', required: true)
      required final List<BoardDto> boards}) = _$ExtensionDtoImpl;

  factory _ExtensionDto.fromJson(Map<String, dynamic> json) =
      _$ExtensionDtoImpl.fromJson;

  @override
  @JsonKey(name: 'repo_base_url', required: true)
  String get repoBaseUrl;
  @override
  @JsonKey(name: 'pkg_name', required: true)
  String get pkgName;
  @override
  @JsonKey(name: 'display_name', required: true)
  String get displayName;
  @override
  @JsonKey(name: 'zip_name', required: true)
  String get zipName;
  @override
  @JsonKey(name: 'address', required: true)
  String get address;
  @override
  @JsonKey(name: 'version', required: true)
  int get version;
  @override
  @JsonKey(name: 'python_version', required: true)
  int get pythonVersion;
  @override
  @JsonKey(name: 'lang', required: true)
  String get lang;
  @override
  @JsonKey(name: 'is_nsfw', required: true)
  bool get isNsfw;
  @override
  @JsonKey(name: 'site', required: true)
  SiteDto get site;
  @override
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards;

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionDtoImplCopyWith<_$ExtensionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
