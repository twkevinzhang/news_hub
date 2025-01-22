part of 'index.dart';

abstract class ExtensionInstallService {

  Stream<Pair<String, int>> download(String zipUrl, Extension extension);

  Stream<String> install(Extension extension);

  Future<void> uninstall(Extension extension);

  Future<List<Extension>> listInstalledExtensions();
}
