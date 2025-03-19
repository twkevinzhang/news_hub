import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/constants.dart';

@Environment(AppEnv.mockData)
@LazySingleton(as: ExtensionRepoRepository)
class MockExtensionRepoRepositoryImpl implements ExtensionRepoRepository {
  @override
  Future<void> insert({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String baseUrl) async {
    throw UnimplementedError();
  }

  @override
  Future<List<ExtensionRepo>> list() async {
    return [
      ExtensionRepo(
        icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
        baseUrl: 'https://example.com',
        displayName: 'Example',
        website: 'https://example.com',
        signingKeyFingerprint: 'example',
      ),
    ];
  }

  @override
  Stream<int> count() async* {
    throw UnimplementedError();
  }

  @override
  Future<ExtensionRepo> get(String baseUrl) async {
    return ExtensionRepo(
      icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
      baseUrl: 'https://example.com',
      displayName: 'Example',
      website: 'https://example.com',
      signingKeyFingerprint: 'example',
    );
  }

  @override
  Future<ExtensionRepo> getBySigningKeyFingerprint(String fingerprint) async {
    return ExtensionRepo(
      icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
      baseUrl: 'https://example.com',
      displayName: 'Example',
      website: 'https://example.com',
      signingKeyFingerprint: 'example',
    );
  }

  @override
  Future<void> replace(ExtensionRepo newRepo) async {
    throw UnimplementedError();
  }

  @override
  Stream<List<ExtensionRepo>> subscribeList() async* {
    while (true) {
      final repos = await list();
      yield repos;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Future<ExtensionRepo> upsert({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<ExtensionRepo> upsertWithObject(ExtensionRepo repo) async {
    throw UnimplementedError();
  }
}
