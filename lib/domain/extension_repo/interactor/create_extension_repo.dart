import 'package:news_hub/domain/extension_repo/extension_repo_api_service.dart';
import 'package:news_hub/domain/extension_repo/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/exceptions.dart';


@lazySingleton
class CreateExtensionRepo {
    CreateExtensionRepo({
        required ExtensionRepoRepository repository,
        required ExtensionRepoApiService service,
    })  : _repository = repository,
            _service = service;

    final ExtensionRepoRepository _repository;
    final ExtensionRepoApiService _service;

    Future<void> call(String baseUrl) async {
        try {
            final repo = await _service.detail(baseUrl);
            return _insert(repo);
        } catch(e) {
            throw InvalidUrlException();
        }
    }

    Future<void> _insert(ExtensionRepo repo) async {
        await _repository.insert(
            baseUrl: repo.baseUrl,
            displayName: repo.displayName,
            website: repo.website,
            signingKeyFingerprint: repo.signingKeyFingerprint,
        );
    }
}

