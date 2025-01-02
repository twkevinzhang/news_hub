import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_hub/app/api/model/board_dto.dart';
import 'package:news_hub/app/api/model/comment_dto.dart';
import 'package:news_hub/app/api/model/post_dto.dart';
import 'package:news_hub/app/api/model/site_dto.dart';
import 'package:news_hub/app/api/model/thread_dto.dart';
import 'package:news_hub/domain/api/model/index.dart';
import 'package:news_hub/domain/extension/model/index.dart';
import 'package:news_hub/infra/logger.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:path/path.dart' as path;
import 'package:news_hub/shared/extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:serious_python/serious_python.dart';

class ApiServiceImpl {
  final Dio _dio;
  ApiServiceImpl({
    required Dio dio,
  }) : _dio = dio;

  Future<void> run(Extension extension) async {
    final directory = await getApplicationSupportDirectory();
    final appPath = [directory.path, installedFileFolder, extension.name].toUrl();
    Directory.current = path.dirname(appPath);
    SeriousPython.runProgram([appPath, 'main.py'].toUrl(), environmentVariables: {"a": "1", "b": "2"});
    await Future.delayed(const Duration(seconds: 5)); // wait flask server launched
    await ping(extension);
  }

  Future<void> ping(Extension extension) async {
    final path = "ping";
    await _dio.get([extension.address, path].toUrl());
  }

}
