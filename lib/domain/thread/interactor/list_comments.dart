import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListComments {
  final ThreadRepository _threadRepository;

  ListComments({
    required ThreadRepository threadRepository,
  }) : _threadRepository = threadRepository;

  Future<List<Comment>> call({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    required String postId,
    Pagination? pagination,
  }) async {
    return _threadRepository.listComments(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
      pagination: pagination,
    );
  }
}
