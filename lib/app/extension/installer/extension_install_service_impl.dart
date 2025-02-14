import 'dart:async';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';

/// [ExtensionInstallServiceImpl] download and install flask extension from _installFolder.
@dev
@preResolve
@LazySingleton(as: ExtensionInstallService)
class ExtensionInstallServiceImpl implements ExtensionInstallService {
  final String _downloadFolder;
  final String _installFolder;

  ExtensionInstallServiceImpl._(this._downloadFolder, this._installFolder);
  @factoryMethod
  static Future<ExtensionInstallService> create() async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationSupportDirectory();
    final d = [directory.path, downloadedFileFolder].toUrl();
    final i = [directory.path, installedFileFolder].toUrl();
    return ExtensionInstallServiceImpl._(d, i);
  }

  @override
  Stream<int> download(String zipUrl, Extension extension) async* {
    // 初始化 FlutterDownloader
    if (!FlutterDownloader.initialized) {
      await FlutterDownloader.initialize(
        debug: true, // 是否顯示除錯訊息
        ignoreSsl: true, // 是否忽略 SSL 驗證
      );
    }

    // 開始下載任務
    Directory(_downloadFolder).createSync(recursive: true);
    final taskId = await FlutterDownloader.enqueue(
      url: zipUrl,
      headers: {}, // 可選：例如加入認證標頭
      savedDir: _downloadFolder,
      showNotification: true, // 顯示下載進度通知
      openFileFromNotification: true, // 通知可開啟下載的檔案
    );

    if (taskId == null) {
      throw Exception("Failed to enqueue download task");
    }

    // 監聽下載進度
    final sub = StreamController<int>();
    FlutterDownloader.registerCallback((String id, int statusCode, int progress) {
      if (id == taskId) {
        if (!sub.isClosed) {
          sub.add(progress);
        }
      }
    });

    yield* sub.stream;
  }

  @override
  Stream<ZipStatus> install(Extension extension) async* {
    // Read the Zip file from disk.
    final downloadedFile = [_downloadFolder, extension.zipName].toUrl();
    yield ZipStatus.reading;
    final bytes = await File(downloadedFile).readAsBytes();

    // Decode the Zip file
    yield ZipStatus.extracting;
    final archive = ZipDecoder().decodeBytes(bytes);
    for (final file in archive) {
      final url = [_installFolder, extension.pkgName, file.name].toUrl();
      if (file.isFile) {
        final data = file.content as List<int>;
        File(url)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory(url).createSync(recursive: true);
      }
    }

    return;
  }

  @override
  Future<void> uninstall(Extension extension) async {
    final folder = [_installFolder, extension.pkgName].toUrl();
    try {
      await Directory(folder).delete(recursive: true);
    } on PathNotFoundException catch (e) {
      // pass
    }
  }

  @override
  Future<void> removeZip(Extension extension) async {
    final folder = [_downloadFolder, extension.zipName].toUrl();
    try {
      await Directory(folder).delete(recursive: true);
    } on PathNotFoundException catch (e) {
      // pass
    }
  }
}
