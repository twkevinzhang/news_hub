// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteDtoImpl _$$SiteDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['extension_pkg_name', 'id', 'name', 'icon', 'url'],
  );
  return _$SiteDtoImpl(
    extensionPkgName: json['extension_pkg_name'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    icon: json['icon'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$$SiteDtoImplToJson(_$SiteDtoImpl instance) =>
    <String, dynamic>{
      'extension_pkg_name': instance.extensionPkgName,
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'url': instance.url,
    };
