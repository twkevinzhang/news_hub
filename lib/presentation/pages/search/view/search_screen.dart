import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/bloc/boards_picker_cubit.dart';
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart';
import 'package:news_hub/presentation/pages/search/view/boards_picker_screen.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';

final _formKey = GlobalKey<FormState>();

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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      final cubit = context.read<SearchCubit>();
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
                      child:  Row(
                        spacing: 8,
                        children: [
                          ActionChip(
                            avatar: Icon(Icons.filter_alt),
                            label: Text('Boards'),
                            onPressed: () => _showBoardsPicker(context, state),
                          ),
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
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: '在 ? 個版面中搜尋',
                          helperText: '請輸入要搜尋的關鍵字',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                        onSaved: cubit.setKeywords,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                title: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text('開始搜尋'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void _showBoardsPicker(BuildContext context, SearchState state) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: BlocProvider<BoardsPickerCubit>(
            create: (context) => sl<BoardsPickerCubit>()..init(initialChosenBoardsSorting: state.filter.boardsSorting),
            child: BoardsPickerScreen(),
          ),
        );
      },
    );
  }
}
