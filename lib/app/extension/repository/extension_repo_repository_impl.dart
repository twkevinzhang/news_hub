import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

@LazySingleton(as: ExtensionRepoRepository)
class ExtensionRepoRepositoryImpl implements ExtensionRepoRepository {
  final AppDatabase _db;

  ExtensionRepoRepositoryImpl(this._db);

  @override
  Future<List<domain.ExtensionRepo>> list() async {
    final rows = await _db.select(_db.extensionRepos).get();
    return rows.map((row) => _toDomain(row)).toList();
  }

  @override
  Stream<List<domain.ExtensionRepo>> stream() {
    return _db.select(_db.extensionRepos).watch().map(
          (rows) => rows.map((row) => _toDomain(row)).toList(),
        );
  }

  @override
  Future<void> insert(domain.ExtensionRepo repo) {
    return _db.into(_db.extensionRepos).insertOnConflictUpdate(
          ExtensionReposCompanion.insert(
            baseUrl: repo.baseUrl,
            displayName: repo.displayName,
            website: repo.website,
            signingKeyFingerprint: repo.signingKeyFingerprint,
            icon: Value(repo.icon),
          ),
        );
  }

  @override
  Future<void> delete(String baseUrl) {
    return (_db.delete(_db.extensionRepos)..where((t) => t.baseUrl.equals(baseUrl))).go();
  }

  domain.ExtensionRepo _toDomain(ExtensionRepo row) {
    return domain.ExtensionRepo(
      baseUrl: row.baseUrl,
      displayName: row.displayName,
      website: row.website,
      signingKeyFingerprint: row.signingKeyFingerprint,
      icon: row.icon,
    );
  }
}
