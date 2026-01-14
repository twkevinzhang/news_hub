import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/components/rendering/boards-picker/boards_picker.dart';

import '../bloc/search_cubit.dart';

@RoutePage()
class SearchScreen extends StatelessWidget implements AutoRouteWrapper {
  final _formKey = GlobalKey<FormState>(debugLabel: '_SearchScreen');

  SearchScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>()..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchCubit>();
    final boardsTotal = cubit.state.filter.boardsTotal();
    return Scaffold(
      appBar: AppBar(title: const Text("搜尋")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text('搜尋範圍'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Row(
                    spacing: 8,
                    children: [
                      if (boardsTotal > 0)
                        ActionChip(
                          avatar: const Icon(Icons.filter_alt),
                          label: Text('Boards ($boardsTotal)'),
                          onPressed: () => _showBoardsPicker(context, cubit),
                        )
                      else
                        ActionChip(
                          avatar: const Icon(Icons.filter_alt_outlined),
                          label: const Text('Boards'),
                          onPressed: () => _showBoardsPicker(context, cubit),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text('關鍵字'),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                //   child: AppSearchBar(
                //     value: cubit.state.filter.keywords ?? '',
                //     boardsTotal: cubit.state.filter.boardsTotal(),
                //     onChanged: (value) => cubit.setKeywords(value ?? ''),
                //     onSelected: (suggestion) => cubit.clickSuggestion(suggestion),
                //     onClear: () => cubit.clearKeywords(),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => cubit.reset(),
                      child: const Text("重設"),
                    ),
                  ),
                  const SizedBox(width: 16), // 按鈕之間的間距
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => _onSubmit(context, cubit),
                      icon: const Icon(Icons.search_outlined),
                      label: const Text('開始搜尋'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBoardsPicker(BuildContext context, SearchCubit cubit) async {
    final result = await showDialog<BoardsPickerResult>(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: BlocProvider<BoardsPickerCubit>(
            create: (context) =>
                sl<BoardsPickerCubit>()
                  ..init(chosenBoards: cubit.state.filter.boardSorts),
            child: const BoardsPickerScreen(),
          ),
        );
      },
    );
    if (result != null) {
      cubit.setBoardSorts(result.chosenBoards);
    }
  }

  void _onSubmit(BuildContext context, SearchCubit cubit) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      cubit.submit();
      // TODO: 搜尋結果導航需要 collectionId，這裡應根據搜尋情境動態提供
      // 暫時帶入一個空字串或從 filter 中取得（如果有的話）
      // 根據需求描述，搜尋通常是跨集合的或針對特定集合。這裡暫時修復編譯報錯。
      AutoRouter.of(context).push(CollectionThreadListRoute(collectionId: ''));
    }
  }
}
