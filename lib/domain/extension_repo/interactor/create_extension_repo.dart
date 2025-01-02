part of '../index.dart';

class CreateExtensionRepo {
    CreateExtensionRepo({
        required ExtensionRepoRepository repository,
        required ExtensionRepoApiService service,
    })  : _repository = repository,
            _service = service;

    final ExtensionRepoRepository _repository;
    final ExtensionRepoApiService _service;

    final _repoRegex = RegExp(r'^https://.*/index\.min\.json$');

    Future<Result> call(String indexUrl) async {
        final formattedIndexUrl = Uri.tryParse(indexUrl)?.toString();
        if (formattedIndexUrl == null || !_repoRegex.hasMatch(formattedIndexUrl)) {
            return const Result.invalidUrl();
        }

        final baseUrl = formattedIndexUrl.replaceAll('/index.min.json', '');
        final repo = await _service.detail(baseUrl);
        if (repo == null) {
            return const Result.invalidUrl();
        }
        return _insert(repo);
    }

    Future<Result> _insert(ExtensionRepo repo) async {
        try {
            await _repository.insertRepo(
                baseUrl: repo.baseUrl,
                displayName: repo.displayName,
                website: repo.website,
                signingKeyFingerprint: repo.signingKeyFingerprint,
            );
            return const Result.success();
        } catch (e) {
            return _handleInsertionError(repo);
        }
    }

    Future<Result> _handleInsertionError(ExtensionRepo repo) async {
        final repoExists = await _repository.getRepo(repo.baseUrl);
        if (repoExists != null) {
            return const Result.repoAlreadyExists();
        }
        final matchingFingerprintRepo =
        await _repository.getRepoBySigningKeyFingerprint(
                repo.signingKeyFingerprint,
        );
        if (matchingFingerprintRepo != null) {
            return Result.duplicateFingerprint(
                oldRepo: matchingFingerprintRepo,
                newRepo: repo,
            );
        }
        return const Result.error();
    }
}

sealed class Result {
    const Result._();

    const factory Result.duplicateFingerprint({
        required ExtensionRepo oldRepo,
        required ExtensionRepo newRepo,
    }) = DuplicateFingerprint;

    const factory Result.invalidUrl() = InvalidUrl;

    const factory Result.repoAlreadyExists() = RepoAlreadyExists;

    const factory Result.success() = Success;

    const factory Result.error() = Error;
}

class DuplicateFingerprint extends Result {
    final ExtensionRepo oldRepo;
    final ExtensionRepo newRepo;

    const DuplicateFingerprint({
        required this.oldRepo,
        required this.newRepo,
    }) : super._();
}

class InvalidUrl extends Result {
    const InvalidUrl() : super._();
}

class RepoAlreadyExists extends Result {
    const RepoAlreadyExists() : super._();
}

class Success extends Result {
    const Success() : super._();
}

class Error extends Result {
    const Error() : super._();
}