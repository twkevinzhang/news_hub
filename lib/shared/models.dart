import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

class Pagination {
  // for offset-based pagination
  final int? page;
  final int? pageSize;
  // for cursor-based pagination
  final int? limit;
  final String? prevCursor;
  final String? nextCursor;

  Pagination({
    this.page,
    this.limit,
    this.pageSize,
    this.prevCursor,
    this.nextCursor,
  });
}

@freezed
abstract class Result<R> with _$Result<R> {
  const factory Result.initial() = ResultInitial;
  const factory Result.loading() = ResultLoading;
  const factory Result.completed(R data) = ResultCompleted;
  const factory Result.error(Exception exception) = ResultError;
}
