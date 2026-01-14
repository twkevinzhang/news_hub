import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

class Bookmark {
  final String id;
  final ThreadsFilter filter;
  final ThreadsSorting sorting;

  Bookmark({required this.id, required this.filter, required this.sorting});
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
