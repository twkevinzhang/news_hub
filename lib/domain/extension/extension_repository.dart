import 'package:news_hub/domain/models/models.dart';

abstract class InstalledExtensionRepository {
  Future<List<Extension>> list();
  Stream<List<Extension>> stream();
  Future<Extension> get(String pkgName);
  Future<Extension> insert({
    required String repoBaseUrl,
    required String pkgName,
    required String displayName,
    required String zipName,
    required int version,
    required int pythonVersion,
    required String? lang,
    required bool isNsfw,
  });
  Future<Extension> insertByModel(Extension ex);
  Future<void> delete(String pkgName);
  Future<Extension> upsert({
    required String repoBaseUrl,
    required String pkgName,
    required String displayName,
    required String zipName,
    required int version,
    required int pythonVersion,
    required String? lang,
    required bool isNsfw,
  });
}
