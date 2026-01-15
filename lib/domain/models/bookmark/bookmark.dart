import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
class Bookmark with _$Bookmark {
  const factory Bookmark({
    required String id,
    required ThreadsFilter filter,
    required ThreadsSorting sorting,
  }) = _Bookmark;
}

@Freezed(toJson: true)
class ThreadsFilter with _$ThreadsFilter {
  const factory ThreadsFilter({
    required Map<String, String> boardSorts,
    required String keywords,
  }) = _ThreadsFilter;
}

extension ThreadsFilterEx on ThreadsFilter {
  int boardsTotal() {
    final boardIds = boardSorts.keys.toSet();
    return boardIds.length;
  }

  bool get isEmpty {
    return boardSorts.isEmpty && keywords.isEmpty;
  }
}

@Freezed(toJson: true)
class ThreadsSorting with _$ThreadsSorting {
  const factory ThreadsSorting({required List<String> boardsOrder}) =
      _ThreadsSorting;
}
