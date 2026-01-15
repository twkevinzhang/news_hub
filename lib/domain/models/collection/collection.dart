import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/collection/collection_board.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

@freezed
class Collection with _$Collection {
  const factory Collection({
    required String id,
    required String name,
    required List<CollectionBoard> boards,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}
