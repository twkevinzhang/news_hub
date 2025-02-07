import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/models.dart';

import '../post/post_dto.dart';

part 'thread_dto.freezed.dart';
part 'thread_dto.g.dart';

@Freezed(toJson: true)
class ThreadsDto with _$ThreadsDto {
  const factory ThreadsDto({
    @JsonKey(name: 'total_page', required: true)
    required int totalPage,

    @JsonKey(name: 'current_page', required: true)
    required int currentPage,

    @JsonKey(name: 'threads', required: true)
    required List<ThreadDto> threads,
  }) = _ThreadsDto;

  factory ThreadsDto.fromJson(Map<String, Object?> json) =>
      _$ThreadsDtoFromJson(json);
}

@Freezed(toJson: true)
class ThreadDto with _$ThreadDto {
  const factory ThreadDto({
    @JsonKey(name: 'extension_pkg_name', required: true)
    required String extensionPkgName,

    @JsonKey(name: 'site_id', required: true)
    required String siteId,

    @JsonKey(name: 'board_id', required: true)
    required String boardId,

    @JsonKey(name: 'id', required: true)
    required String id,

    @JsonKey(name: 'url', required: true)
    required String url,

    @JsonKey(name: 'master_post', required: true)
    required PostDto masterPost,

    @JsonKey(name: 'last_slave_post_created_at', required: true)
    required int lastSlavePostCreatedAt,

    @JsonKey(name: 'slave_post_count', required: true)
    required int slavePostCount,

    @JsonKey(name: 'tags', required: true)
    required List<String> tags,
  }) = _ThreadDto;

  factory ThreadDto.fromJson(Map<String, Object?> json) =>
      _$ThreadDtoFromJson(json);
}

extension ThreadDtoEx on ThreadDto {
 Thread toThread() {
   return Thread(
     extensionPkgName: extensionPkgName,
     siteId: siteId,
     boardId: boardId,
     id: id,
     url: url,
     masterPost: masterPost.toPost(),
     lastSlavePostCreatedAt: lastSlavePostCreatedAt,
     slavePostCount: slavePostCount,
     tags: tags,
   );
 }
}

@Freezed(toJson: true)
class SlavePostsDto with _$SlavePostsDto {
  const factory SlavePostsDto({
    @JsonKey(name: 'total_page', required: true)
    required int totalPage,

    @JsonKey(name: 'current_page', required: true)
    required String currentPage,

    @JsonKey(name: 'slave_posts', required: true)
    required List<PostDto> slavePosts,
  }) = _SlavePostsDto;

  factory SlavePostsDto.fromJson(Map<String, dynamic> json) =>
      _$SlavePostsDtoFromJson(json);
}
