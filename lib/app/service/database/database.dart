import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

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
  TextColumn get id => text()();
  TextColumn get repoBaseUrl => text()();
  TextColumn get pkgName => text()();
  TextColumn get displayName => text()();
  TextColumn get zipName => text()();
  TextColumn get address => text()();
  IntColumn get version => integer()();
  IntColumn get pythonVersion => integer()();
  TextColumn get lang => text().nullable()();
  BoolColumn get isNsfw => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}

@lazySingleton
@DriftDatabase(tables: [ExtensionRepos, InstalledExtensions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'news_hub',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationDocumentsDirectory,
      ),
    );
  }
}
