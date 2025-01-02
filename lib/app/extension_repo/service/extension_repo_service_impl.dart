import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:news_hub/app/extension_repo/model/extension_repo_dto.dart';
import 'package:news_hub/domain/extension/model/index.dart';
import 'package:news_hub/domain/extension_repo/service/extension_repo_service.dart';
import 'package:news_hub/domain/extension_repo/model/index.dart';
import 'package:news_hub/infra/logger.dart';

class ExtensionRepoServiceImpl implements ExtensionRepoService {
  final Dio _dio;
  ExtensionRepoServiceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<ExtensionRepo?> detail(String baseUrl) async {
    try {
      final res = await _dio.get('$baseUrl/repo.json');
      final decodedResponse = jsonDecode(res.data);
      return ExtensionRepoResDto.fromJson(decodedResponse).meta.toExtensionRepo(baseUrl: baseUrl);
    } catch (e) {
      log.e('Failed to fetch repo details', error: e);
      return null;
    }
  }

  @override
  Future<List<AvailableExtension>> listExtensions(String baseUrl) async {
    try {
      final res = await _dio.get('$baseUrl/index.min.json');
      final decodedResponse = jsonDecode(res.data) as Iterable;
      return List<AvailableExtension>.from(decodedResponse.map((e) => ExtensionDto.fromJson(e).toAvailableExtension()));
    } catch (e) {
      log.e('Failed to fetch repo details', error: e);
      return [];
    }
  }
}
