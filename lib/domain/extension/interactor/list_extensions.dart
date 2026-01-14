import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/extension/services/extension_settings.dart';
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListExtensions {
  final ExtensionSettings _prefService;
  final ListInstalledExtensions _listInstalledExtensions;
  final ListRemoteExtensions _listRemoteExtensions;
  ListExtensions({
    required ExtensionSettings prefService,
    required ListInstalledExtensions listInstalledExtensions,
    required ListRemoteExtensions listRemoteExtensions,
  }) : _prefService = prefService,
       _listInstalledExtensions = listInstalledExtensions,
       _listRemoteExtensions = listRemoteExtensions;

  Stream<Extensions> asStream(String? keyword) async* {
    // Parallel fetch of extensions snapshots
    final installedFuture = _listInstalledExtensions.call();
    final remotesFuture = _listRemoteExtensions.call();

    // Fetch initial languages preference
    final initialLangsFuture = _prefService.enabledLanguages().get();

    final results = await Future.wait([
      installedFuture,
      remotesFuture,
      initialLangsFuture, // Wait for initial langs too
    ]);

    final installed = results[0] as List<Extension>;
    final remotes = results[1] as List<RemoteExtension>;
    final currentLangs = results[2] as Set<String>;

    // Emit initial value
    yield _createExtensions(currentLangs, installed, remotes, keyword);

    // Listen for language changes
    await for (final enabledLanguages
        in _prefService.enabledLanguages().changes()) {
      yield _createExtensions(enabledLanguages, installed, remotes, keyword);
    }
  }

  Extensions _createExtensions(
    Set<String> enabledLanguages,
    List<Extension> installed,
    List<RemoteExtension> remotes,
    String? keyword,
  ) {
    var filtered = installed.toIterable();
    var updates = filtered.where(
      (element) => remotes.any(
        (e) => e.pkgName == element.pkgName && e.version > element.version,
      ),
    );
    var deprecated = filtered.toSet().difference(remotes.toSet());
    var notInstalled = remotes.filter(
      (element) => filtered.none((e) => e.pkgName == element.pkgName),
    );

    if (keyword != null) {
      filtered = filtered.filter(
        (element) => element.displayName.contains(keyword),
      );
      updates = updates.filter(
        (element) => element.displayName.contains(keyword),
      );
      deprecated = deprecated
          .filter((element) => element.displayName.contains(keyword))
          .toSet();
      notInstalled = notInstalled.filter(
        (element) => element.displayName.contains(keyword),
      );
    }
    return Extensions(
      updates: updates.toSet(),
      deprecated: deprecated,
      installed: filtered.toSet(),
      notInstalled: notInstalled.toSet(),
    );
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
