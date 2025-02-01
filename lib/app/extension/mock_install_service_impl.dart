import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';

@preResolve
@LazySingleton(as: ExtensionInstallService)
class MockExtensionInstallServiceImpl extends ExtensionInstallService {
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
  Future<void> uninstall(Extension extension) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Extension>> listInstalledExtensions() async {
    return [
      Extension(
        repoBaseUrl: 'github.com/twkevinzhang/beeceptor',
        pkgName: 'twkevinzhang_beeceptor',
        displayName: 'Beeceptor Ex',
        zipName: 'beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
        site: Site(
          extensionPkgName: 'twkevinzhang_beeceptor',
          id: '1',
          name: 'Beeceptor',
          icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
          url: 'https://beeceptor.com/',
        ),
        boards: {
          Board(
            extensionPkgName: 'twkevinzhang_beeceptor',
            siteId: '1',
            id: '1',
            name: '八卦版',
            icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
            largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
            url: 'https://beeceptor.com/goss',
            supportedThreadsSorting: {'newest', 'popular'},
          ),
          Board(
            extensionPkgName: 'twkevinzhang_beeceptor',
            siteId: '1',
            id: '2',
            name: '遊戲版',
            icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
            largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
            url: 'https://beeceptor.com/game',
            supportedThreadsSorting: {'newest', 'popular'},
          ),
          Board(
            extensionPkgName: 'twkevinzhang_beeceptor',
            siteId: '1',
            id: '3',
            name: '電蝦版',
            icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
            largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
            url: 'https://beeceptor.com/work',
            supportedThreadsSorting: {'newest', 'popular'},
          ),
        },
      )
    ];
  }
}
