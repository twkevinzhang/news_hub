part of '../index.dart';

@lazySingleton
class ListThreads {
  final ExtensionApiService _apiService;
  final ListInstalledExtensions _listInstalledExtensions;
  ListThreads({
    required ExtensionApiService apiService,
    required ListInstalledExtensions listInstalledExtensions,
  }): _apiService = apiService,
        _listInstalledExtensions = listInstalledExtensions;

  Future<List<Thread>> call() async {
    final extensions = await _listInstalledExtensions.call();
    final threads = await Future.wait(extensions.map((e) => _apiService.threads(e, "", "")));
    return threads.expand((element) => element).toList();
  }
}
