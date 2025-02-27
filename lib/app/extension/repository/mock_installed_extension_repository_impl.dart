import 'package:drift/drift.dart';
import 'package:news_hub/app/extension/repository/models/transform.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/exceptions.dart';
import 'package:uuid/uuid.dart';

@test
@LazySingleton(as: InstalledExtensionRepository)
class MockInstalledExtensionRepositoryImpl implements InstalledExtensionRepository {
  final List<domain.Extension> _extensions = [
    domain.Extension(
      repoBaseUrl: 'https://github.com/twkevinzhang/news_hub_extensions',
      pkgName: 'twkevinzhang_beeceptor',
      displayName: 'Beeceptor',
      zipName: 'twkevinzhang_beeceptor.zip',
      address: 'example',
      version: 1,
      pythonVersion: 3,
      lang: 'en',
      isNsfw: false,
    ),
  ];

  @override
  Future<void> delete(String pkgName) async {
    _extensions.removeWhere((extension) => extension.pkgName == pkgName);
  }

  @override
  Future<domain.Extension> get(String pkgName) async {
    return _extensions.firstWhere((extension) => extension.pkgName == pkgName, orElse: () => throw NotFoundException());
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
    final extension = domain.Extension(
      repoBaseUrl: repoBaseUrl,
      pkgName: pkgName,
      displayName: displayName,
      zipName: zipName,
      address: address,
      version: version,
      pythonVersion: pythonVersion,
      lang: lang,
      isNsfw: isNsfw,
    );
    _extensions.add(extension);
    return extension;
  }

  @override
  Future<List<domain.Extension>> list() async {
    return _extensions;
  }

  @override
  Stream<List<domain.Extension>> stream() {
    return Stream.value(_extensions);
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
    try {
      await delete(pkgName);
    } catch (e, s) {
      // Ignore if not found
    }
    return insert(
      repoBaseUrl: repoBaseUrl,
      pkgName: pkgName,
      displayName: displayName,
      zipName: zipName,
      address: address,
      version: version,
      pythonVersion: pythonVersion,
      lang: lang,
      isNsfw: isNsfw,
    );
  }
}
