// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtensionRepoDtoImpl _$$ExtensionRepoDtoImplFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'icon',
      'base_url',
      'display_name',
      'website',
      'signing_key_fingerprint'
    ],
  );
  return _$ExtensionRepoDtoImpl(
    icon: json['icon'] as String,
    baseUrl: json['base_url'] as String,
    displayName: json['display_name'] as String,
    website: json['website'] as String,
    signingKeyFingerprint: json['signing_key_fingerprint'] as String,
  );
}

Map<String, dynamic> _$$ExtensionRepoDtoImplToJson(
        _$ExtensionRepoDtoImpl instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'base_url': instance.baseUrl,
      'display_name': instance.displayName,
      'website': instance.website,
      'signing_key_fingerprint': instance.signingKeyFingerprint,
    };
