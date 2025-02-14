import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';

import 'package:news_hub/domain/extension_repo/extension_repo_api_service.dart';

@lazySingleton
class ValidExtensionRepoUrl {
  Future<String> call(String unknown) async {
    final formattedIndexUrl = Uri.tryParse(unknown)?.toString();
    if (formattedIndexUrl == null) {
      throw InvalidUrlException();
    }
    final regex = RegExp(r'^https://github\.com/.*');
    if (!regex.hasMatch(formattedIndexUrl)) {
      throw InvalidUrlException();
    }
    final uri = Uri.parse(formattedIndexUrl);
    final segments = uri.pathSegments;
    if (segments.length < 2) {
      throw InvalidUrlException();
    }
    final repoOwner = segments[0];
    final repoName = segments[1];
    final baseUrl = '$repoOwner/$repoName';
    return baseUrl;
  }
}

class InvalidUrlException implements Exception {
  InvalidUrlException();
}