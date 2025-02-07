import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/models/models.dart';

enum InstallStatus {
  downloading,
  installing,
}

abstract class ExtensionInstallService {
  Stream<Pair<InstallStatus, double>> downloadAndInstall(String zipUrl, Extension extension);

  Stream<String> install(Extension extension);

  Future<void> uninstall(Extension extension);

  Future<List<Extension>> listInstalledExtensions();
}
