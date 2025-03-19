import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';

@Environment(AppEnv.mockData)
@preResolve
@LazySingleton(as: ExtensionInstallService)
class MockExtensionInstallServiceImpl implements ExtensionInstallService {
  MockExtensionInstallServiceImpl._();
  @factoryMethod
  static Future<ExtensionInstallService> create() async {
    return MockExtensionInstallServiceImpl._();
  }

  @override
  Stream<int> downloadAndInstall(String zipUrl, Extension extension) {
    // TODO: implement downloadAndInstall
    throw UnimplementedError();
  }

  @override
  Future<void> uninstall(Extension extension) {
    // TODO: implement uninstall
    throw UnimplementedError();
  }
}
