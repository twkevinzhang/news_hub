import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/repo/repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/domain/sidecar/service/sidecar_connection_manager.dart';

@LazySingleton(as: RepoRepository)
class RepoRepositoryImpl implements RepoRepository {
  final ApiService _apiService;
  final SidecarConnectionManager _connectionManager;

  RepoRepositoryImpl(
    this._apiService,
    this._connectionManager,
  );

  @override
  Future<List<domain.Repo>> list() async {
    await _ensureConnected();
    return await _apiService.listRepos();
  }

  @override
  Future<void> insert(String url) async {
    await _ensureConnected();
    await _apiService.addRepo(url: url);
  }

  @override
  Future<void> delete(String baseUrl) async {
    await _ensureConnected();
    await _apiService.removeRepo(url: baseUrl);
  }

  Future<void> _ensureConnected() async {
    await _connectionManager.waitUntilConnected();
  }
}
