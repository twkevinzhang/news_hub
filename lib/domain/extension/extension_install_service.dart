import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/models/models.dart';

abstract class ExtensionInstallService {
  Stream<int> download(String zipUrl, Extension extension);

  Stream<String> install(Extension extension);

  Future<void> uninstall(Extension extension);

  Future<List<Extension>> listInstalledExtensions();
}
