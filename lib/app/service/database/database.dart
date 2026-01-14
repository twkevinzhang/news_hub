import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Suggestions extends Table {
  TextColumn get id => text()();
  TextColumn get keywords => text()();
  DateTimeColumn get latestUsedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Collections extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class CollectionBoardRefs extends Table {
  TextColumn get collectionId => text().references(Collections, #id)();
  TextColumn get extensionPkgName => text()();
  TextColumn get boardId => text()();
  TextColumn get boardName => text().withDefault(const Constant(''))();
  TextColumn get selectedSort => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {collectionId, extensionPkgName, boardId};
}

@singleton
@DriftDatabase(tables: [Suggestions, Collections, CollectionBoardRefs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(collections);
        await m.createTable(collectionBoardRefs);
      }
      if (from < 3) {
        // repo_base_url was renamed but now removed
      }
      if (from < 4) {
        await m.addColumn(collections, collections.sortOrder);
      }
      if (from < 5) {
        await m.addColumn(
          collectionBoardRefs,
          collectionBoardRefs.selectedSort,
        );
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
