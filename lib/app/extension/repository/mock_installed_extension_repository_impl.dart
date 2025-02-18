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
  @override
  Future<void> delete(String pkgName) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<domain.Extension> get(String pkgName) {
    return Future.value(
      domain.Extension(
        repoBaseUrl:
        'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
        pkgName: 'twkevinzhang_beeceptor',
        displayName: 'Komica Ex',
        zipName: 'twkevinzhang_beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
      ),
    );
  }

  @override
  Future<domain.Extension> insert({required String repoBaseUrl, required String pkgName, required String displayName, required String zipName, required String address, required int version, required int pythonVersion, required String? lang, required bool isNsfw}) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<List<domain.Extension>> list() {
    return Future.value([
      domain.Extension(
        repoBaseUrl:
        'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
        pkgName: 'twkevinzhang_beeceptor',
        displayName: 'Komica Ex',
        zipName: 'twkevinzhang_beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
      ),
    ]);
  }

  @override
  Stream<List<domain.Extension>> stream() async* {
    yield [
      domain.Extension(
        repoBaseUrl:
        'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
        pkgName: 'twkevinzhang_beeceptor',
        displayName: 'Komica Ex',
        zipName: 'twkevinzhang_beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
      )
    ];
  }

  @override
  Future<domain.Extension> upsert({required String repoBaseUrl, required String pkgName, required String displayName, required String zipName, required String address, required int version, required int pythonVersion, required String? lang, required bool isNsfw}) {
    // TODO: implement upsert
    throw UnimplementedError();
  }
  
}