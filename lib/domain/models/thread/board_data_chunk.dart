import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/thread/post/single_image_post_with_extension.dart';

part 'board_data_chunk.freezed.dart';

@freezed
class BoardDataChunk with _$BoardDataChunk {
  const factory BoardDataChunk({
    required String boardId,
    @Default([]) List<SingleImagePostWithExtension> threads,
    @Default(false) bool isLoading,
    String? error,
  }) = _BoardDataChunk;
}
