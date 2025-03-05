import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:news_hub/app/extension_repo/api/models/extension_repo_api.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';

@Environment(AppEnv.demoExtension)
@Environment(AppEnv.remoteExtension)
@LazySingleton(as: ExtensionRepoApiService)
class ExtensionRepoApiServiceImpl implements ExtensionRepoApiService {
  final Dio _dio;
  ExtensionRepoApiServiceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<ExtensionRepo> detail(String baseUrl) async {
    final res = await _dio.get('https://api.github.com/repos/$baseUrl/contents/repo.json');
    final contentMap = GithubResponseDto.fromJson(res.data).content.fromBase64Json();
    final detail = GetDetailContentDto.fromJson(contentMap).toExtensionRepo(baseUrl: baseUrl);
    return detail;
  }

  @override
  Future<List<RemoteExtension>> extensions(String baseUrl) async {
    final res = await _dio.get('https://api.github.com/repos/$baseUrl/contents/extensions.json');
    final list = GithubResponseDto.fromJson(res.data).content.fromBase64List();
    return list.map((map) => GetExtensionsContentItemDto.fromJson(map).toRemoteExtension()).toList();
  }

  @override
  Future<String> zipUrl(Extension extension) async {
    final res = await _dio.get('https://api.github.com/repos/${extension.repoBaseUrl}/contents/zip/${extension.pkgName}');
    return GithubResponseDto.fromJson(res.data).downloadUrl;
  }
}
