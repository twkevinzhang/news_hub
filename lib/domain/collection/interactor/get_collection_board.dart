import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/shared/models.dart';

@injectable
class GetCollectionBoard {
  final BoardRepository _repository;

  GetCollectionBoard(this._repository);

  Future<Result<CollectionBoard>> call({
    required String boardId,
    required String collectionId,
  }) async {
    try {
      final board = await _repository.getCollectionBoard(
        boardId: boardId,
        collectionId: collectionId,
      );
      return Result.completed(board);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}
