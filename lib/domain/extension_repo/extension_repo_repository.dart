import 'package:news_hub/domain/models/models.dart';

abstract class ExtensionRepoRepository {
  Stream<List<ExtensionRepo>> subscribeList();

  Future<List<ExtensionRepo>> list();

  Future<ExtensionRepo> get(String baseUrl);

  Future<ExtensionRepo> getBySigningKeyFingerprint(String fingerprint);

  Stream<int> count();

  Future<void> insert({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  });

  Future<ExtensionRepo> upsert({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  });

  Future<ExtensionRepo> upsertWithObject(ExtensionRepo repo) {
    return upsert(
      baseUrl: repo.baseUrl,
      displayName: repo.displayName,
      website: repo.website,
      signingKeyFingerprint: repo.signingKeyFingerprint,
    );
  }

  Future<void> replace(ExtensionRepo newRepo);

  Future<void> delete(String baseUrl);
}