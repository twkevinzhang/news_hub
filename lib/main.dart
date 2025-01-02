import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_hub/app/extension/service/extension_installer_impl.dart';
import 'package:news_hub/domain/extension/model/index.dart';
import 'package:news_hub/presentation/app.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:path_provider/path_provider.dart';

import 'app/api/service/api_service_impl.dart';

void main() async {
  testApiService();
  runApp(const App());
}

void testApiService() async {
  final mockException = AvailableExtension(
    name: 'beeceptor',
    zipName: 'beeceptor.zip',
    address: 'http://127.0.0.1:55001',
    versionName: 'v1',
    versionCode: 1,
    libVersion: 1.0,
    isNsfw: false,
    lang: 'zh-tw',
    iconUrl: '',
    repoUrl: '',
  );
  final service = await ExtensionInstallerImpl.create();
  final api = ApiServiceImpl(dio: Dio());
  service.uninstall(mockException);
  await copyFile();
  await service.install(mockException).last;
  await api.run(mockException);
  await api.ping(mockException);
}

Future<void> copyFile() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationSupportDirectory();
  final docPath = directory.path;
  // 原始檔案路徑
  final sourcePath = 'beeceptor/dist/beeceptor.zip';

  // 目標檔案路徑
  final destinationPath = '$docPath/$downloadedFileFolder/beeceptor.zip';

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
