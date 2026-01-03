import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class AddExtensionRepo {
  final ExtensionRepoRepository _repo;
  AddExtensionRepo(this._repo);

  Future<void> call({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
    String? icon,
  }) {
    return _repo.insert(ExtensionRepo(
      baseUrl: baseUrl,
      displayName: displayName,
      website: website,
      signingKeyFingerprint: signingKeyFingerprint,
      icon: icon,
    ));
  }
}
