import 'package:news_hub/domain/models/thread/post/single_image_post_with_extension.dart';

class BoardDataChunk {
  final String boardId;
  final List<SingleImagePostWithExtension> threads;
  final bool isLoading;
  final String? error;

  const BoardDataChunk({
    required this.boardId,
    this.threads = const [],
    this.isLoading = false,
    this.error,
  });
}
