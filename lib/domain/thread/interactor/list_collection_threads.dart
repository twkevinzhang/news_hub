import 'dart:async';
import 'package:collection/collection.dart';
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

  Stream<List<SingleImagePostWithExtension>> call({
    required String collectionId,
    Pagination? pagination,
    ThreadsFilter? filter,
  }) async* {
    final collections = await _collectionRepository.list();
    final collection = collections.firstWhereOrNull((c) => c.id == collectionId);
    if (collection == null) return;

    final allThreads = <SingleImagePostWithExtension>[];
    final controller = StreamController<List<SingleImagePostWithExtension>>();
    int completedTasks = 0;

    if (collection.boards.isEmpty) {
      yield [];
      return;
    }

    for (final b in collection.boards) {
      _repository
          .listThreads(
        extensionPkgName: b.identity.extensionPkgName,
        boardId: b.identity.boardId,
        sort: b.selectedSort,
        pagination: pagination,
        keywords: filter?.keywords,
      )
          .then((rawThreads) {
        final results = rawThreads.map((t) {
          // TODO: 未來需要重構 SingleImagePostWithExtension 使用 CollectionBoard
          final tempBoard = Board(
            extensionPkgName: b.identity.extensionPkgName,
            id: b.identity.boardId,
            name: b.identity.boardName,
            icon: '',
            largeWelcomeImage: '',
            url: '',
            sortOptions: {},
            selectedSort: b.selectedSort,
            collectionId: b.collectionId,
          );
          return SingleImagePostWithExtension(
            post: t as SingleImagePost,
            board: tempBoard,
            extension: Extension(
              pkgName: b.identity.extensionPkgName,
              displayName: '',
              version: 0,
              pythonVersion: 0,
              isNsfw: false,
            ),
          );
        }).toList();

        if (results.isNotEmpty) {
          allThreads.addAll(results);
          controller.add(List.from(allThreads));
        }
      }).catchError((e) {
        // Silent error
      }).whenComplete(() {
        completedTasks++;
        if (completedTasks == collection.boards.length) {
          controller.close();
        }
      });
    }

    yield* controller.stream;
  }
}
