// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailResDtoImpl _$$DetailResDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'name',
      'path',
      'sha',
      'size',
      'url',
      'html_url',
      'git_url',
      'download_url',
      'type',
      'content',
      'encoding',
      '_links'
    ],
  );
  return _$DetailResDtoImpl(
    name: json['name'] as String,
    path: json['path'] as String,
    sha: json['sha'] as String,
    size: (json['size'] as num).toInt(),
    url: json['url'] as String,
    htmlUrl: json['html_url'] as String,
    gitUrl: json['git_url'] as String,
    downloadUrl: json['download_url'] as String,
    type: json['type'] as String,
    content: json['content'] as String,
    encoding: json['encoding'] as String,
    links: Links.fromJson(json['_links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$$DetailResDtoImplToJson(_$DetailResDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'sha': instance.sha,
      'size': instance.size,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'git_url': instance.gitUrl,
      'download_url': instance.downloadUrl,
      'type': instance.type,
      'content': instance.content,
      'encoding': instance.encoding,
      '_links': instance.links,
    };

_$LinksImpl _$$LinksImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['self', 'git', 'html'],
  );
  return _$LinksImpl(
    self: json['self'] as String,
    git: json['git'] as String,
    html: json['html'] as String,
  );
}

Map<String, dynamic> _$$LinksImplToJson(_$LinksImpl instance) =>
    <String, dynamic>{
      'self': instance.self,
      'git': instance.git,
      'html': instance.html,
    };
