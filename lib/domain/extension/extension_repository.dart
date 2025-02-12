import 'package:news_hub/domain/models/models.dart';

abstract class ExtensionRepository {
  Future<List<Extension>> list();
  Future<Extension> get(String pkgName);
  Future<Extension> insert({
    required String repoBaseUrl,
    required String pkgName,
    required String displayName,
    required String zipName,
    required String address,
    required int version,
    required int pythonVersion,
    required String? lang,
    required bool isNsfw,
  });
  Future<void> delete(String pkgName);
  Future<Extension> upsert({
    required String repoBaseUrl,
    required String pkgName,
    required String displayName,
    required String zipName,
    required String address,
    required int version,
    required int pythonVersion,
    required String? lang,
    required bool isNsfw,
  });
}
