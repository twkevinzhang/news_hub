import 'package:news_hub/domain/extension/interactor/list_available_extensions.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/extension/model/index.dart';
import 'package:news_hub/app/extension/service/preferences_impl.dart';
import 'package:rxdart/rxdart.dart';

class ListExtensions {
  final ExtensionPreferences _extensionPreferences;
  final ListInstalledExtensions _listInstalledExtensions;
  final ListAvailableExtensions _listAvailableExtensions;
  ListExtensions({
    required ExtensionPreferences extensionPreferences,
    required ListInstalledExtensions listInstalledExtensions,
    required ListAvailableExtensions listAvailableExtensions,
  }): _extensionPreferences = extensionPreferences,
        _listInstalledExtensions = listInstalledExtensions,
        _listAvailableExtensions = listAvailableExtensions;

  Stream<Extensions> call() {
    return CombineLatestStream.combine3(
      _extensionPreferences.enabledLanguages().changes(),
      _listInstalledExtensions.call().asStream(),
      _listAvailableExtensions.call().asStream(),
      (enabledLanguages, installed, available) =>
        Extensions(
          updates: [],
          installed: installed,
          available: available,
        )
    );
  }
}

class Extensions {
  final List<InstalledExtension> updates;
  final List<InstalledExtension> installed;
  final List<AvailableExtension> available;

  Extensions({
    required this.updates,
    required this.installed,
    required this.available,
  });
}
