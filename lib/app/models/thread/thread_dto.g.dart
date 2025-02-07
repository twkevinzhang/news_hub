// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThreadsDtoImpl _$$ThreadsDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['total_page', 'current_page', 'threads'],
  );
  return _$ThreadsDtoImpl(
    totalPage: (json['total_page'] as num).toInt(),
    currentPage: (json['current_page'] as num).toInt(),
    threads: (json['threads'] as List<dynamic>)
        .map((e) => ThreadDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$ThreadsDtoImplToJson(_$ThreadsDtoImpl instance) =>
    <String, dynamic>{
      'total_page': instance.totalPage,
      'current_page': instance.currentPage,
      'threads': instance.threads,
    };

_$ThreadDtoImpl _$$ThreadDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'extension_pkg_name',
      'site_id',
      'board_id',
      'id',
      'url',
      'master_post',
      'last_slave_post_created_at',
      'slave_post_count',
      'tags'
    ],
  );
  return _$ThreadDtoImpl(
    extensionPkgName: json['extension_pkg_name'] as String,
    siteId: json['site_id'] as String,
    boardId: json['board_id'] as String,
    id: json['id'] as String,
    url: json['url'] as String,
    masterPost: PostDto.fromJson(json['master_post'] as Map<String, dynamic>),
    lastSlavePostCreatedAt: (json['last_slave_post_created_at'] as num).toInt(),
    slavePostCount: (json['slave_post_count'] as num).toInt(),
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$$ThreadDtoImplToJson(_$ThreadDtoImpl instance) =>
    <String, dynamic>{
      'extension_pkg_name': instance.extensionPkgName,
      'site_id': instance.siteId,
      'board_id': instance.boardId,
      'id': instance.id,
      'url': instance.url,
      'master_post': instance.masterPost,
      'last_slave_post_created_at': instance.lastSlavePostCreatedAt,
      'slave_post_count': instance.slavePostCount,
      'tags': instance.tags,
    };

_$SlavePostsDtoImpl _$$SlavePostsDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['total_page', 'current_page', 'slave_posts'],
  );
  return _$SlavePostsDtoImpl(
    totalPage: (json['total_page'] as num).toInt(),
    currentPage: json['current_page'] as String,
    slavePosts: (json['slave_posts'] as List<dynamic>)
        .map((e) => PostDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$SlavePostsDtoImplToJson(_$SlavePostsDtoImpl instance) =>
    <String, dynamic>{
      'total_page': instance.totalPage,
      'current_page': instance.currentPage,
      'slave_posts': instance.slavePosts,
    };
