// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticlePostImpl _$$ArticlePostImplFromJson(Map<String, dynamic> json) =>
    _$ArticlePostImpl(
      extensionPkgName: json['extensionPkgName'] as String,
      boardId: json['boardId'] as String,
      threadId: json['threadId'] as String,
      id: json['id'] as String,
      title: json['title'] as String?,
      url: json['url'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      liked: (json['liked'] as num?)?.toInt(),
      disliked: (json['disliked'] as num?)?.toInt(),
      contents: (json['contents'] as List<dynamic>)
          .map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestReplyCreatedAt: json['latestReplyCreatedAt'] == null
          ? null
          : DateTime.parse(json['latestReplyCreatedAt'] as String),
      repliesCount: (json['repliesCount'] as num?)?.toInt(),
      top5Comments: (json['top5Comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ArticlePostImplToJson(_$ArticlePostImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
      'boardId': instance.boardId,
      'threadId': instance.threadId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'createdAt': instance.createdAt.toIso8601String(),
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'liked': instance.liked,
      'disliked': instance.disliked,
      'contents': instance.contents,
      'latestReplyCreatedAt': instance.latestReplyCreatedAt?.toIso8601String(),
      'repliesCount': instance.repliesCount,
      'top5Comments': instance.top5Comments,
      'tags': instance.tags,
      'runtimeType': instance.$type,
    };

_$SingleImagePostImpl _$$SingleImagePostImplFromJson(
  Map<String, dynamic> json,
) => _$SingleImagePostImpl(
  extensionPkgName: json['extensionPkgName'] as String,
  boardId: json['boardId'] as String,
  threadId: json['threadId'] as String,
  id: json['id'] as String,
  title: json['title'] as String?,
  url: json['url'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  authorId: json['authorId'] as String,
  authorName: json['authorName'] as String,
  liked: (json['liked'] as num?)?.toInt(),
  disliked: (json['disliked'] as num?)?.toInt(),
  contents: (json['contents'] as List<dynamic>)
      .map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
      .toList(),
  latestReplyCreatedAt: json['latestReplyCreatedAt'] == null
      ? null
      : DateTime.parse(json['latestReplyCreatedAt'] as String),
  repliesCount: (json['repliesCount'] as num?)?.toInt(),
  top5Comments: (json['top5Comments'] as List<dynamic>?)
      ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
      .toList(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  image: json['image'] == null
      ? null
      : ImageParagraph.fromJson(json['image'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$SingleImagePostImplToJson(
  _$SingleImagePostImpl instance,
) => <String, dynamic>{
  'extensionPkgName': instance.extensionPkgName,
  'boardId': instance.boardId,
  'threadId': instance.threadId,
  'id': instance.id,
  'title': instance.title,
  'url': instance.url,
  'createdAt': instance.createdAt.toIso8601String(),
  'authorId': instance.authorId,
  'authorName': instance.authorName,
  'liked': instance.liked,
  'disliked': instance.disliked,
  'contents': instance.contents,
  'latestReplyCreatedAt': instance.latestReplyCreatedAt?.toIso8601String(),
  'repliesCount': instance.repliesCount,
  'top5Comments': instance.top5Comments,
  'tags': instance.tags,
  'image': instance.image,
  'runtimeType': instance.$type,
};
