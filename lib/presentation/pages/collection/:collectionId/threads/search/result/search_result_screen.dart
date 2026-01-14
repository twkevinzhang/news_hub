import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_layout.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/search/result/bloc/search_result_cubit.dart';

@RoutePage()
class SearchResultScreen extends StatelessWidget {
  final String collectionId;
  final ThreadsFilter filter;

  const SearchResultScreen({
    super.key,
    required this.collectionId,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchResultCubit>()..init(collectionId, filter),
      child: Scaffold(
        appBar: AppBar(title: Text('搜尋：${filter.keywords}')),
        body: BlocBuilder<SearchResultCubit, SearchResultState>(
          builder: (context, state) {
            return PagedListView<int, SingleImagePostWithExtension>(
              pagingController: context
                  .read<SearchResultCubit>()
                  .pagingController,
              builderDelegate:
                  PagedChildBuilderDelegate<SingleImagePostWithExtension>(
                    itemBuilder: (context, item, index) =>
                        SingleImagePostCard(thread: item),
                    noItemsFoundIndicatorBuilder: (context) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '找不到符合 "${filter.keywords}" 的結果',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
            );
          },
        ),
      ),
    );
  }
}
