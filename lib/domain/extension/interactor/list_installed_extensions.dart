import 'package:news_hub/domain/extension/model/index.dart';
import 'package:news_hub/domain/extension/service/extension_installer.dart';
import 'package:news_hub/domain/extension_repo/repo/extension_repo_repository.dart';
import 'package:news_hub/domain/extension_repo/service/extension_repo_service.dart';
import 'package:collection/collection.dart';

class ListInstalledExtensions {
  final ExtensionInstaller _service;
  ListInstalledExtensions({
    required ExtensionInstaller service,
  }): _service = service;

  Future<List<InstalledExtension>> call() async {
    final list = await _service.listInstalledExtensions();
    return list.whereType<LoadResultSuccess>().map((e) => e.extension).toList();
  }
}
