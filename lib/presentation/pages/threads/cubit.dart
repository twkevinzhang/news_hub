import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/cubit.dart';
import 'package:news_hub/presentation/pages/search/index.dart';
import 'package:news_hub/presentation/router.dart';
import 'package:news_hub/presentation/router.gr.dart';
import 'package:news_hub/presentation/widgets/post_card.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'cubit.g.dart';

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
