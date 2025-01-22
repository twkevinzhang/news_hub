import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/app/extension/index.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/extension_repo/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/presentation/app.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/index.dart';
import 'package:news_hub/presentation/pages/threads/index.dart';
import 'package:news_hub/presentation/router.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // testApiService();
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  
  runApp(App());
}

void testApiService() async {
  final mockException = RemoteExtension.mock();
  final service = await ExtensionInstallServiceImpl.create();
  final api = ExtensionApiServiceImpl(dio: Dio());
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
