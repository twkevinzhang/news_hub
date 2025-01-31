import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/model/index.dart';

abstract class ExtensionInstallService {

  Stream<Pair<String, int>> download(String zipUrl, Extension extension);

  Stream<String> install(Extension extension);

  Future<void> uninstall(Extension extension);

  Future<List<Extension>> listInstalledExtensions();
}
