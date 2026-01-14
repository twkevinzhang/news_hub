import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' show Environment, InjectableInit, module, preResolve, singleton, Injectable, lazySingleton;
import 'package:news_hub/presentation/app.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:serious_python/serious_python.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/app/service/connection/grpc_connection_manager_impl.dart';
import 'package:news_hub/app/service/connection/interface.dart';
import 'package:news_hub/app/service/preferences/store.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'flavors.dart';
import 'locator.config.dart';

final sl = GetIt.instance;

const sidecar = Environment('sidecar');
const remote = Environment('remote');

@InjectableInit(
  initializerName: "init",
  asExtension: true,
)
Future<void> configureDependencies() {
  final env = F.appFlavor == Flavor.sidecar ? 'sidecar' : 'remote';
  return sl.init(
    environment: env,
  );
}

// TODO: implement to microPackages, like https://github.com/ashishrawat2911/firekart_app/blob/7ca3fe0a7e7348595c4308274c04b84c0b9ae877/modules/analytics/lib/di/di.dart

@module
abstract class AppProvider {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio get dio => Dio();

  @singleton
  SidecarPreferences sidecarPreferences(PreferenceStore store) {
    return SidecarPreferences(store);
  }

  @singleton
  SidecarConnectionManager sidecarConnectionManager(GrpcConnectionManagerImpl manager) => manager;
}

abstract class Launcher {
  Future<void> call();
}

@sidecar
@Injectable(as: Launcher)
class SidecarAppLauncher implements Launcher {
  final SidecarConnectionManager _connectionManager;

  SidecarAppLauncher(
    this._connectionManager,
  );

  @override
  Future<void> call() async {
    debugPrint('Sidecar asset: $sidecarAsset');

    const envHost = String.fromEnvironment('SIDECAR_HOST', defaultValue: '127.0.0.1');
    const envPort = int.fromEnvironment('SIDECAR_PORT', defaultValue: 55001);
    _connectionManager.initialize(
      host: envHost,
      port: envPort,
    );

    SeriousPython.run(sidecarAsset);
    runApp(const App());
  }
}

@remote
@Injectable(as: Launcher)
class RemoteAppLauncher implements Launcher {
  final SidecarConnectionManager _connectionManager;

  RemoteAppLauncher(
    this._connectionManager,
  );

  @override
  Future<void> call() async {
    const envHost = String.fromEnvironment('SIDECAR_HOST', defaultValue: '127.0.0.1');
    const envPort = int.fromEnvironment('SIDECAR_PORT', defaultValue: 55001);

    debugPrint('Connecting to remote gRPC server at $envHost:$envPort');

    _connectionManager.initialize(
      host: envHost,
      port: envPort,
    );

    runApp(const App());
  }
}
