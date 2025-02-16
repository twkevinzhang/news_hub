import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/thread_infos_cubit.dart';
import 'package:news_hub/domain/extension/models/models.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThreadInfosCubit, ThreadInfosState>(builder: (context, state) {
      final cubit = context.read<ThreadInfosCubit>();
      final router = AutoRouter.of(context);
      return Scaffold(
        appBar: AppBar(
          title: ThreadsSearchBar(onSubmitted: (value) {
            cubit.setKeywordsInFilter(keywords: value);
            cubit.refresh();
            router.popForced();
          }),
        ),
        body: Column(
          children: [
            FilterBar(onBoardsFilterClick: () async {
              final filter = await router.push<ThreadsFilter?>(FilterByBoardsRoute());
              if (filter == null) return;
              cubit.setExtensionPkgNamesInFilter(extensionPkgNames: filter.extensionPkgNames);
              cubit.setBoardIdsInFilter(boardIds: filter.boardIds);
            })
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () {
              router.popForced();
            }),
      );
    });
  }
}

class ThreadsSearchBar extends StatefulWidget {
  final Function(String)? onSubmitted;

  const ThreadsSearchBar({
    super.key,
    this.onSubmitted,
  });

  @override
  State<ThreadsSearchBar> createState() => _ThreadsSearchBarState();
}

class _ThreadsSearchBarState extends State<ThreadsSearchBar> {
  int filteredCount = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThreadInfosCubit, ThreadInfosState>(
      listenWhen: (previous, current) => previous.filteredBoardsCount() != current.filteredBoardsCount(),
      listener: (context, state) {
        setState(() {
          filteredCount = state.filteredBoardsCount() ?? 0;
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Theme.of(context).primaryColor),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: filteredCount > 0 ? '在 $filteredCount 個版面中搜尋' : '全域搜尋...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: widget.onSubmitted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBar extends StatelessWidget {
  final Function()? onBoardsFilterClick;

  const FilterBar({
    super.key,
    this.onBoardsFilterClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          BlocBuilder<ThreadInfosCubit, ThreadInfosState>(
            builder: (context, state) {
              final filteredCount = state.filteredBoardsCount();
              if (filteredCount > 0) {
                return ActionChip(
                  avatar: Icon(Icons.filter_alt),
                  label: Text('Boards ($filteredCount)'),
                  onPressed: onBoardsFilterClick,
                );
              } else {
                return ActionChip(
                  avatar: Icon(Icons.filter_alt_outlined),
                  label: Text('Boards'),
                  onPressed: onBoardsFilterClick,
                );
              }
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
