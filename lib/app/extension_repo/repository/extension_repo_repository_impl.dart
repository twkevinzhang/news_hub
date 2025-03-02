import 'package:drift/drift.dart';
import 'package:news_hub/app/extension_repo/repository/models/transform.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/exceptions.dart';

@Environment(AppEnv.demoExtension)
@LazySingleton(as: ExtensionRepoRepository)
class ExtensionRepoRepositoryImpl implements ExtensionRepoRepository {
  final AppDatabase _db;

  ExtensionRepoRepositoryImpl({
    required AppDatabase db,
  }) : _db = db;

  @override
  Future<domain.ExtensionRepo> insert({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    final repo = ExtensionRepo(
      baseUrl: baseUrl,
      displayName: displayName,
      website: website,
      signingKeyFingerprint: signingKeyFingerprint,
    );
    await _db.into(_db.extensionRepos).insert(repo);
    return repo.toDomain();
  }

  @override
  Future<void> delete(String baseUrl) async {
    await (_db.delete(_db.extensionRepos)
          ..where((tbl) => tbl.baseUrl.equals(baseUrl)))
        .go();
  }

  @override
  Future<List<domain.ExtensionRepo>> list() async {
    final repos = await _db.select(_db.extensionRepos).get();
    return repos.map((e) => e.toDomain()).toList();
  }

  @override
  Stream<int> count() {
    return _db.select(_db.extensionRepos).watch().map((repos) => repos.length);
  }

  @override
  Future<domain.ExtensionRepo> get(String baseUrl) async {
    final repo = await (_db.select(_db.extensionRepos)
          ..where((tbl) => tbl.baseUrl.equals(baseUrl)))
        .getSingleOrNull();
    if (repo == null) throw NotFoundException();
    return repo.toDomain();
  }

  @override
  Future<domain.ExtensionRepo> getBySigningKeyFingerprint(
      String fingerprint) async {
    final repo = await (_db.select(_db.extensionRepos)
          ..where((tbl) => tbl.signingKeyFingerprint.equals(fingerprint)))
        .getSingleOrNull();
    if (repo == null) throw NotFoundException();
    return repo.toDomain();
  }

  @override
  Future<void> replace(domain.ExtensionRepo newRepo) async {
    await (_db.update(_db.extensionRepos)
          ..where((tbl) => tbl.baseUrl.equals(newRepo.baseUrl)))
        .write(ExtensionReposCompanion(
      displayName: Value(newRepo.displayName),
      website: Value(newRepo.website),
      signingKeyFingerprint: Value(newRepo.signingKeyFingerprint),
      icon: Value(newRepo.icon),
    ));
  }

  @override
  Stream<List<domain.ExtensionRepo>> subscribeList() {
    return _db
        .select(_db.extensionRepos)
        .watch()
        .map((repos) => repos.map((e) => e.toDomain()).toList());
  }

  @override
  Future<domain.ExtensionRepo> upsert({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    await _db.into(_db.extensionRepos).insertOnConflictUpdate(ExtensionRepo(
          baseUrl: baseUrl,
          displayName: displayName,
          website: website,
          signingKeyFingerprint: signingKeyFingerprint,
        ));
    return get(baseUrl);
  }

  @override
  Future<domain.ExtensionRepo> upsertWithObject(
      domain.ExtensionRepo repo) async {
    return upsert(
      baseUrl: repo.baseUrl,
      displayName: repo.displayName,
      website: repo.website,
      signingKeyFingerprint: repo.signingKeyFingerprint,
    );
  }
}
