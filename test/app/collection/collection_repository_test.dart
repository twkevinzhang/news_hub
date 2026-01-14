import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_hub/app/collection/collection_repository_impl.dart';
import 'package:news_hub/app/service/database/database.dart';
import '../../helpers/test_data_factory.dart';

void main() {
  late AppDatabase db;
  late CollectionRepositoryImpl repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repository = CollectionRepositoryImpl(db: db);
  });

  tearDown(() async {
    await db.close();
  });

  group('CollectionRepositoryImpl', () {
    test('create adds a collection and its boards', () async {
      final board = TestDataFactory.createCollectionBoard();
      const collectionName = 'New Collection';

      await repository.create(collectionName, [board]);

      final collections = await repository.list();
      expect(collections.length, 1);
      expect(collections.first.name, collectionName);
      expect(collections.first.boards.length, 1);
      expect(
        collections.first.boards.first.identity.boardId,
        board.identity.boardId,
      );
      // expect(collections.first.boards.first.selectedSort, board.selectedSort ?? '');
    });

    test('delete removes collection and refs', () async {
      final board = TestDataFactory.createCollectionBoard();
      await repository.create('To Delete', [board]);
      final collections = await repository.list();
      final id = collections.first.id;

      await repository.delete(id);

      final remaining = await repository.list();
      expect(remaining, isEmpty);

      // Verify refs are gone directly from DB
      final refs = await db.select(db.collectionBoardRefs).get();
      expect(refs, isEmpty);
    });

    test('update modifies collection and replaces boards', () async {
      final board1 = TestDataFactory.createCollectionBoard(
        identity: TestDataFactory.createBoardIdentity(boardId: 'b1'),
      );
      await repository.create('Original', [board1]);
      var collections = await repository.list();
      var collection = collections.first;

      final board2 = TestDataFactory.createCollectionBoard(
        identity: TestDataFactory.createBoardIdentity(boardId: 'b2'),
      );
      final updatedCollection = TestDataFactory.createCollection(
        id: collection.id,
        name: 'Updated',
        boards: [board2],
      );

      await repository.update(updatedCollection);

      collections = await repository.list();
      collection = collections.first;

      expect(collection.name, 'Updated');
      expect(collection.boards.length, 1);
      expect(collection.boards.first.identity.boardId, 'b2');
    });
  });
}
