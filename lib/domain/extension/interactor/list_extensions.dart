import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/extension/services/extension_settings.dart';
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';

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

  Stream<Result<Extensions>> asStream(String? keyword) async* {
    yield const Result.loading();
    try {
      // Parallel fetch of extensions snapshots
      final results = await Future.wait([
        _listInstalledExtensions.call(),
        _listRemoteExtensions.call(),
        _prefService.enabledLanguages().get(),
      ]);

      final installedRes = results[0] as Result<List<Extension>>;
      final remotesRes = results[1] as Result<List<RemoteExtension>>;
      final currentLangs = results[2] as Set<String>;

      if (installedRes is ResultError<List<Extension>>) {
        yield Result.error(installedRes.error);
        return;
      }
      if (remotesRes is ResultError<List<RemoteExtension>>) {
        yield Result.error(remotesRes.error);
        return;
      }

      final installed = (installedRes as ResultCompleted<List<Extension>>).data;
      final remotes =
          (remotesRes as ResultCompleted<List<RemoteExtension>>).data;

      // Emit initial value
      yield Result.completed(
        _createExtensions(currentLangs, installed, remotes, keyword),
      );

      // Listen for language changes
      await for (final enabledLanguages
          in _prefService.enabledLanguages().changes()) {
        yield Result.completed(
          _createExtensions(enabledLanguages, installed, remotes, keyword),
        );
      }
    } catch (e) {
      yield Result.error(Failure.fromError(e));
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
    var notInstalled = remotes.toIterable().filter(
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

  Future<Result<Extensions>> asFuture(String? keyword) async {
    return asStream(keyword).firstWhere((element) => element is! ResultLoading);
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
