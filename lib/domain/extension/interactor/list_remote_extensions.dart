import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
// TODO: 從 sidecar 取得可安裝的 extension 清單
class ListRemoteExtensions {
  ListRemoteExtensions() ;

  Future<List<RemoteExtension>> call() async {
    return [];
  }
}
