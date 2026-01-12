import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@injectable
class GetCollectionBoard {
  final BoardRepository _repository;

  GetCollectionBoard(this._repository);

  Future<CollectionBoard> call({required String boardId, required String collectionId}) {
    return _repository.getCollectionBoard(boardId: boardId, collectionId: collectionId);
  }
}
