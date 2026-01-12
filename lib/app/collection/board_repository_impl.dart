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
      throw Exception('Board $boardId not found in collection $collectionId');
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
  Future<CollectionBoard> getCollectionBoard({required String boardId, required String collectionId}) async {
    final query = _db.select(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.equals(collectionId) & tbl.boardId.equals(boardId));
    final ref = await query.getSingleOrNull();

    if (ref == null) {
      throw Exception('Board $boardId not found in collection $collectionId');
    }

    return CollectionBoard(
      identity: BoardIdentity(extensionPkgName: ref.extensionPkgName, boardId: ref.boardId, boardName: ref.boardName),
      selectedSort: ref.selectedSort,
      collectionId: collectionId,
    );
  }

  @override
  Future<Map<String, List<String>>> getBoardSortOptions(List<Board> boards) {
    return _apiService.getBoardSortOptions(boards: boards);
  }
}
