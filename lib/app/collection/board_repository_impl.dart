import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/api/api_service.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@LazySingleton(as: BoardRepository)
class BoardRepositoryImpl implements BoardRepository {
  final ApiService _apiService;
  final AppDatabase _db;

  BoardRepositoryImpl(this._apiService, this._db);

  @override
  Future<List<Board>> list(String extensionPkgName) {
    return _apiService.listBoards(extensionPkgName: extensionPkgName);
  }

  @override
  Future<Board> getBoard({required String boardId, required String collectionId}) async {
    final query = _db.select(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.equals(collectionId) & tbl.boardId.equals(boardId));
    final ref = await query.getSingleOrNull();

    if (ref == null) {
      throw Exception('在收藏夾 $collectionId 中找不到看板 $boardId');
    }

    return Board(
      extensionPkgName: ref.extensionPkgName,
      id: ref.boardId,
      name: ref.boardName,
      icon: '',
      largeWelcomeImage: '',
      url: '',
      sortOptions: {},
      selectedSort: ref.selectedSort,
      collectionId: collectionId,
    );
  }

  @override
  Future<Map<String, List<String>>> getBoardSortOptions(List<Board> boards) {
    return _apiService.getBoardSortOptions(boards: boards);
  }
}
