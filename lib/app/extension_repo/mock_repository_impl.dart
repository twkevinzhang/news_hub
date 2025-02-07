import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';

@test
@LazySingleton(as: ExtensionRepoRepository)
class MockExtensionRepoRepositoryImpl implements ExtensionRepoRepository {

  @override
  Future<void> insertRepo({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
  }

  @override
  Future<void> deleteRepo(String baseUrl) async {
  }

  @override
  Future<List<ExtensionRepo>> getAll() async {
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
  Stream<int> getCount() async* {
    yield 1;
  }

  @override
  Future<ExtensionRepo> getRepo(String baseUrl) async {
    return ExtensionRepo(
      icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
      baseUrl: 'https://example.com',
      displayName: 'Example',
      website: 'https://example.com',
      signingKeyFingerprint: 'example',
    );
  }

  @override
  Future<ExtensionRepo> getRepoBySigningKeyFingerprint(String fingerprint) async {
    return ExtensionRepo(
      icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
      baseUrl: 'https://example.com',
      displayName: 'Example',
      website: 'https://example.com',
      signingKeyFingerprint: 'example',
    );
  }

  @override
  Future<void> replaceRepo(ExtensionRepo newRepo) async {

  }

  @override
  Stream<List<ExtensionRepo>> subscribeAll() async* {
    while (true) {
      final repos = await getAll();
      yield repos;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Future<void> upsertRepo({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
  }

  @override
  Future<void> upsertRepoWithObject(ExtensionRepo repo) async {

  }
}
