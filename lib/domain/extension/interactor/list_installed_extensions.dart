part of '../index.dart';

@lazySingleton
class ListInstalledExtensions {
  final ExtensionInstallService _installService;
  ListInstalledExtensions({
    required ExtensionInstallService installService,
  }): _installService = installService;

  Future<List<Extension>> call() {
    return _installService.listInstalledExtensions();
  }
}
