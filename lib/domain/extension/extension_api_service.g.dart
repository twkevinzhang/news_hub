// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_api_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$GetSiteParamsImplToJson(_$GetSiteParamsImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
    };

Map<String, dynamic> _$$GetBoardsParamsImplToJson(
        _$GetBoardsParamsImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
      'siteId': instance.siteId,
      'pagination': instance.pagination,
    };

Map<String, dynamic> _$$GetThreadInfosParamsImplToJson(
        _$GetThreadInfosParamsImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
      'siteId': instance.siteId,
      'boardId': instance.boardId,
      'pagination': instance.pagination,
      'sortBy': instance.sortBy,
      'keywords': instance.keywords,
    };

Map<String, dynamic> _$$GetThreadParamsImplToJson(
        _$GetThreadParamsImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
      'siteId': instance.siteId,
      'boardId': instance.boardId,
      'id': instance.id,
      'postId': instance.postId,
    };

Map<String, dynamic> _$$GetRegardingPostsParamsImplToJson(
        _$GetRegardingPostsParamsImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
      'siteId': instance.siteId,
      'boardId': instance.boardId,
      'threadId': instance.threadId,
      'postId': instance.postId,
      'pagination': instance.pagination,
    };

Map<String, dynamic> _$$GetPostParamsImplToJson(_$GetPostParamsImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
      'siteId': instance.siteId,
      'boardId': instance.boardId,
      'threadId': instance.threadId,
      'id': instance.id,
    };

Map<String, dynamic> _$$GetCommentsParamsImplToJson(
        _$GetCommentsParamsImpl instance) =>
    <String, dynamic>{
      'extensionPkgName': instance.extensionPkgName,
      'siteId': instance.siteId,
      'boardId': instance.boardId,
      'threadId': instance.threadId,
      'postId': instance.postId,
      'pagination': instance.pagination,
    };
