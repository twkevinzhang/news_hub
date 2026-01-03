import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
// TODO: 呼叫 sidecar 自行從 github 下載 class 並安裝
class InstallExtension {
  final ApiService _service;
  InstallExtension({
    required ApiService service,
  })  : _service = service;

  Stream<Pair<InstallStatus, double>> call(Extension extension) async* {
   _service.installExtension(zipUrl, extension);
   return _service.getInstallProgress(extension.pkgName);
  }
}
