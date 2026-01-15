// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      extensionPkgName: json['extensionPkgName'] as String,
      boardId: json['boardId'] as String,
      threadId: json['threadId'] as String,
      postId: json['postId'] as String,
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      contents: (json['contents'] as List<dynamic>)
          .map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
      'boardId': instance.boardId,
      'threadId': instance.threadId,
      'postId': instance.postId,
      'id': instance.id,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'contents': instance.contents,
      'createdAt': instance.createdAt.toIso8601String(),
    };
