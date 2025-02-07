import 'package:news_hub/domain/models/models.dart';

abstract class ExtensionRepoApiService {
  Future<ExtensionRepo> detail(String baseUrl);
  Future<List<RemoteExtension>> extensions(String baseUrl);
  Future<String> zipUrl(Extension extension);
}
