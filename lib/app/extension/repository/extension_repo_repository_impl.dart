import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

@LazySingleton(as: ExtensionRepoRepository)
class ExtensionRepoRepositoryImpl implements ExtensionRepoRepository {
  final ApiService _apiService;

  ExtensionRepoRepositoryImpl(this._apiService);

  @override
  Future<List<domain.ExtensionRepo>> list() async {
    return await _apiService.listExtensionRepos();
  }

  @override
  Future<void> insert(String url) async {
    await _apiService.addExtensionRepo(url: url);
  }

  @override
  Future<void> delete(String baseUrl) async {
    await _apiService.removeExtensionRepo(url: baseUrl);
  }
}
