import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/collection/board_identity.dart';

part 'collection_board.freezed.dart';

/// Collection 中的看板（必定有 collectionId）
@freezed
class CollectionBoard with _$CollectionBoard {
  const factory CollectionBoard({
    required BoardIdentity identity,
    required String collectionId,
    String? selectedSort,
  }) = _CollectionBoard;
}
