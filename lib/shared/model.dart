class Pagination {
  final int? page;
  final int? limit;
  final int? pageSize;
  final String? prevCursor;
  final String? nextCursor;

  Pagination({this.page, this.limit, this.pageSize, this.prevCursor, this.nextCursor});
}
