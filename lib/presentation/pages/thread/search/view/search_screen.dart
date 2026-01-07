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
      appBar: AppBar(
        title: Text("搜尋"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text('搜尋範圍'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      spacing: 8,
                      children: [
                        if (boardsTotal > 0)
                          ActionChip(
                            avatar: Icon(Icons.filter_alt),
                            label: Text('Boards ($boardsTotal)'),
                            onPressed: () => _showBoardsPicker(context, cubit),
                          )
                        else
                          ActionChip(
                            avatar: Icon(Icons.filter_alt_outlined),
                            label: Text('Boards'),
                            onPressed: () => _showBoardsPicker(context, cubit),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => cubit.reset(),
                      child: Text("重設"),
                    ),
                  ),
                  SizedBox(width: 16), // 按鈕之間的間距
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
            create: (context) => sl<BoardsPickerCubit>()..init(chosenBoards: cubit.state.filter.boardsSorting),
            child: const BoardsPickerScreen(),
          ),
        );
      },
    );
    if (result != null) {
      cubit.setBoardsSorting(result.chosenBoards);
    }
  }

  void _onSubmit(BuildContext context, SearchCubit cubit) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      cubit.submit();
      final state = cubit.state;
      AutoRouter.of(context).push(ThreadListRoute(filter: state.filter, sorting: state.sorting));
    }
  }
}
