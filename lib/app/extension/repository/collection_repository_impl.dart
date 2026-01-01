import 'package:drift/drift.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/domain/extension/collection_repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:uuid/uuid.dart';
import 'package:rxdart/rxdart.dart';

@Environment(AppEnv.localAdapter)
@Environment(AppEnv.remoteAdapter)
@LazySingleton(as: CollectionRepository)
class CollectionRepositoryImpl implements CollectionRepository {
  final AppDatabase _db;

  CollectionRepositoryImpl({
    required AppDatabase db,
  }) : _db = db;

  @override
  Stream<List<domain.Collection>> watchCollections() {
    return _db.select(_db.collections).watch().switchMap((collections) {
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
                      siteId: r.siteId,
                      id: r.boardId,
                      name: '', // Metadata would need to be fetched separately
                      icon: '',
                      largeWelcomeImage: '',
                      url: '',
                      supportedThreadsSorting: {},
                    ))
                .toList(),
          );
        }).toList();
      });
    });
  }

  @override
  Future<List<domain.Collection>> getCollections() async {
    final collections = await _db.select(_db.collections).get();
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
                  siteId: r.siteId,
                  id: r.boardId,
                  name: '',
                  icon: '',
                  largeWelcomeImage: '',
                  url: '',
                  supportedThreadsSorting: {},
                ))
            .toList(),
      );
    }).toList();
  }

  @override
  Future<void> createCollection(String name, List<domain.Board> boards) async {
    final id = const Uuid().v4();
    await _db.transaction(() async {
      await _db.into(_db.collections).insert(CollectionsCompanion.insert(
            id: id,
            name: name,
          ));

      for (final board in boards) {
        await _db.into(_db.collectionBoardRefs).insert(CollectionBoardRefsCompanion.insert(
              collectionId: id,
              extensionPkgName: board.extensionPkgName,
              siteId: board.siteId,
              boardId: board.id,
            ));
      }
    });
  }

  @override
  Future<void> deleteCollection(String id) async {
    await _db.transaction(() async {
      await (_db.delete(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.equals(id))).go();
      await (_db.delete(_db.collections)..where((tbl) => tbl.id.equals(id))).go();
    });
  }

  @override
  Future<void> updateCollection(domain.Collection collection) async {
    await _db.transaction(() async {
      await (_db.update(_db.collections)..where((tbl) => tbl.id.equals(collection.id))).write(CollectionsCompanion(
        name: Value(collection.name),
      ));

      await (_db.delete(_db.collectionBoardRefs)..where((tbl) => tbl.collectionId.equals(collection.id))).go();

      for (final board in collection.boards) {
        await _db.into(_db.collectionBoardRefs).insert(CollectionBoardRefsCompanion.insert(
              collectionId: collection.id,
              extensionPkgName: board.extensionPkgName,
              siteId: board.siteId,
              boardId: board.id,
            ));
      }
    });
  }
}
