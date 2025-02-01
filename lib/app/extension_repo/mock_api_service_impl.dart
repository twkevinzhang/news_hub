import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension_repo/index.dart';
import 'package:news_hub/domain/model/index.dart';

// TODO: replace with mocktail library
@LazySingleton(as: ExtensionRepoApiService)
class MockExtensionRepoApiServiceImpl implements ExtensionRepoApiService {
  @override
  Future<ExtensionRepo> detail(String baseUrl) async {
    return ExtensionRepo(
      icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
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
        repoBaseUrl: 'github.com/twkevinzhang/news_hub/beeceptor',
        pkgName: 'twkevinzhang_beeceptor',
        displayName: 'Beeceptor Ex',
        zipName: 'beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
        iconUrl: '',
        repoUrl: '',
        site: Site(
          extensionPkgName: 'twkevinzhang_beeceptor',
          id: '1',
          name: 'Beeceptor',
          icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
          url: 'https://beeceptor.com/',
        ),
        boards: {},
      ),
    ];
  }

  @override
  Future<String> zipUrl(Extension extension) {
    return Future.value('https://example.com/beeceptor.zip');
  }
}
