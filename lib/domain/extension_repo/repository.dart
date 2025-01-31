import 'package:news_hub/domain/model/index.dart';

abstract class ExtensionRepoRepository {
  Stream<List<ExtensionRepo>> subscribeAll();

  Future<List<ExtensionRepo>> getAll();

  Future<ExtensionRepo?> getRepo(String baseUrl);

  Future<ExtensionRepo?> getRepoBySigningKeyFingerprint(String fingerprint);

  Stream<int> getCount();

  Future<void> insertRepo({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  });

  Future<void> upsertRepo({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  });

  Future<void> upsertRepoWithObject(ExtensionRepo repo) {
    return upsertRepo(
      baseUrl: repo.baseUrl,
      displayName: repo.displayName,
      website: repo.website,
      signingKeyFingerprint: repo.signingKeyFingerprint,
    );
  }

  Future<void> replaceRepo(ExtensionRepo newRepo);

  Future<void> deleteRepo(String baseUrl);
}