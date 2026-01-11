import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListInstalledExtensions {
  final ExtensionRepository _repository;
  final BoardRepository _boardRepository;

  ListInstalledExtensions({
    required ExtensionRepository repository,
    required BoardRepository boardRepository,
  })  : _repository = repository,
        _boardRepository = boardRepository;

  Future<List<Extension>> call() {
    return _repository.listInstalled();
  }

  Future<List<ExtensionWithBoards>> withBoards() async {
    final extensions = await call();
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
    return await Future.wait(promises);
  }
}

class ExtensionWithBoards extends Extension {
  final Set<Board> boards;
  ExtensionWithBoards({
    required super.pkgName,
    required super.displayName,
    required super.version,
    required super.pythonVersion,
    required super.lang,
    required super.isNsfw,
    required this.boards,
  });
}
