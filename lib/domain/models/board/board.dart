import 'package:freezed_annotation/freezed_annotation.dart';

part 'board.freezed.dart';

@freezed
class Board with _$Board {
  const factory Board({
    required String extensionPkgName,
    required String id,
    required String name,
    required String icon,
    required String largeWelcomeImage,
    required String url,
    required Set<String> sortOptions,
    String? selectedSort,
    String? collectionId,
  }) = _Board;
}
