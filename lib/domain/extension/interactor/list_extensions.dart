import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart';
import 'package:news_hub/domain/extension/extension_preferences_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class ListExtensions {
  final ExtensionPreferencesService _prefService;
  final ListInstalledExtensions _listInstalledExtensions;
  final ListRemoteExtensions _listRemoteExtensions;
  ListExtensions({
    required ExtensionPreferencesService prefService,
    required ListInstalledExtensions listInstalledExtensions,
    required ListRemoteExtensions listRemoteExtensions,
  })  : _prefService = prefService,
        _listInstalledExtensions = listInstalledExtensions,
        _listRemoteExtensions = listRemoteExtensions;

  Stream<Extensions> asStream(String? keyword) {
    return CombineLatestStream.combine3(
        _prefService.enabledLanguages().changes(),
        _listInstalledExtensions.asStream(),
        _listRemoteExtensions.call().asStream(),
        (enabledLanguages, installed, remotes) {
      var filtered = installed.toIterable();
      var updates = filtered.where((element) => remotes.any(
          (e) => e.pkgName == element.pkgName && e.version > element.version));
      var deprecated = filtered.toSet().difference(remotes.toSet());
      var notInstalled = remotes.filter(
          (element) => filtered.none((e) => e.pkgName == element.pkgName));
      if (keyword != null) {
        filtered =
            filtered.filter((element) => element.displayName.contains(keyword));
        updates =
            updates.filter((element) => element.displayName.contains(keyword));
        deprecated = deprecated
            .filter((element) => element.displayName.contains(keyword))
            .toSet();
        notInstalled = notInstalled
            .filter((element) => element.displayName.contains(keyword));
      }
      return Extensions(
        updates: updates.toSet(),
        deprecated: deprecated,
        installed: filtered.toSet(),
        notInstalled: notInstalled.toSet(),
      );
    });
  }

  Future<Extensions> asFuture(String? keyword) {
    return asStream(keyword).first;
  }
}

class Extensions {
  final Set<Extension> updates;
  final Set<Extension> deprecated;
  final Set<Extension> installed;
  final Set<RemoteExtension> notInstalled;

  Extensions({
    required this.updates,
    required this.deprecated,
    required this.installed,
    required this.notInstalled,
  });
}
