import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';

@injectable
class GetBoardSortOptions {
  final BoardRepository _repository;

  GetBoardSortOptions(this._repository);

  Future<Result<Map<String, List<String>>>> call(List<Board> boards) async {
    try {
      final map = await _repository.getBoardSortOptions(boards);
      return Result.completed(map);
    } catch (e) {
      return Result.error(Failure.fromError(e));
    }
  }
}
