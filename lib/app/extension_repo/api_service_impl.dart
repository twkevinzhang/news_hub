import 'dart:convert';
import 'package:injectable/injectable.dart';

import 'package:dio/dio.dart';
import 'package:news_hub/app/models/models.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';

@dev
@LazySingleton(as: ExtensionRepoApiService)
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
