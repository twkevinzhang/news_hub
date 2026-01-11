import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListCollectionThreads {
  final CollectionRepository _collectionRepository;
  final ThreadRepository _repository;

  ListCollectionThreads({
    required ThreadRepository repository,
    required CollectionRepository collectionRepository,
  })  : _repository = repository,
        _collectionRepository = collectionRepository;

  Future<List<SingleImagePostWithExtension>> call({
    required String collectionId,
    Pagination? pagination,
    ThreadsFilter? filter,
  }) async {
    final collections = await _collectionRepository.list();
    final collection = collections.firstWhere((c) => c.id == collectionId);

    final List<Future<List<Post>>> tasks = [];

    for (final b in collection.boards) {
      tasks.add(_repository.listThreads(
        extensionPkgName: b.extensionPkgName,
        boardId: b.id,
        sort: b.selectedSort,
        pagination: pagination,
        keywords: filter?.keywords,
      ));
    }

    final threads = (await Future.wait(tasks)).flatten();

    return threads.map((t) {
      final b = collection.boards.firstWhere((b) => b.id == t.boardId);
      return SingleImagePostWithExtension(
        post: t as SingleImagePost,
        board: b,
        extension: Extension(
          pkgName: b.extensionPkgName,
          displayName: '',
          version: 0,
          pythonVersion: 0,
          isNsfw: false,
        ),
      );
    }).toList();
  }
}

class SingleImagePostWithExtension extends SingleImagePost {
  final Extension extension;
  final Board board;

  SingleImagePostWithExtension({
    required SingleImagePost post,
    required this.extension,
    required this.board,
  }) : super(
          extensionPkgName: post.extensionPkgName,
          boardId: post.boardId,
          threadId: post.threadId,
          id: post.id,
          title: post.title,
          url: post.url,
          createdAt: post.createdAt,
          authorId: post.authorId,
          authorName: post.authorName,
          liked: post.liked,
          disliked: post.disliked,
          image: post.image,
          contents: post.contents,
          tags: post.tags,
          latestReplyCreatedAt: post.latestReplyCreatedAt,
          repliesCount: post.repliesCount,
        );
}
