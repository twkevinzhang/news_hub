import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class SearchThreads {
  final ListInstalledExtensions _listInstalledExtensions;
  final ThreadRepository _repository;

  SearchThreads({
    required ThreadRepository repository,
    required ListInstalledExtensions listInstalledExtensions,
  }) : _repository = repository,
       _listInstalledExtensions = listInstalledExtensions;

  Future<Result<List<SingleImagePostWithExtension>>> call({
    Pagination? pagination,
    ThreadsFilter? filter,
    ThreadsSorting? sorting,
  }) async {
    try {
      final extensionsRes = await _listInstalledExtensions.withBoards();
      if (extensionsRes is ResultError<List<ExtensionWithBoards>>) {
        return Result.error(extensionsRes.exception);
      }
      final extensions =
          (extensionsRes as ResultCompleted<List<ExtensionWithBoards>>).data;

      final boardSorts = filter?.boardSorts ?? {};
      final List<Future<List<Post>>> tasks = [];

      for (final e in extensions) {
        final extensionBoardIds = e.boards.map((b) => b.id).toSet();
        final targetBoardSorts = boardSorts.entries.where(
          (entry) => extensionBoardIds.contains(entry.key),
        );

        if (targetBoardSorts.isEmpty) {
          if (filter?.keywords != null && filter!.keywords.isNotEmpty) {
            tasks.add(
              _repository.listThreads(
                extensionPkgName: e.pkgName,
                boardId: '',
                pagination: pagination,
                keywords: filter.keywords,
              ),
            );
          }
        } else {
          for (final entry in targetBoardSorts) {
            tasks.add(
              _repository.listThreads(
                extensionPkgName: e.pkgName,
                boardId: entry.key,
                sort: entry.value,
                pagination: pagination,
                keywords: filter?.keywords,
              ),
            );
          }
        }
      }

      final threads = (await Future.wait(tasks)).flatten();

      final data = threads.map((t) {
        final e = extensions.firstWhere((e) => e.pkgName == t.extensionPkgName);
        final b = e.boards.firstWhere((b) => b.id == t.boardId);
        return SingleImagePostWithExtension(
          post: t as SingleImagePost,
          board: b,
          extension: e,
        );
      }).toList();
      return Result.completed(data);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}
