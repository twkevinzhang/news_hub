import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_hub/app/model/index.dart';
import 'package:news_hub/domain/extension_repo/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/app/service/logger.dart';

// @LazySingleton(as: ExtensionRepoApiService)
class ExtensionRepoApiServiceImpl implements ExtensionRepoApiService {
  final Dio _dio;
  ExtensionRepoApiServiceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<ExtensionRepo> detail(String baseUrl) async {
    final res = await _dio.get('$baseUrl/detail.json');
    final decodedResponse = jsonDecode(res.data);
    return ExtensionRepoDto.fromJson(decodedResponse).toExtensionRepo(baseUrl: baseUrl);
  }

  @override
  Future<List<RemoteExtension>> extensions(String baseUrl) async {
    final res = await _dio.get('$baseUrl/extensions.json');
    final decodedResponse = jsonDecode(res.data) as Iterable;
    return List<RemoteExtension>.from(decodedResponse.map((e) => ExtensionDto.fromJson(e).toRemoteExtension()));
  }

  @override
  Future<String> zipUrl(Extension extension) {
    return Future.value("${extension.repoBaseUrl}/apk/${extension.pkgName}");
  }
}
