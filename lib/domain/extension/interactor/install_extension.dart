import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';

enum InstallStatus {
  downloading,
  installing,
  completed,
  failed,
}

@lazySingleton
class InstallExtension {
  final ApiService _service;
  InstallExtension({
    required ApiService service,
  }) : _service = service;

  Stream<Pair<InstallStatus, double>> call(Extension extension) async* {
    yield Pair(InstallStatus.installing, 0.0);
    try {
      await _service.installExtension(extension: extension);
      yield Pair(InstallStatus.completed, 1.0);
    } catch (e) {
      yield Pair(InstallStatus.failed, 0.0);
    }
  }
}
