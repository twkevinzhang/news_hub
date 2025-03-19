import 'package:injectable/injectable.dart' as injectable;

const String adapterAsset = "adapter/dist/adapter.zip";

class AppEnv {
  /// name of the environment
  final String name;

  /// default constructor
  const AppEnv(this.name);

  /// preset of common env name 'dev'
  static const dev = injectable.Environment.dev;

  /// preset of common env name 'prod'
  static const prod = injectable.Environment.prod;

  /// preset of common env name 'test'
  static const test = injectable.Environment.test;

  /// preset of common env name 'mockData'
  static const mockData = 'mockData';

  /// preset of common env name 'localAdapter'
  static const localAdapter = 'localAdapter';

  /// preset of common env name 'remoteAdapter'
  static const remoteAdapter = 'remoteAdapter';
}
