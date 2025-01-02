// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardDto _$BoardDtoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'extension_pkg_name',
      'site_id',
      'id',
      'name',
      'icon',
      'large_welcome_image',
      'url'
    ],
  );
  return BoardDto(
    json['extension_pkg_name'] as String,
    json['site_id'] as String,
    json['id'] as String,
    json['name'] as String,
    json['icon'] as String,
    json['large_welcome_image'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$BoardDtoToJson(BoardDto instance) => <String, dynamic>{
      'extension_pkg_name': instance.extensionPkgName,
      'site_id': instance.siteId,
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'large_welcome_image': instance.largeWelcomeImage,
      'url': instance.url,
    };

ExtensionDto _$ExtensionDtoFromJson(Map<String, dynamic> json) {
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
  return ExtensionDto(
    json['pkg_name'] as String,
    json['display_name'] as String,
    json['zip_name'] as String,
    json['address'] as String,
    (json['version'] as num).toInt(),
    (json['python_version'] as num).toInt(),
    json['lang'] as String,
    json['is_nsfw'] as bool,
    SiteDto.fromJson(json['site'] as Map<String, dynamic>),
    (json['boards'] as List<dynamic>)
        .map((e) => BoardDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ExtensionDtoToJson(ExtensionDto instance) =>
    <String, dynamic>{
      'pkg_name': instance.pkgName,
      'display_name': instance.displayName,
      'zip_name': instance.zipName,
      'address': instance.address,
      'version': instance.version,
      'python_version': instance.pythonVersion,
      'lang': instance.lang,
      'is_nsfw': instance.isNsfw,
      'site': instance.site.toJson(),
      'boards': instance.boards.map((e) => e.toJson()).toList(),
    };

ImageInfoDto _$ImageInfoDtoFromJson(Map<String, dynamic> json) => ImageInfoDto(
      json['thumb'] as String?,
      json['raw'] as String,
    );

Map<String, dynamic> _$ImageInfoDtoToJson(ImageInfoDto instance) =>
    <String, dynamic>{
      'thumb': instance.thumb,
      'raw': instance.raw,
    };

VideoInfoDto _$VideoInfoDtoFromJson(Map<String, dynamic> json) => VideoInfoDto(
      json['thumb'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$VideoInfoDtoToJson(VideoInfoDto instance) =>
    <String, dynamic>{
      'thumb': instance.thumb,
      'url': instance.url,
    };

TextDto _$TextDtoFromJson(Map<String, dynamic> json) => TextDto(
      json['content'] as String,
    );

Map<String, dynamic> _$TextDtoToJson(TextDto instance) => <String, dynamic>{
      'content': instance.content,
    };

QuoteDto _$QuoteDtoFromJson(Map<String, dynamic> json) => QuoteDto(
      json['content'] as String,
    );

Map<String, dynamic> _$QuoteDtoToJson(QuoteDto instance) => <String, dynamic>{
      'content': instance.content,
    };

ReplyToDto _$ReplyToDtoFromJson(Map<String, dynamic> json) => ReplyToDto(
      json['id'] as String,
    );

Map<String, dynamic> _$ReplyToDtoToJson(ReplyToDto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

LinkDto _$LinkDtoFromJson(Map<String, dynamic> json) => LinkDto(
      json['content'] as String,
    );

Map<String, dynamic> _$LinkDtoToJson(LinkDto instance) => <String, dynamic>{
      'content': instance.content,
    };

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

_$CommentsDtoImpl _$$CommentsDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['total_page', 'current_page', 'comments'],
  );
  return _$CommentsDtoImpl(
    totalPage: (json['total_page'] as num).toInt(),
    currentPage: (json['current_page'] as num).toInt(),
    comments: (json['comments'] as List<dynamic>)
        .map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$CommentsDtoImplToJson(_$CommentsDtoImpl instance) =>
    <String, dynamic>{
      'total_page': instance.totalPage,
      'current_page': instance.currentPage,
      'comments': instance.comments,
    };

_$CommentDtoImpl _$$CommentDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'contents'],
  );
  return _$CommentDtoImpl(
    id: json['id'] as String,
    contents: (json['contents'] as List<dynamic>)
        .map((e) => ParagraphDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$CommentDtoImplToJson(_$CommentDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contents': instance.contents,
    };

_$PostDtoImpl _$$PostDtoImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'extension_pkg_name',
      'site_id',
      'board_id',
      'thread_id',
      'id',
      'master_id',
      'created_at',
      'poster_name',
      'poster_id',
      'like',
      'dislike',
      'comments',
      'contents'
    ],
  );
  return _$PostDtoImpl(
    extensionPkgName: json['extension_pkg_name'] as String,
    siteId: json['site_id'] as String,
    boardId: json['board_id'] as String,
    threadId: json['thread_id'] as String,
    id: json['id'] as String,
    masterId: json['master_id'] as String?,
    title: json['title'] as String?,
    url: json['url'] as String?,
    createdAt: (json['created_at'] as num).toInt(),
    posterName: json['poster_name'] as String,
    posterId: json['poster_id'] as String,
    like: (json['like'] as num).toInt(),
    dislike: (json['dislike'] as num).toInt(),
    comments: (json['comments'] as num).toInt(),
    contents: (json['contents'] as List<dynamic>)
        .map((e) => ParagraphDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$$PostDtoImplToJson(_$PostDtoImpl instance) =>
    <String, dynamic>{
      'extension_pkg_name': instance.extensionPkgName,
      'site_id': instance.siteId,
      'board_id': instance.boardId,
      'thread_id': instance.threadId,
      'id': instance.id,
      'master_id': instance.masterId,
      'title': instance.title,
      'url': instance.url,
      'created_at': instance.createdAt,
      'poster_name': instance.posterName,
      'poster_id': instance.posterId,
      'like': instance.like,
      'dislike': instance.dislike,
      'comments': instance.comments,
      'contents': instance.contents,
    };

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
      'master_post'
    ],
  );
  return _$ThreadDtoImpl(
    extensionPkgName: json['extension_pkg_name'] as String,
    siteId: json['site_id'] as String,
    boardId: json['board_id'] as String,
    id: json['id'] as String,
    url: json['url'] as String,
    masterPost: PostDto.fromJson(json['master_post'] as Map<String, dynamic>),
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
