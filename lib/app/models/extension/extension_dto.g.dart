// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtensionDtoImpl _$$ExtensionDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'repo_base_url',
      'pkg_name',
      'display_name',
      'zip_name',
      'address',
      'version',
      'python_version',
      'lang',
      'is_nsfw'
    ],
  );
  return _$ExtensionDtoImpl(
    repoBaseUrl: json['repo_base_url'] as String,
    pkgName: json['pkg_name'] as String,
    displayName: json['display_name'] as String,
    zipName: json['zip_name'] as String,
    address: json['address'] as String,
    version: (json['version'] as num).toInt(),
    pythonVersion: (json['python_version'] as num).toInt(),
    lang: json['lang'] as String,
    isNsfw: json['is_nsfw'] as bool,
  );
}

Map<String, dynamic> _$$ExtensionDtoImplToJson(_$ExtensionDtoImpl instance) =>
    <String, dynamic>{
      'repo_base_url': instance.repoBaseUrl,
      'pkg_name': instance.pkgName,
      'display_name': instance.displayName,
      'zip_name': instance.zipName,
      'address': instance.address,
      'version': instance.version,
      'python_version': instance.pythonVersion,
      'lang': instance.lang,
      'is_nsfw': instance.isNsfw,
    };
