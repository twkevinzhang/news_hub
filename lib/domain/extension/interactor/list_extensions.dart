part of '../index.dart';

@lazySingleton
class ListExtensions {
  final ExtensionPreferencesService _prefService;
  final ListInstalledExtensions _listInstalledExtensions;
  final ListRemoteExtensions _listRemoteExtensions;
  ListExtensions({
    required ExtensionPreferencesService prefService,
    required ListInstalledExtensions listInstalledExtensions,
    required ListRemoteExtensions listRemoteExtensions,
  }): _prefService = prefService,
        _listInstalledExtensions = listInstalledExtensions,
        _listRemoteExtensions = listRemoteExtensions;

  Stream<Extensions> call() {
    return CombineLatestStream.combine3(
      _prefService.enabledLanguages().changes(),
      _listInstalledExtensions.call().asStream(),
      _listRemoteExtensions.call().asStream(),
      (enabledLanguages, installed, remote) {
        final installedSet = installed.where((element) => enabledLanguages.contains(element.lang)).toSet();
        final remoteSet = remote.filter((element) => installedSet.none((e) => e.pkgName == element.pkgName)).toSet();
        return Extensions(
            updates: installedSet.where((element) => remote.any((e) => e.pkgName == element.pkgName && e.version > element.version)).toSet(),
            deprecated: installedSet.difference(remoteSet),
            installed: installedSet,
            remote: remoteSet,
          );
        }
    );
  }
}

class Extensions {
  final Set<Extension> updates;
  final Set<Extension> deprecated;
  final Set<Extension> installed;
  final Set<RemoteExtension> remote;

  Extensions({
    required this.updates,
    required this.deprecated,
    required this.installed,
    required this.remote,
  });
}
