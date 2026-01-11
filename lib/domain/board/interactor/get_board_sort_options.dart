import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@injectable
class GetBoardSortOptions {
  final BoardRepository _repository;

  GetBoardSortOptions(this._repository);

  Future<Map<String, List<String>>> call(List<Board> boards) {
    return _repository.getBoardSortOptions(boards);
  }
}
