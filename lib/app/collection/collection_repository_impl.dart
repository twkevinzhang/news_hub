import 'package:drift/drift.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: CollectionRepository)
class CollectionRepositoryImpl implements CollectionRepository {
  final AppDatabase _db;

  CollectionRepositoryImpl({
    required AppDatabase db,
  }) : _db = db;

  @override
  Stream<List<domain.Collection>> watchList() {
    return (_db.select(_db.collections)..orderBy([(t) => OrderingTerm(expression: t.sortOrder)])).watch().switchMap((collections) {
      if (collections.isEmpty) return Stream.value([]);

      final collectionIds = collections.map((c) => c.id).toList();
      return (_db.select(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.isIn(collectionIds))).watch().map((refs) {
        return collections.map((c) => _mapToCollection(c, refs.where((r) => r.collectionId == c.id).toList())).toList();
      });
    });
  }

  @override
  Future<List<domain.Collection>> list() async {
    final collections = await (_db.select(_db.collections)..orderBy([(t) => OrderingTerm(expression: t.sortOrder)])).get();
    if (collections.isEmpty) return [];

    final collectionIds = collections.map((c) => c.id).toList();
    final refs = await (_db.select(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.isIn(collectionIds))).get();

    return collections.map((c) => _mapToCollection(c, refs.where((r) => r.collectionId == c.id).toList())).toList();
  }

  @override
  Future<domain.Collection> get(String id) async {
    final collection = await (_db.select(_db.collections)..where((tbl) => tbl.id.equals(id))).getSingle();
    final boardRefs = await (_db.select(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.equals(id))).get();

    return _mapToCollection(collection, boardRefs);
  }

  domain.Collection _mapToCollection(Collection data, List<CollectionBoardRef> boardRefs) {
    return domain.Collection(
      id: data.id,
      name: data.name,
      boards: boardRefs
          .map((r) => domain.CollectionBoard(
                identity: domain.BoardIdentity(
                  extensionPkgName: r.extensionPkgName,
                  boardId: r.boardId,
                  boardName: r.boardName,
                ),
                collectionId: data.id,
                selectedSort: r.selectedSort,
              ))
          .toList(),
    );
  }

  @override
  Future<void> create(String name, List<domain.CollectionBoard> boards) async {
    final id = const Uuid().v4();
    await _db.transaction(() async {
      final maxSortOrderFunc = _db.collections.sortOrder.max();
      final query = _db.selectOnly(_db.collections)..addColumns([maxSortOrderFunc]);
      final result = await query.getSingle();
      final maxSortOrder = result.read(maxSortOrderFunc) ?? 0;

      await _db.into(_db.collections).insert(CollectionsCompanion.insert(
            id: id,
            name: name,
            sortOrder: Value(maxSortOrder + 1),
          ));

      await _insertBoards(id, boards);
    });
  }

  @override
  Future<void> delete(String id) async {
    await _db.transaction(() async {
      await (_db.delete(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.equals(id))).go();
      await (_db.delete(_db.collections)..where((tbl) => tbl.id.equals(id))).go();
    });
  }

  @override
  Future<void> update(domain.Collection collection) async {
    await _db.transaction(() async {
      await (_db.update(_db.collections)..where((tbl) => tbl.id.equals(collection.id))).write(CollectionsCompanion(
        name: Value(collection.name),
      ));

      await (_db.delete(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.equals(collection.id))).go();
      await _insertBoards(collection.id, collection.boards);
    });
  }

  Future<void> _insertBoards(String collectionId, List<domain.CollectionBoard> boards) async {
    for (final board in boards) {
      await _db.into(_db.collectionBoardRefs).insert(CollectionBoardRefsCompanion.insert(
            collectionId: collectionId,
            extensionPkgName: board.identity.extensionPkgName,
            boardId: board.identity.boardId,
            boardName: Value(board.identity.boardName),
            selectedSort: Value(board.selectedSort ?? ''),
          ));
    }
  }

  @override
  Future<void> reorder(List<String> ids) async {
    await _db.transaction(() async {
      for (int i = 0; i < ids.length; i++) {
        await (_db.update(_db.collections)..where((tbl) => tbl.id.equals(ids[i]))).write(CollectionsCompanion(
          sortOrder: Value(i),
        ));
      }
    });
  }
}
