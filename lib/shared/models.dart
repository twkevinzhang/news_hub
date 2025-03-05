import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@Freezed(toJson: true)
class Pagination with _$Pagination {
  const factory Pagination({
    int? page,
    int? pageSize,
    int? limit,
    String? prevCursor,
    String? nextCursor,
  }) = _Pagination;
}

@freezed
abstract class Result<R> with _$Result<R> {
  const factory Result.initial() = ResultInitial;
  const factory Result.loading() = ResultLoading;
  const factory Result.completed(R data) = ResultCompleted;
  const factory Result.error(Exception exception) = ResultError;
}
