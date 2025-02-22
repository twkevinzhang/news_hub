import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/models.dart';

part 'models.freezed.dart';

@freezed
class ThreadsFilter with _$ThreadsFilter {
  const factory ThreadsFilter({
    required Set<String> extensionPkgNames,
    required Set<String> boardIds,
    required String? keywords,
  }) = _ThreadsFilter;
}

@freezed
class ThreadsSorting with _$ThreadsSorting {
  const factory ThreadsSorting({
    required List<String> boardsOrder,
    required Map<String, String> threadsSorting,
  }) = _ThreadsSorting;
}
