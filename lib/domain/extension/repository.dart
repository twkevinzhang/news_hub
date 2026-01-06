import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/models/models.dart';

enum InstallStatus {
  downloading,
  installing,
  completed,
  failed,
}

abstract class ExtensionRepository {
  Future<List<Extension>> listInstalled();
  Future<Extension> getInstalled(String extensionPkgName);
  Stream<Pair<InstallStatus, double>> install(Extension extension);
  Future<void> uninstall(Extension extension);
  Future<List<RemoteExtension>> listRemote();
}
