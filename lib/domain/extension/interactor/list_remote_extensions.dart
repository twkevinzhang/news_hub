import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
// TODO: 從 extensions repo 取得可安裝的 extensions 清單
class ListRemoteExtensions {
  final ApiService _service;
  ListRemoteExtensions({
    required ApiService service,
  })  : _service = service;

  Future<List<RemoteExtension>> call() async {
    return [];
  }
}
