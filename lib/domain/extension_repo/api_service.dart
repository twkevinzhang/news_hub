part of 'index.dart';

abstract class ExtensionRepoApiService {
  Future<ExtensionRepo?> detail(String baseUrl);
  Future<List<RemoteExtension>> extensions(String baseUrl);
}
