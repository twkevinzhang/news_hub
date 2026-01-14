import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListInstalledExtensions {
  final ExtensionRepository _repository;
  final BoardRepository _boardRepository;

  ListInstalledExtensions({
    required ExtensionRepository repository,
    required BoardRepository boardRepository,
  }) : _repository = repository,
       _boardRepository = boardRepository;

  Future<Result<List<Extension>>> call() async {
    try {
      final list = await _repository.listInstalled();
      return Result.completed(list);
    } catch (e) {
      return Result.error(Failure.fromError(e));
    }
  }

  Future<Result<List<ExtensionWithBoards>>> withBoards() async {
    try {
      final extensionsRes = await call();
      if (extensionsRes is ResultError<List<Extension>>) {
        return Result.error(extensionsRes.error);
      }
      final extensions =
          (extensionsRes as ResultCompleted<List<Extension>>).data;
      final promises = extensions.map((e) async {
        final boards = await _boardRepository.list(e.pkgName);
        return ExtensionWithBoards(
          pkgName: e.pkgName,
          displayName: e.displayName,
          version: e.version,
          pythonVersion: e.pythonVersion,
          lang: e.lang,
          isNsfw: e.isNsfw,
          boards: boards.toSet(),
        );
      });
      final data = await Future.wait(promises);
      return Result.completed(data);
    } catch (e) {
      return Result.error(Failure.fromError(e));
    }
  }
}
