import 'package:drift/drift.dart';
import 'package:news_hub/app/extension/repository/models/transform.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/exceptions.dart';
import 'package:uuid/uuid.dart';

@Environment(AppEnv.demoExtension)
@Environment(AppEnv.remoteExtension)
@LazySingleton(as: InstalledExtensionRepository)
class InstalledExtensionRepositoryImpl implements InstalledExtensionRepository {
  final AppDatabase _db;

  InstalledExtensionRepositoryImpl({
    required AppDatabase db,
  }) : _db = db;

  @override
  Future<List<domain.Extension>> list() async {
    final extensions = await _db.select(_db.installedExtensions).get();
    return extensions.map((e) => e.toDomain()).toList();
  }

  @override
  Stream<List<domain.Extension>> stream() {
    return _db
        .select(_db.installedExtensions)
        .watch()
        .map((l) => l.map((e) => e.toDomain()).toList());
  }

  @override
  Future<domain.Extension> get(String pkgName) async {
    final extension = await (_db.select(_db.installedExtensions)
          ..where((tbl) => tbl.pkgName.equals(pkgName)))
        .getSingleOrNull();
    if (extension == null) throw NotFoundException();
    return extension.toDomain();
  }

  @override
  Future<domain.Extension> insert({
    required String repoBaseUrl,
    required String pkgName,
    required String displayName,
    required String zipName,
    required String address,
    required int version,
    required int pythonVersion,
    required String? lang,
    required bool isNsfw,
  }) async {
    final extension = InstalledExtensionsCompanion.insert(
      id: const Uuid().v4(),
      repoBaseUrl: repoBaseUrl,
      pkgName: pkgName,
      displayName: displayName,
      zipName: zipName,
      address: address,
      version: version,
      pythonVersion: pythonVersion,
      lang: Value(lang),
      isNsfw: isNsfw,
    );
    final res =
        await _db.into(_db.installedExtensions).insertReturning(extension);
    return res.toDomain();
  }

  @override
  Future<void> delete(String pkgName) async {
    await (_db.delete(_db.installedExtensions)
          ..where((tbl) => tbl.pkgName.equals(pkgName)))
        .go();
  }

  @override
  Future<domain.Extension> upsert({
    required String repoBaseUrl,
    required String pkgName,
    required String displayName,
    required String zipName,
    required String address,
    required int version,
    required int pythonVersion,
    required String? lang,
    required bool isNsfw,
  }) async {
    final extension = InstalledExtensionsCompanion(
      id: Value(const Uuid().v4()),
      repoBaseUrl: Value(repoBaseUrl),
      pkgName: Value(pkgName),
      displayName: Value(displayName),
      zipName: Value(zipName),
      address: Value(address),
      version: Value(version),
      pythonVersion: Value(pythonVersion),
      lang: Value(lang),
      isNsfw: Value(isNsfw),
    );
    await _db.into(_db.installedExtensions).insertOnConflictUpdate(extension);
    return get(pkgName);
  }
}
