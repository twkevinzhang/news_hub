import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UninstallExtension {
  final ApiService _service;
  UninstallExtension({
    required ApiService service,
  })  : _service = service;

  Future<void> call(Extension extension) {
    return _service.uninstallExtension(extension: extension);
  }
}
