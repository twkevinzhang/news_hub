import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/thread/interactor/get_original_post.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListReplies {
  final GetInstalledExtension _getInstalledExtension;
  final ApiService _service;

  ListReplies({
    required ApiService apiService,
    required GetInstalledExtension installedRepository,
  })  : _service = apiService,
        _getInstalledExtension = installedRepository;

  Future<List<ArticlePostWithExtension>> call({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  }) async {
    final extensionF = _getInstalledExtension.get(extensionPkgName);
    final boardsF = _service.listBoards(extensionPkgName: extensionPkgName);
    final repliesF = _service.listReplies(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      replyToId: replyToId,
      pagination: pagination,
    );
    final (extension, boards, replies) = await (extensionF, boardsF, repliesF).wait;
    final board = boards.firstWhere((b) => b.id == boardId);

    return replies
        .map((p) => ArticlePostWithExtension(
              post: p as ArticlePost,
              board: board,
              extension: extension,
            ))
        .toList();
  }
}
