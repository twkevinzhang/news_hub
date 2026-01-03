import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
// TODO: 從 sidecar 取得已安裝 extension 清單
class GetInstalledExtension {
  final ApiService _service;
  GetInstalledExtension({
    required ApiService service,
  })  : _service = service;


  Future<Extension> get(String extensionPkgName) {
    return _service.getInstalledExtension(extensionPkgName: extensionPkgName);
  }

}
