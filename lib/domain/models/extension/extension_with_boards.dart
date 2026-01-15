import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/board/board.dart';

part 'extension_with_boards.freezed.dart';

@freezed
class ExtensionWithBoards with _$ExtensionWithBoards {
  const factory ExtensionWithBoards({
    required String pkgName,
    required String displayName,
    required int version,
    required int pythonVersion,
    String? lang,
    required bool isNsfw,
    required Set<Board> boards,
  }) = _ExtensionWithBoards;
}
