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
        return collections.map((c) {
          final boardRefs = refs.where((r) => r.collectionId == c.id).toList();
          return domain.Collection(
            id: c.id,
            name: c.name,
            boards: boardRefs
                .map((r) => domain.Board(
                      extensionPkgName: r.extensionPkgName,
                      id: r.boardId,
                      name: r.boardName,
                      icon: '',
                      largeWelcomeImage: '',
                      url: '',
                      supportedThreadsSorting: {},
                      selectedThreadsSorting: r.selectedSort,
                    ))
                .toList(),
          );
        }).toList();
      });
    });
  }

  @override
  Future<List<domain.Collection>> list() async {
    final collections = await (_db.select(_db.collections)..orderBy([(t) => OrderingTerm(expression: t.sortOrder)])).get();
    if (collections.isEmpty) return [];

    final collectionIds = collections.map((c) => c.id).toList();
    final refs = await (_db.select(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.isIn(collectionIds))).get();

    return collections.map((c) {
      final boardRefs = refs.where((r) => r.collectionId == c.id).toList();
      return domain.Collection(
        id: c.id,
        name: c.name,
        boards: boardRefs
            .map((r) => domain.Board(
                  extensionPkgName: r.extensionPkgName,
                  id: r.boardId,
                  name: r.boardName,
                  icon: '',
                  largeWelcomeImage: '',
                  url: '',
                  supportedThreadsSorting: {},
                  selectedThreadsSorting: r.selectedSort,
                ))
            .toList(),
      );
    }).toList();
  }

  @override
  Future<void> create(String name, List<domain.Board> boards) async {
    final id = const Uuid().v4();
    await _db.transaction(() async {
      // Get max sortOrder to append at the end
      final maxSortOrderFunc = _db.collections.sortOrder.max();
      final query = _db.selectOnly(_db.collections)..addColumns([maxSortOrderFunc]);
      final result = await query.getSingle();
      final maxSortOrder = result.read(maxSortOrderFunc) ?? 0;

      await _db.into(_db.collections).insert(CollectionsCompanion.insert(
            id: id,
            name: name,
            sortOrder: Value(maxSortOrder + 1),
          ));

      for (final board in boards) {
        await _db.into(_db.collectionBoardRefs).insert(CollectionBoardRefsCompanion.insert(
              collectionId: id,
              extensionPkgName: board.extensionPkgName,
              boardId: board.id,
              boardName: Value(board.name),
              selectedSort: Value(board.selectedThreadsSorting ?? ''),
            ));
      }
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

      for (final board in collection.boards) {
        await _db.into(_db.collectionBoardRefs).insert(CollectionBoardRefsCompanion.insert(
              collectionId: collection.id,
              extensionPkgName: board.extensionPkgName,
              boardId: board.id,
              boardName: Value(board.name),
              selectedSort: Value(board.selectedThreadsSorting ?? ''),
            ));
      }
    });
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
