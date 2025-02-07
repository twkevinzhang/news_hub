import 'package:news_hub/domain/extension_repo/extension_repo_api_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRemoteExtensionRepo {
  GetRemoteExtensionRepo({
    required ExtensionRepoApiService service,
  })  : _service = service;

  final ExtensionRepoApiService _service;

  Future<ExtensionRepo> call(String baseUrl) {
    return _service.detail(baseUrl);
  }
}
