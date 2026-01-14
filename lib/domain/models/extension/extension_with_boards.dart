import 'package:news_hub/domain/models/extension/extension.dart';
import 'package:news_hub/domain/models/board/board.dart';

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
