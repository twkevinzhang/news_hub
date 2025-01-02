import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'locator.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: "init",
  asExtension: true,
)
Future<void> configureDependencies() => sl.init();

@module
abstract class AppProvider {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  Dio get dio => Dio();
}
