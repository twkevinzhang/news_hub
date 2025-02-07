class Pagination {
  // for offset-based pagination
  final int? page;
  final int? pageSize;
  // for cursor-based pagination
  final int? limit;
  final String? prevCursor;
  final String? nextCursor;

  Pagination({this.page, this.limit, this.pageSize, this.prevCursor, this.nextCursor});
}
