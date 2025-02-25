import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/app/extension/extension.dart';
import 'package:news_hub/app/extension/instance_manager/extension_instance_manager_impl.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/app.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/search.dart';
import 'package:news_hub/presentation/router/router.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:path_provider/path_provider.dart';

import 'app/extension/api/grpc_extension_api_service_impl.dart';
import 'domain/extension/interactor/run_all_extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await testFromReload();
  runApp(App());
}

Future<void> production() async {
  final runAllExtensions = sl<RunAllExtensions>();
  try {
    await runAllExtensions.call();
    runApp(App());
  } catch (e) {
    print(e);
  } finally {
    await runAllExtensions.closeAll();
  }
}

Future<void> testFromNewAsset() async {
  final extension = Extension(
    repoBaseUrl:
    'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
    pkgName: 'twkevinzhang_komica',
    displayName: 'Komica Ex',
    zipName: 'twkevinzhang_komica.zip',
    address: 'http://127.0.0.1:55001',
    version: 1,
    pythonVersion: 1,
    isNsfw: false,
    lang: 'zh_tw',
  );
  final installer = sl<InstallExtension>();
  await installer.uninstall(extension);
  await copyFile(extension.zipName);
  await installer.installOnly(extension).last;
  print('安裝成功');
}

Future<void> testFromReload() async {
  final extension = Extension(
    repoBaseUrl:
    'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
    pkgName: 'twkevinzhang_komica',
    displayName: 'Komica Ex',
    zipName: 'twkevinzhang_komica.zip',
    address: 'http://127.0.0.1:55001',
    version: 1,
    pythonVersion: 1,
    isNsfw: false,
    lang: 'zh_tw',
  );
  final manager = sl<ExtensionInstanceManager>();
  await manager.close(extension);
  await manager.runNew(extension);
  final service = sl<ExtensionApiService>();
  final site = await service.site(extension: extension);
  print('site: $site');
  await manager.close(extension);
}

Future<void> copyFile(String filename) async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationSupportDirectory();
  final docPath = directory.path;
  // 原始檔案路徑
  final sourcePath = 'demo_extension/$filename';

  // 目標檔案路徑
  final destinationPath = '$docPath/$downloadedFileFolder/$filename';

  try {
    // 確保目標目錄存在
    final destinationDir = Directory('$docPath/$downloadedFileFolder');
    if (!await destinationDir.exists()) {
      await destinationDir.create(recursive: true); // 遞迴建立目錄
    }

    // 從資源中讀取檔案
    final byteData = await rootBundle.load(sourcePath);

    // 將檔案寫入目標位置
    final destinationFile = File(destinationPath);
    await destinationFile.writeAsBytes(byteData.buffer.asUint8List());

    print('檔案已成功複製到: ${destinationFile.path}');
  } catch (e) {
    print('複製檔案時發生錯誤: $e');
  }
}
