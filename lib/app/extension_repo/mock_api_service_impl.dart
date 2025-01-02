part of 'index.dart';

@LazySingleton(as: ExtensionRepoApiService)
class MockExtensionRepoApiServiceImpl implements ExtensionRepoApiService {
  @override
  Future<ExtensionRepo?> detail(String baseUrl) async {
    return ExtensionRepo.mock();
  }

  @override
  Future<List<RemoteExtension>> extensions(String baseUrl) async {
    return List.generate(5, (index) => RemoteExtension.mock());
  }
}
