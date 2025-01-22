part of 'index.dart';

@preResolve
@LazySingleton(as: ExtensionInstallService)
class MockExtensionInstallServiceImpl extends ExtensionInstallService {
  final String _downloadFolder;
  final String _installFolder;

  MockExtensionInstallServiceImpl._(this._downloadFolder, this._installFolder);
  @factoryMethod
  static Future<ExtensionInstallService> create() async {
    WidgetsFlutterBinding.ensureInitialized();
    final directory = await getApplicationSupportDirectory();
    final d = [directory.path, downloadedFileFolder].toUrl();
    final i = [directory.path, installedFileFolder].toUrl();
    return MockExtensionInstallServiceImpl._(d, i);
  }

  @override
  Stream<Pair<String, int>> download(String zipUrl, Extension extension) async* {
    throw UnimplementedError();
  }

  @override
  Stream<String> install(Extension extension) async* {
    throw UnimplementedError();
  }

  @override
  Future<void> uninstall(Extension extension) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Extension>> listInstalledExtensions() async {
    print("MockExtensionInstallServiceImpl listInstalledExtensions");
    return List<Extension>.generate(3, (index) => Extension.mock());
  }
}
