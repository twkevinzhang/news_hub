// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardsDtoImpl _$$BoardsDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['total_page', 'current_page', 'boards'],
  );
  return _$BoardsDtoImpl(
    totalPage: (json['total_page'] as num).toInt(),
    currentPage: (json['current_page'] as num).toInt(),
    boards: (json['boards'] as List<dynamic>)
        .map((e) => BoardDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$BoardsDtoImplToJson(_$BoardsDtoImpl instance) =>
    <String, dynamic>{
      'total_page': instance.totalPage,
      'current_page': instance.currentPage,
      'boards': instance.boards,
    };

_$BoardDtoImpl _$$BoardDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'extension_pkg_name',
      'site_id',
      'id',
      'name',
      'icon',
      'large_welcome_image',
      'url',
      'supported_sorting'
    ],
  );
  return _$BoardDtoImpl(
    extensionPkgName: json['extension_pkg_name'] as String,
    siteId: json['site_id'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    icon: json['icon'] as String,
    largeWelcomeImage: json['large_welcome_image'] as String,
    url: json['url'] as String,
    supportedThreadsSorting: (json['supported_sorting'] as List<dynamic>)
        .map((e) => e as String)
        .toSet(),
  );
}

Map<String, dynamic> _$$BoardDtoImplToJson(_$BoardDtoImpl instance) =>
    <String, dynamic>{
      'extension_pkg_name': instance.extensionPkgName,
      'site_id': instance.siteId,
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'large_welcome_image': instance.largeWelcomeImage,
      'url': instance.url,
      'supported_sorting': instance.supportedThreadsSorting.toList(),
    };
