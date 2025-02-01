import 'package:news_hub/domain/extension_repo/api_service.dart';
import 'package:news_hub/domain/model/index.dart';
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
