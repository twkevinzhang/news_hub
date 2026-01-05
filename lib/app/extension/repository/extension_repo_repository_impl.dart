import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/domain/sidecar/service/sidecar_connection_manager.dart';

@LazySingleton(as: ExtensionRepoRepository)
class ExtensionRepoRepositoryImpl implements ExtensionRepoRepository {
  final ApiService _apiService;
  final SidecarConnectionManager _connectionManager;

  ExtensionRepoRepositoryImpl(
    this._apiService,
    this._connectionManager,
  );

  @override
  Future<List<domain.ExtensionRepo>> list() async {
    await _ensureConnected();
    return await _apiService.listExtensionRepos();
  }

  @override
  Future<void> insert(String url) async {
    await _ensureConnected();
    await _apiService.addExtensionRepo(url: url);
  }

  @override
  Future<void> delete(String baseUrl) async {
    await _ensureConnected();
    await _apiService.removeExtensionRepo(url: baseUrl);
  }

  Future<void> _ensureConnected() async {
    await _connectionManager.waitUntilConnected();
  }
}
