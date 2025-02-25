import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_instance_manager.dart';
import 'package:news_hub/domain/extension/extension_repository.dart';

@lazySingleton
class RunAllExtensions {
  final ExtensionInstanceManager _manager;
  final InstalledExtensionRepository _extensionRepository;

  RunAllExtensions({
    required ExtensionInstanceManager manager,
    required InstalledExtensionRepository extensionRepository,
  }): _manager = manager,
      _extensionRepository = extensionRepository;

  Future<void> call() async {
    final extensions = await _extensionRepository.list();
    for (final extension in extensions) {
      _manager.runNew(extension);
    }
  }

  Future<void> closeAll() async {
    final extensions = await _extensionRepository.list();
    for (final extension in extensions) {
      _manager.close(extension);
    }
  }
}
