import 'dart:io';
import 'package:dio/dio.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart' show Environment, Injectable, InjectableInit, NoEnvOrContainsAny, lazySingleton, module, preResolve, singleton;
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/presentation/app.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'domain/extension/extension_api_service.dart';
import 'domain/extension/extension_instance_manager.dart';
import 'domain/extension/interactor/install_extension.dart';
import 'domain/models/models.dart';
import 'locator.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: "init",
  asExtension: true,
)
Future<void> configureDependencies() => sl.init(
      environmentFilter: const NoEnvOrContainsAny(
        // kReleaseMode ? {Environment.prod} : {Environment.dev},
        {AppEnv.demoExtension},
      ),
    );

// TODO: implement to microPackages, like https://github.com/ashishrawat2911/firekart_app/blob/7ca3fe0a7e7348595c4308274c04b84c0b9ae877/modules/analytics/lib/di/di.dart

@module
abstract class AppProvider {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio get dio => Dio();

  @Environment(AppEnv.demoExtension)
  @lazySingleton
  ClientChannel get local => ClientChannel(
    '127.0.0.1',
    port: 55001,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      connectTimeout: Duration(seconds: 5),
      connectionTimeout: Duration(seconds: 5),
    ),
  );

  @Environment(AppEnv.remoteExtension)
  @lazySingleton
  ClientChannel remote() => ClientChannel(
    '10.67.231.161', // on my mac
    port: 55001,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      connectTimeout: Duration(seconds: 5),
      connectionTimeout: Duration(seconds: 5),
    ),
  );
}

abstract class Launcher {
  Future<void> call();
}

@Environment(AppEnv.mockExtension)
@Injectable(as: Launcher)
class MockExtensionLauncher implements Launcher {
  @override
  Future<void> call() async {
    runApp(App());
  }
}

final mockExtension = Extension(
  repoBaseUrl: 'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
  pkgName: 'twkevinzhang_komica',
  displayName: 'Komica Ex',
  zipName: 'twkevinzhang_komica.zip',
  address: 'http://127.0.0.1:55001',
  version: 1,
  pythonVersion: 1,
  isNsfw: false,
  lang: 'zh_tw',
);

@Environment(AppEnv.demoExtension)
@Injectable(as: Launcher)
class DemoExtensionLauncher implements Launcher {
  final ExtensionInstanceManager _manager;
  final InstallExtension _installer;
  final ExtensionApiService _apiService;

  DemoExtensionLauncher({
    required ExtensionInstanceManager manager,
    required InstallExtension installer,
    required ExtensionApiService apiService,
  })  : _manager = manager,
        _installer = installer,
        _apiService = apiService;

  @override
  Future<void> call() async {
    newAssetCase();
    // reloadPythonFileCase();
  }

  /// 當 demo_extension.zip 是新版本時，需使用此方法重新解壓縮 demo_extension.zip 到 device 上
  Future<void> newAssetCase() async {
    await _installer.uninstall(mockExtension);
    await _copyFile(mockExtension.zipName);
    await _installer.installOnly(mockExtension).last;
    debugPrint('安裝成功');
    try {
      await _manager.runNew(mockExtension);
      debugPrint('啟動成功');
      runApp(App());
    } catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('StackTrace: $s');
    } finally {
      await _manager.close(mockExtension);
    }
  }

  /// 如果只是將 device folder 裏的 python file 透過 adb 替換，則可以改用此方法
  Future<void> reloadPythonFileCase() async {
    try {
      await _manager.close(mockExtension);
      await _manager.runNew(mockExtension);
      runApp(App());
      final site = await _apiService.site(extensionPkgName: mockExtension.pkgName);
      debugPrint('site: $site');
    } catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('StackTrace: $s');
    } finally {
      await _manager.close(mockExtension);
    }
  }

  Future<void> _copyFile(String filename) async {
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

      debugPrint('檔案已成功複製到: ${destinationFile.path}');
    } catch (e, s) {
      debugPrint('複製檔案時發生錯誤: $e');
      debugPrint('StackTrace: $s');
    }
  }
}

@Environment(AppEnv.remoteExtension)
@Injectable(as: Launcher)
class RemoteExtensionLauncher implements Launcher {
  final InstalledExtensionRepository _extensionRepository;
  RemoteExtensionLauncher({
    required InstalledExtensionRepository extensionRepository,
  }): _extensionRepository = extensionRepository;

  @override
  Future<void> call() async {
    await insert();
    runApp(App());
  }

  Future<void> insert() async {
    try {
      await _extensionRepository.insert(
        repoBaseUrl: 'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
        pkgName: 'twkevinzhang_komica',
        displayName: 'Komica Ex',
        zipName: 'twkevinzhang_komica.zip',
        address: 'http://10.67.231.161:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
      );
    } on DriftRemoteException catch (e, s) {
      if (e.remoteCause case SqliteException e2) {
        if (e2.extendedResultCode == 1555) {
          return;
        }
      }
      rethrow;
    }
  }
}
