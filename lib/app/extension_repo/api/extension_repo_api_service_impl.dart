import 'dart:convert';
import 'package:injectable/injectable.dart';

import 'package:dio/dio.dart';
import 'package:news_hub/app/extension_repo/api/models/detail_res/detail_res_dto.dart';
import 'package:news_hub/app/extension_repo/api/models/extension/extension_dto.dart';
import 'package:news_hub/app/extension_repo/api/models/extension_repo/extension_repo_dto.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/constants.dart';

@Environment(AppEnv.demoExtension)
@LazySingleton(as: ExtensionRepoApiService)
class ExtensionRepoApiServiceImpl implements ExtensionRepoApiService {
  final Dio _dio;
  ExtensionRepoApiServiceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<ExtensionRepo> detail(String baseUrl) async {
    final res = await _dio
        .get('https://api.github.com/repos/$baseUrl/contents/repo.json');
    return DetailResDto.fromJson(res.data).mapContent((json) =>
        ExtensionRepoDto.fromJson(json).toExtensionRepo(baseUrl: baseUrl));
  }

  @override
  Future<List<RemoteExtension>> extensions(String baseUrl) async {
    final res = await _dio
        .get('https://api.github.com/repos/$baseUrl/contents/extensions.json');
    return DetailResDto.fromJson(res.data)
        .mapIterableContent(
            (json) => ExtensionDto.fromJson(json).toRemoteExtension())
        .toList();
  }

  @override
  Future<String> zipUrl(Extension extension) async {
    final res = await _dio.get(
        'https://api.github.com/repos/${extension.repoBaseUrl}/contents/zip/${extension.pkgName}');
    final dto = DetailResDto.fromJson(res.data);
    return dto.downloadUrl;
  }
}
