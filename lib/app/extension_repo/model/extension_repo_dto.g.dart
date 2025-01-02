// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtensionRepoDto _$ExtensionRepoDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'base_url',
      'name',
      'website',
      'signing_key_fingerprint'
    ],
  );
  return ExtensionRepoDto(
    json['base_url'] as String,
    json['name'] as String,
    json['website'] as String,
    json['signing_key_fingerprint'] as String,
  );
}

Map<String, dynamic> _$ExtensionRepoDtoToJson(ExtensionRepoDto instance) =>
    <String, dynamic>{
      'base_url': instance.baseUrl,
      'name': instance.name,
      'website': instance.website,
      'signing_key_fingerprint': instance.signingKeyFingerprint,
    };

ExtensionDto _$ExtensionDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'name',
      'zip_name',
      'address',
      'version_name',
      'version_code',
      'lib_version',
      'lang',
      'is_nsfw'
    ],
  );
  return ExtensionDto(
    json['name'] as String,
    json['zip_name'] as String,
    json['address'] as String,
    json['version_name'] as String,
    (json['version_code'] as num).toInt(),
    (json['lib_version'] as num).toDouble(),
    json['lang'] as String,
    json['is_nsfw'] as bool,
  );
}

Map<String, dynamic> _$ExtensionDtoToJson(ExtensionDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'zip_name': instance.zipName,
      'address': instance.address,
      'version_name': instance.versionName,
      'version_code': instance.versionCode,
      'lib_version': instance.libVersion,
      'lang': instance.lang,
      'is_nsfw': instance.isNsfw,
    };

_$ExtensionRepoResDtoImpl _$$ExtensionRepoResDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ExtensionRepoResDtoImpl(
      meta: ExtensionRepoDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExtensionRepoResDtoImplToJson(
        _$ExtensionRepoResDtoImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
    };
