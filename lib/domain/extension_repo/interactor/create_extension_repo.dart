import 'package:news_hub/domain/model/index.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/exceptions.dart';

import '../api_service.dart';
import '../repository.dart';

@lazySingleton
class CreateExtensionRepo {
    CreateExtensionRepo({
        required ExtensionRepoRepository repository,
        required ExtensionRepoApiService service,
    })  : _repository = repository,
            _service = service;

    final ExtensionRepoRepository _repository;
    final ExtensionRepoApiService _service;

    final _repoRegex = RegExp(r'^https://.*/index\.min\.json$');

    Future<void> call(String indexUrl) async {
        final formattedIndexUrl = Uri.tryParse(indexUrl)?.toString();
        if (formattedIndexUrl == null || !_repoRegex.hasMatch(formattedIndexUrl)) {
            throw InvalidUrlException();
        }

        final baseUrl = formattedIndexUrl.replaceAll('/index.min.json', '');
        try {
            final repo = await _service.detail(baseUrl);
            return _insert(repo);
        } catch(e) {
            throw InvalidUrlException();
        }
    }

    Future<void> _insert(ExtensionRepo repo) async {
        await _repository.insertRepo(
            baseUrl: repo.baseUrl,
            displayName: repo.displayName,
            website: repo.website,
            signingKeyFingerprint: repo.signingKeyFingerprint,
        );
    }
}

