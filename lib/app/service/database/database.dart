import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class ExtensionRepos extends Table {
  TextColumn get icon => text().nullable()();
  TextColumn get baseUrl => text()();
  TextColumn get displayName => text()();
  TextColumn get website => text()();
  TextColumn get signingKeyFingerprint => text()();

  @override
  Set<Column> get primaryKey => {baseUrl};
}

class InstalledExtensions extends Table {
  TextColumn get repoBaseUrl => text()();
  TextColumn get pkgName => text()();
  TextColumn get displayName => text()();
  TextColumn get zipName => text()();
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

@singleton
@DriftDatabase(tables: [ExtensionRepos, InstalledExtensions, Suggestions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
