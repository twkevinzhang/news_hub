import 'package:news_hub/domain/models/models.dart';

abstract class BoardRepository {
  Future<List<Board>> list(String extensionPkgName);
}
