import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension_repo/index.dart';
import 'package:news_hub/domain/model/index.dart';

// TODO: replace with mocktail library
@LazySingleton(as: ExtensionRepoApiService)
class MockExtensionRepoApiServiceImpl implements ExtensionRepoApiService {
  @override
  Future<ExtensionRepo?> detail(String baseUrl) async {
    return ExtensionRepo(
      baseUrl: 'https://example.com',
      displayName: 'Mock Extension Repo',
      website: 'https://example.com',
      signingKeyFingerprint: "signingKeyFingerprint",
    );
  }

  @override
  Future<List<RemoteExtension>> extensions(String baseUrl) async {
    return [
      RemoteExtension(
        pkgName: 'twkevinzhan_beeceptor',
        displayName: 'beeceptor',
        zipName: 'beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
        iconUrl: '',
        repoUrl: '',
        site: Site(
          extensionPkgName: 'twkevinzhan_beeceptor',
          id: '1',
          name: 'Beeceptor',
          icon: 'beeceptor.png',
          url: 'https://beeceptor.com/',
        ),
        boards: {},
      ),
    ];
  }
}
