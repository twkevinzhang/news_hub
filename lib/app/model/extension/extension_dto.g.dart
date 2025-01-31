// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtensionDtoImpl _$$ExtensionDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'pkg_name',
      'display_name',
      'zip_name',
      'address',
      'version',
      'python_version',
      'lang',
      'is_nsfw',
      'site',
      'boards'
    ],
  );
  return _$ExtensionDtoImpl(
    pkgName: json['pkg_name'] as String,
    displayName: json['display_name'] as String,
    zipName: json['zip_name'] as String,
    address: json['address'] as String,
    version: (json['version'] as num).toInt(),
    pythonVersion: (json['python_version'] as num).toInt(),
    lang: json['lang'] as String,
    isNsfw: json['is_nsfw'] as bool,
    site: SiteDto.fromJson(json['site'] as Map<String, dynamic>),
    boards: (json['boards'] as List<dynamic>)
        .map((e) => BoardDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$ExtensionDtoImplToJson(_$ExtensionDtoImpl instance) =>
    <String, dynamic>{
      'pkg_name': instance.pkgName,
      'display_name': instance.displayName,
      'zip_name': instance.zipName,
      'address': instance.address,
      'version': instance.version,
      'python_version': instance.pythonVersion,
      'lang': instance.lang,
      'is_nsfw': instance.isNsfw,
      'site': instance.site,
      'boards': instance.boards,
    };
