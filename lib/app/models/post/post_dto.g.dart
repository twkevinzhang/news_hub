// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
