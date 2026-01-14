import 'package:news_hub/domain/models/collection/collection_board.dart';

class Collection {
  final String id;
  final String name;
  final List<CollectionBoard> boards;

  Collection({required this.id, required this.name, required this.boards});
}
