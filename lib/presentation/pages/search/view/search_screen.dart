import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/bloc/boards_picker_cubit.dart';
import 'package:news_hub/presentation/pages/search/bloc/search_bar_cubit.dart';
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart';
import 'package:news_hub/presentation/pages/search/view/boards_picker_screen.dart';
import 'package:news_hub/presentation/pages/search/view/search_bar_view.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => sl<SearchCubit>(),
      child: _SearchScreen(),
    );
  }
}

class _SearchScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchCubit>();
    final boardsTotal = cubit.state.filter.boardsTotal();
    return Scaffold(
      appBar: AppBar(
        title: Text("搜尋"),
        actions: [
          TextButton(
            child: Text("重設"),
            onPressed: () => cubit.reset(),
          ),
        ],
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: _buildSearchBar(context, cubit),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.search_outlined),
                label: const Text('開始搜尋'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBoardsPicker(BuildContext context, SearchCubit cubit) async {
    final chosenBoardsSorting = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: BlocProvider<BoardsPickerCubit>(
            create: (context) => sl<BoardsPickerCubit>()..init(initialChosenBoardsSorting: cubit.state.filter.boardsSorting),
            child: BoardsPickerScreen(),
          ),
        );
      },
    );
    if (chosenBoardsSorting != null) {
      cubit.setBoardsSorting(chosenBoardsSorting);
    }
  }

  Widget _buildSearchBar(BuildContext context, SearchCubit cubit) {
    return BlocProvider<SearchBarCubit>(
      create: (context) => sl<SearchBarCubit>()..init(initialKeywords: cubit.state.filter.keywords),
      child: SearchBarView(
        onChanged: (value) => cubit.setKeywords(value),
        boardsTotal: cubit.state.filter.boardsTotal(),
      ),
    );
  }
}
