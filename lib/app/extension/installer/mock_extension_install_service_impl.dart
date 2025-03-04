import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';

@Environment(AppEnv.mockExtension)
@preResolve
@LazySingleton(as: ExtensionInstallService)
class MockExtensionInstallServiceImpl implements ExtensionInstallService {
  final Uri _downloadFolder;
  final Uri _installFolder;

  MockExtensionInstallServiceImpl._(this._downloadFolder, this._installFolder);
  @factoryMethod
  static Future<ExtensionInstallService> create() async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationSupportDirectory();
    final d = directory.uri.resolve(downloadedFileFolder);
    final i = directory.uri.resolve(installedFileFolder);
    return MockExtensionInstallServiceImpl._(d, i);
  }

  @override
  Stream<int> download(String zipUrl, Extension extension) {
    throw UnimplementedError();
  }

  @override
  Future<void> uninstall(Extension extension) async {
    throw UnimplementedError();
  }

  @override
  Future<void> removeZip(Extension extension) {
    throw UnimplementedError();
  }

  @override
  Stream<ZipStatus> install(Extension extension) {
    throw UnimplementedError();
  }
}
