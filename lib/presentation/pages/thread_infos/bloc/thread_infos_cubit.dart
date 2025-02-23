import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/models.dart';

part 'thread_infos_cubit.freezed.dart';

@freezed
class ThreadInfosState with _$ThreadInfosState {
  const factory ThreadInfosState({
    ThreadsFilter? filter,
    ThreadsSorting? sorting,
  }) = _ThreadInfosState;
}

@injectable
class ThreadInfosCubit extends Cubit<ThreadInfosState> {
  final ListThreadInfos _listThreadInfos;
  final PagingController<int, ThreadWithExtension> pagingController;

  static const _pageSize = 10;

  ThreadInfosCubit({
    required ListThreadInfos listThreadInfos,
  })  : _listThreadInfos = listThreadInfos,
        pagingController = PagingController(firstPageKey: 1),
        super(ThreadInfosState(
          filter: null,
          sorting: null,
        )) {
    pagingController.addPageRequestListener(_loadThreadInfos);
  }

  set filter(ThreadsFilter? filter) {
    emit(state.copyWith(filter: filter));
  }

  set sorting(ThreadsSorting? sorting) {
    emit(state.copyWith(sorting: sorting));
  }

  void init({
    ThreadsFilter? filter,
    ThreadsSorting? sorting,
  }) {
    emit(state.copyWith(
      filter: filter,
      sorting: sorting,
    ));
  }

  void _loadThreadInfos(int pageKey) async {
    try {
      final result = await _listThreadInfos.call(
        filter: state.filter,
        sorting: state.sorting,
        pagination: Pagination(
          page: pageKey,
          pageSize: _pageSize,
        ),
      );

      final isLastPage = result.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(result);
      } else {
        final nextPageKey = pageKey + result.length;
        pagingController.appendPage(result, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  void refresh() {
    pagingController.refresh();
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
