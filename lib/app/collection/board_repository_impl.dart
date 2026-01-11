import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/api/api_service.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@LazySingleton(as: BoardRepository)
class BoardRepositoryImpl implements BoardRepository {
  final ApiService _apiService;

  BoardRepositoryImpl(this._apiService);

  @override
  Future<List<Board>> list(String extensionPkgName) {
    return _apiService.listBoards(extensionPkgName: extensionPkgName);
  }
}
