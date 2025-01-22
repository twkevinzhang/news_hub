part of 'index.dart';

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
  Stream<Pair<String, int>> download(String zipUrl, Extension extension) async* {
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
    final sub = StreamController<Pair<String, int>>();

    FlutterDownloader.registerCallback((String id, int statusCode, int progress) {
      if (id == taskId) {
        // 更新進度
        if (!sub.isClosed) {
          switch (DownloadTaskStatus.fromInt(statusCode)) {
            case DownloadTaskStatus.enqueued:
              sub.add(Pair('enqueued', progress));
              break;
            case DownloadTaskStatus.running:
              sub.add(Pair('running', progress));
              break;
            case DownloadTaskStatus.complete:
              sub.add(Pair('complete', progress));
              sub.close();
              break;
            case DownloadTaskStatus.canceled:
              sub.add(Pair('canceled', progress));
              sub.close();
              break;
            case DownloadTaskStatus.paused:
              sub.add(Pair('paused', progress));
              break;
            case DownloadTaskStatus.failed:
              sub.addError("failed");
              break;
            default:
            // DownloadTaskStatus.undefined
              sub.addError("undefined");
          }
        }
      }
    });

    yield* sub.stream;
  }

  @override
  Stream<String> install(Extension extension) async* {
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
    print("ExtensionInstallServiceImpl listInstalledExtensions");
    return result;
  }

  Future<Extension> _load(String pkgName) async {
    final jsonStr = await File([_installFolder, pkgName, "metadata.json"].toUrl()).readAsString();
    final j = json.decode(jsonStr);
    return Extension(
      pkgName: pkgName,
      displayName: j["display_name"],
      zipName: j["zip_name"],
      address : j["address"],
      version : j["version"],
      pythonVersion : j["python_version"],
      lang : j["lang"],
      isNsfw: j["is_nsfw"],
      site: SiteDto.fromJson(j["site"]).toSite(),
      boards: (j["boards"] as Iterable).map((e) => BoardDto.fromJson(e).toBoard()).toList(),
    );
  }
}
