import 'package:dio/dio.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart' show Environment, Injectable, InjectableInit, NoEnvOrContainsAny, lazySingleton, module, preResolve, singleton;
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/presentation/app.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'domain/extension/extension_api_service.dart';
import 'domain/models/models.dart';
import 'locator.config.dart';
import 'package:serious_python/serious_python.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: "init",
  asExtension: true,
)
Future<void> configureDependencies() => sl.init(
      environmentFilter: const NoEnvOrContainsAny(
        // kReleaseMode ? {Environment.prod} : {Environment.dev},
        {AppEnv.remoteAdapter},
      ),
    );

// TODO: implement to microPackages, like https://github.com/ashishrawat2911/firekart_app/blob/7ca3fe0a7e7348595c4308274c04b84c0b9ae877/modules/analytics/lib/di/di.dart

@module
abstract class AppProvider {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio get dio => Dio();

  @Environment(AppEnv.localAdapter)
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

  @Environment(AppEnv.remoteAdapter)
  @lazySingleton
  ClientChannel remote() => ClientChannel(
        '127.0.0.1'
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

@Environment(AppEnv.mockData)
@Injectable(as: Launcher)
class MockDataLauncher implements Launcher {
  @override
  Future<void> call() async {
    runApp(App());
  }
}

@Environment(AppEnv.localAdapter)
@Injectable(as: Launcher)
class LocalAdapterLauncher implements Launcher {
  final InstalledExtensionRepository _extensionRepository;
  final ExtensionApiService _apiService;

  LocalAdapterLauncher({
    required InstalledExtensionRepository extensionRepository,
    required ExtensionApiService apiService,
  })  : _extensionRepository = extensionRepository,
        _apiService = apiService;

  @override
  Future<void> call() async {
    newAssetCase();
  }

  Future<void> newAssetCase() async {
    try {
      SeriousPython.run(adapterAsset);
      await Future.delayed(const Duration(seconds: 3));
      await insertTwkevinzhangKomica(_extensionRepository);
      debugPrint('啟動成功');
      runApp(App());
    } catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('StackTrace: $s');
    } finally {
      SeriousPython.terminate();
    }
  }
}

@Environment(AppEnv.remoteAdapter)
@Injectable(as: Launcher)
class RemoteAdapterLauncher implements Launcher {
  final InstalledExtensionRepository _extensionRepository;
  RemoteAdapterLauncher({
    required InstalledExtensionRepository extensionRepository,
  }) : _extensionRepository = extensionRepository;

  @override
  Future<void> call() async {
    await insertTwkevinzhangKomica(_extensionRepository);
    runApp(App());
  }
}

Future<void> insertTwkevinzhangKomica(InstalledExtensionRepository extensionRepository) async {
  try {
    await extensionRepository.insertByModel(Extension(
      repoBaseUrl: 'https://raw.githubusercontent.com/twkevinzhang/news_hub_extensions/master',
      pkgName: 'twkevinzhang_komica',
      displayName: 'Komica Ex',
      zipName: 'twkevinzhang_komica.zip',
      version: 1,
      pythonVersion: 1,
      isNsfw: false,
      lang: 'zh_tw',
    ));
  } on DriftRemoteException catch (e, s) {
    if (e.remoteCause case SqliteException e2) {
      if (e2.extendedResultCode == 1555) {
        return;
      }
    }
    rethrow;
  }
}
