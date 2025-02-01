import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/app/model/index.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';

/// [ExtensionInstallServiceImpl] download and install flask extension from _installFolder.
// @preResolve
// @LazySingleton(as: ExtensionInstallService)
class ExtensionInstallServiceImpl extends ExtensionInstallService {
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
  Stream<Pair<InstallStatus, double>> downloadAndInstall(String zipUrl, Extension extension) {
    return _download(zipUrl, extension).asyncMap((pair) async {
      if (pair.first == DownloadTaskStatus.enqueued) {
        return Pair(InstallStatus.downloading, pair.second.toDouble());
      } else {
        return Pair(InstallStatus.installing, 0.0);
      }
    }).asyncExpand((status) async* {
      if (status.first == InstallStatus.installing) {
        yield Pair(InstallStatus.installing, 0.0);
        yield* _install(extension).map((e) => Pair(InstallStatus.installing, 100.0));
      }
    });
  }

  Stream<Pair<DownloadTaskStatus, int>> _download(String zipUrl, Extension extension) async* {
    // 初始化 FlutterDownloader
    if (!FlutterDownloader.initialized) {
      await FlutterDownloader.initialize(
        debug: true, // 是否顯示除錯訊息
        ignoreSsl: true, // 是否忽略 SSL 驗證
      );
    }

    // 清除舊資料
    uninstall(extension);

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
    final sub = StreamController<Pair<DownloadTaskStatus, int>>();
    FlutterDownloader.registerCallback((String id, int statusCode, int progress) {
      if (id == taskId) {
        if (!sub.isClosed) {
          sub.add(Pair(DownloadTaskStatus.enqueued, progress));
        }
      }
    });

    yield* sub.stream;
  }

  Stream<String> _install(Extension extension) async* {
    // Read the Zip file from disk.
    final downloadedFile = [_downloadFolder, extension.zipName].toUrl();
    final bytes = File(downloadedFile).readAsBytesSync();

    // Decode the Zip file
    final archive = ZipDecoder().decodeBytes(bytes);

    // Extract the contents of the Zip archive to disk.
    final folder = [_installFolder, extension.pkgName].toUrl();

    for (final file in archive) {
      final url = [folder, file.name].toUrl();
      if (file.isFile) {
        yield "extraing";
        final data = file.content as List<int>;
        File(url)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory(url).createSync(recursive: true);
      }
    }
    yield "completed";
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
  Future<List<Extension>> listInstalledExtensions() async {
    List<Extension> result = [];
    final directory = Directory(_installFolder);
    final subdirectories = directory.listSync().whereType<Directory>();
    for (var subdirectory in subdirectories) {
      final manifestFile = File('${subdirectory.path}/manifest.json');
      if (manifestFile.existsSync()) {
        final pkgName = Uri.parse(subdirectory.path).pathSegments.last;
        result.add(await _load(pkgName));
      }
    }
    return result;
  }

  Future<Extension> _load(String pkgName) async {
    final jsonStr = await File([_installFolder, pkgName, "metadata.json"].toUrl()).readAsString();
    final j = json.decode(jsonStr);
    return Extension(
      repoBaseUrl: j["repoBaseUrl"],
      pkgName: pkgName,
      displayName: j["display_name"],
      zipName: j["zip_name"],
      address : j["address"],
      version : j["version"],
      pythonVersion : j["python_version"],
      lang : j["lang"],
      isNsfw: j["is_nsfw"],
      site: SiteDto.fromJson(j["site"]).toSite(),
      boards: (j["boards"] as Iterable).map((e) => BoardDto.fromJson(e).toBoard()).toSet(),
    );
  }
}
