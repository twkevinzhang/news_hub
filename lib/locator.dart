import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' show Environment, InjectableInit, NoEnvOrContainsAny, module, preResolve, singleton, Injectable, lazySingleton;
import 'package:logger/logger.dart';
import 'package:news_hub/presentation/app.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:serious_python/serious_python.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/app/service/api/sidecar_api_impl.dart';
import 'package:news_hub/app/service/preferences/store.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'locator.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: "init",
  asExtension: true,
)
Future<void> configureDependencies() => sl.init(
      environmentFilter: const NoEnvOrContainsAny(
        kReleaseMode ? {Environment.prod} : {Environment.dev},
      ),
    );

// TODO: implement to microPackages, like https://github.com/ashishrawat2911/firekart_app/blob/7ca3fe0a7e7348595c4308274c04b84c0b9ae877/modules/analytics/lib/di/di.dart

@module
abstract class AppProvider {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio get dio => Dio();

  @singleton
  ClientChannel get clientChannel {
    // 優先順序：
    // 1. 編譯時環境變數 (--dart-define) - 開發者使用
    // 2. 預設值 (127.0.0.1:55001)
    //
    // 注意：使用者偏好設定需要在 runtime 動態讀取
    // 如果需要使用 App 內設定，請在使用 ClientChannel 的地方重新建立連線
    const envHost = String.fromEnvironment('SIDECAR_HOST', defaultValue: '127.0.0.1');
    const envPort = int.fromEnvironment('SIDECAR_PORT', defaultValue: 55001);

    debugPrint('Sidecar gRPC connecting to: $envHost:$envPort');

    return ClientChannel(
      envHost,
      port: envPort,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        connectTimeout: Duration(seconds: 5),
      ),
    );
  }

  @singleton
  SidecarPreferences sidecarPreferences(PreferenceStore store) {
    return SidecarPreferences(store);
  }
}

abstract class Launcher {
  Future<void> call();
}

@Injectable(as: Launcher)
class AppLauncher implements Launcher {
  @override
  Future<void> call() async {
    debugPrint('Sidecar asset: $sidecarAsset');
    SeriousPython.run(sidecarAsset);
    runApp(App());
  }
}
