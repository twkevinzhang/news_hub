import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Repos extends Table {
  TextColumn get icon => text().nullable()();
  TextColumn get baseUrl => text()();
  TextColumn get displayName => text()();
  TextColumn get website => text()();
  TextColumn get signingKeyFingerprint => text()();

  @override
  Set<Column> get primaryKey => {baseUrl};
}

class InstalledExtensions extends Table {
  TextColumn get pkgName => text()();
  TextColumn get displayName => text()();
  IntColumn get version => integer()();
  IntColumn get pythonVersion => integer()();
  TextColumn get lang => text().nullable()();
  BoolColumn get isNsfw => boolean()();

  @override
  Set<Column> get primaryKey => {pkgName};
}

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

  @override
  Set<Column> get primaryKey => {id};
}

class CollectionBoardRefs extends Table {
  TextColumn get collectionId => text().references(Collections, #id)();
  TextColumn get extensionPkgName => text()();
  TextColumn get siteId => text()();
  TextColumn get boardId => text()();
  TextColumn get boardName => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {collectionId, extensionPkgName, siteId, boardId};
}

@singleton
@DriftDatabase(tables: [
  Repos,
  InstalledExtensions,
  Suggestions,
  Collections,
  CollectionBoardRefs,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

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
