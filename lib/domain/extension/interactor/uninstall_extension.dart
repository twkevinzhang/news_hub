import 'package:news_hub/domain/extension/extension_install_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UninstallExtension {
  final ExtensionInstallService _installService;
  UninstallExtension({
    required ExtensionInstallService installService,
  }) : _installService = installService;

  Future<void> call(Extension extension) {
    return _installService.uninstall(extension);
  }
}
