import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/model/index.dart';

enum InstallStatus {
  downloading,
  installing,
}

abstract class ExtensionInstallService {
  Stream<Pair<InstallStatus, double>> downloadAndInstall(String zipUrl, Extension extension);

  Future<void> uninstall(Extension extension);

  Future<List<Extension>> listInstalledExtensions();
}
