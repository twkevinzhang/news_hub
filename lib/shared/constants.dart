import 'package:injectable/injectable.dart' as injectable;

const String adapterAsset = "sidecar/dist/sidecar.zip";

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
}
