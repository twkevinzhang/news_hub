import 'package:news_hub/domain/extension_repo/api_service.dart';
import 'package:news_hub/domain/extension_repo/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class GetExtensionRepo {
  GetExtensionRepo({
    required ExtensionRepoRepository repo,
  })  : _repo = repo;

  final ExtensionRepoRepository _repo;

  Future<ExtensionRepo> call(String baseUrl) {
    return _repo.getRepo(baseUrl);
  }
}
