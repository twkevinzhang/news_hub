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
@Environment(AppEnv.demoExtension)
@Environment(AppEnv.remoteExtension)
@preResolve
@LazySingleton(as: ExtensionInstallService)
class ExtensionInstallServiceImpl implements ExtensionInstallService {
  final Uri _downloadFolder;
  final Uri _installFolder;

  ExtensionInstallServiceImpl._(this._downloadFolder, this._installFolder);
  @factoryMethod
  static Future<ExtensionInstallService> create() async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationSupportDirectory();
    return ExtensionInstallServiceImpl._(
        directory.uri.dir(downloadedFileFolder),
        directory.uri.dir(installedFileFolder),
    );
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
    Directory.fromUri(_downloadFolder).createSync(recursive: true);
    final taskId = await FlutterDownloader.enqueue(
      url: zipUrl,
      headers: {}, // 可選：例如加入認證標頭
      savedDir: _downloadFolder.toString(),
      showNotification: true, // 顯示下載進度通知
      openFileFromNotification: true, // 通知可開啟下載的檔案
    );

    if (taskId == null) {
      throw Exception("Failed to enqueue download task");
    }

    // 監聽下載進度
    final sub = StreamController<int>();
    FlutterDownloader.registerCallback(
        (String id, int statusCode, int progress) {
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
    final downloadedFile = _downloadFolder.file(extension.zipName);
    yield ZipStatus.reading;
    final bytes = await File.fromUri(downloadedFile).readAsBytes();

    // Decode the Zip file
    yield ZipStatus.extracting;
    final archive = ZipDecoder().decodeBytes(bytes);
    for (final file in archive) {
      final uri = _installFolder.dir(extension.pkgName).file(file.name);
      if (file.isFile) {
        final data = file.content as List<int>;
        File.fromUri(uri)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory.fromUri(uri).createSync(recursive: true);
      }
    }

    return;
  }

  @override
  Future<void> uninstall(Extension extension) async {
    final folder = _installFolder.dir(extension.pkgName);
    try {
      await Directory.fromUri(folder).delete(recursive: true);
    } on PathNotFoundException catch (e) {
      // pass
    }
  }

  @override
  Future<void> removeZip(Extension extension) async {
    final zip = _downloadFolder.file(extension.zipName);
    try {
      await Directory.fromUri(zip).delete(recursive: true);
    } on PathNotFoundException catch (e) {
      // pass
    }
  }
}
