// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SiteDto _$SiteDtoFromJson(Map<String, dynamic> json) {
  return _SiteDto.fromJson(json);
}

/// @nodoc
mixin _$SiteDto {
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', required: true)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', required: true)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon', required: true)
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', required: true)
  String get url => throw _privateConstructorUsedError;

  /// Serializes this SiteDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteDtoCopyWith<SiteDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteDtoCopyWith<$Res> {
  factory $SiteDtoCopyWith(SiteDto value, $Res Function(SiteDto) then) =
      _$SiteDtoCopyWithImpl<$Res, SiteDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'icon', required: true) String icon,
      @JsonKey(name: 'url', required: true) String url});
}

/// @nodoc
class _$SiteDtoCopyWithImpl<$Res, $Val extends SiteDto>
    implements $SiteDtoCopyWith<$Res> {
  _$SiteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiteDtoImplCopyWith<$Res> implements $SiteDtoCopyWith<$Res> {
  factory _$$SiteDtoImplCopyWith(
          _$SiteDtoImpl value, $Res Function(_$SiteDtoImpl) then) =
      __$$SiteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'icon', required: true) String icon,
      @JsonKey(name: 'url', required: true) String url});
}

/// @nodoc
class __$$SiteDtoImplCopyWithImpl<$Res>
    extends _$SiteDtoCopyWithImpl<$Res, _$SiteDtoImpl>
    implements _$$SiteDtoImplCopyWith<$Res> {
  __$$SiteDtoImplCopyWithImpl(
      _$SiteDtoImpl _value, $Res Function(_$SiteDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? url = null,
  }) {
    return _then(_$SiteDtoImpl(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteDtoImpl implements _SiteDto {
  const _$SiteDtoImpl(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      required this.extensionPkgName,
      @JsonKey(name: 'id', required: true) required this.id,
      @JsonKey(name: 'name', required: true) required this.name,
      @JsonKey(name: 'icon', required: true) required this.icon,
      @JsonKey(name: 'url', required: true) required this.url});

  factory _$SiteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteDtoImplFromJson(json);

  @override
  @JsonKey(name: 'extension_pkg_name', required: true)
  final String extensionPkgName;
  @override
  @JsonKey(name: 'id', required: true)
  final String id;
  @override
  @JsonKey(name: 'name', required: true)
  final String name;
  @override
  @JsonKey(name: 'icon', required: true)
  final String icon;
  @override
  @JsonKey(name: 'url', required: true)
  final String url;

  @override
  String toString() {
    return 'SiteDto(extensionPkgName: $extensionPkgName, id: $id, name: $name, icon: $icon, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteDtoImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, extensionPkgName, id, name, icon, url);

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteDtoImplCopyWith<_$SiteDtoImpl> get copyWith =>
      __$$SiteDtoImplCopyWithImpl<_$SiteDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteDtoImplToJson(
      this,
    );
  }
}

abstract class _SiteDto implements SiteDto {
  const factory _SiteDto(
          {@JsonKey(name: 'extension_pkg_name', required: true)
          required final String extensionPkgName,
          @JsonKey(name: 'id', required: true) required final String id,
          @JsonKey(name: 'name', required: true) required final String name,
          @JsonKey(name: 'icon', required: true) required final String icon,
          @JsonKey(name: 'url', required: true) required final String url}) =
      _$SiteDtoImpl;

  factory _SiteDto.fromJson(Map<String, dynamic> json) = _$SiteDtoImpl.fromJson;

  @override
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName;
  @override
  @JsonKey(name: 'id', required: true)
  String get id;
  @override
  @JsonKey(name: 'name', required: true)
  String get name;
  @override
  @JsonKey(name: 'icon', required: true)
  String get icon;
  @override
  @JsonKey(name: 'url', required: true)
  String get url;

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteDtoImplCopyWith<_$SiteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
