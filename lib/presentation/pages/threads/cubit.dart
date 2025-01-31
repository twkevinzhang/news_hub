part of 'index.dart';

@immutable
@CopyWith()
class ThreadsState extends Equatable {
  final SearchConfigForm? searchConfigForm;

  const ThreadsState({this.searchConfigForm});

  @override
  List<Object?> get props => [searchConfigForm];
}

@lazySingleton
class ThreadsCubit extends Cubit<ThreadsState> {
  final ListThreads _listThreads;
  final PagingController<int, ThreadWithExtension> _pagingController;
  get pagingController => _pagingController;

  static const _pageSize = 10;

  ThreadsCubit({
    required ListThreads listThreads,
  })  : _listThreads = listThreads,
        _pagingController = PagingController(firstPageKey: 1),
        super(const ThreadsState()) {
    _pagingController.addPageRequestListener(_loadThreads);
  }

  set searchConfigForm(SearchConfigForm? searchConfigForm) {
    emit(state.copyWith(searchConfigForm: searchConfigForm));
  }

  void _loadThreads(int pageKey) async {
    try {
      final result = await _listThreads.call(
        searchConfigForm: state.searchConfigForm,
        pagination: Pagination(
          page: pageKey,
          pageSize: _pageSize,
        ),
      );

      final isLastPage = result.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(result);
      } else {
        final nextPageKey = pageKey + result.length;
        _pagingController.appendPage(result, nextPageKey);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  Future<void> close() {
    _pagingController.dispose();
    return super.close();
  }
}
