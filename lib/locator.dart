import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart' show Environment, InjectableInit, NoEnvOrContainsAny, module, preResolve, singleton, Injectable;
import 'package:news_hub/presentation/app.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:serious_python/serious_python.dart';
import 'package:news_hub/shared/constants.dart';
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
  ClientChannel get clientChannel => ClientChannel(
        '127.0.0.1',
        port: 55001,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          connectTimeout: Duration(seconds: 5),
        ),
      );
}

abstract class Launcher {
  Future<void> call();
}

@Injectable(as: Launcher)
class AppLauncher implements Launcher {
  @override
  Future<void> call() async {
    try {
      // Start sidecar service
      SeriousPython.run(sidecarAsset);
      await Future.delayed(const Duration(seconds: 3));
      debugPrint('Sidecar service started successfully');
      runApp(App());
    } catch (e, s) {
      debugPrint('Exception starting sidecar: $e');
      debugPrint('StackTrace: $s');
      // Run app anyway even if sidecar fails to start
      runApp(App());
    }
  }
}
