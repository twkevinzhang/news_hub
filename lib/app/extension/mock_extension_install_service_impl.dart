import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';

@test
@preResolve
@LazySingleton(as: ExtensionInstallService)
class MockExtensionInstallServiceImpl implements ExtensionInstallService {
  final String _downloadFolder;
  final String _installFolder;

  MockExtensionInstallServiceImpl._(this._downloadFolder, this._installFolder);
  @factoryMethod
  static Future<ExtensionInstallService> create() async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationSupportDirectory();
    final d = [directory.path, downloadedFileFolder].toUrl();
    final i = [directory.path, installedFileFolder].toUrl();
    return MockExtensionInstallServiceImpl._(d, i);
  }

  @override
  Stream<Pair<InstallStatus, double>> downloadAndInstall(String zipUrl, Extension extension) {
    throw UnimplementedError();
  }

  @override
  Stream<String> install(Extension extension) {
    // TODO: implement install
    throw UnimplementedError();
  }

  @override
  Future<void> uninstall(Extension extension) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Extension>> listInstalledExtensions() async {
    return [
      Extension(
        repoBaseUrl: 'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
        pkgName: 'twkevinzhang_beeceptor',
        displayName: 'Beeceptor Ex',
        zipName: 'beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
      )
    ];
  }
}
