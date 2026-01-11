import 'package:news_hub/domain/models/models.dart';

abstract class BoardRepository {
  Future<List<Board>> list(String extensionPkgName);
  Future<Board> getBoard({required String boardId, required String collectionId});
  Future<Map<String, List<String>>> getBoardSortOptions(List<Board> boards);
}
