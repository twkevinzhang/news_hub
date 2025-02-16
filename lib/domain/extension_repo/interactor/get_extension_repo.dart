import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetExtensionRepo {
  GetExtensionRepo({
    required ExtensionRepoRepository repo,
  }) : _repo = repo;

  final ExtensionRepoRepository _repo;

  Future<ExtensionRepo> call(String baseUrl) {
    return _repo.get(baseUrl);
  }
}
