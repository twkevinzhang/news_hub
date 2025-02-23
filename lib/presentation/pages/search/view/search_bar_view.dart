import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/app/service/database/database.dart';
import 'package:news_hub/presentation/pages/search/bloc/search_bar_cubit.dart';
import 'package:news_hub/presentation/widgets/molecules/text_field_anchor.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

class SearchBarView extends StatelessWidget {
  final int boardsTotal;
  final Function(String?) onChanged;
  const SearchBarView({
    super.key,
    required this.boardsTotal,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchBarCubit>();
    final mockItems = [
      domain.Suggestion(
        id: "1",
        keywords: 'test',
        latestUsedAt: DateTime.now(),
      ),
      domain.Suggestion(
        id: "2",
        keywords: 'test2',
        latestUsedAt: DateTime.now(),
      ),
      domain.Suggestion(
        id: "3",
        keywords: 'test3',
        latestUsedAt: DateTime.now(),
      ),
    ];
    return TextFieldAnchor(
      textFieldBuilder: (focusNode) {
        return TextField(
          controller: cubit.textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            label: Text('在 ${boardsTotal} 個版面中搜尋'),
            helperText: '請輸入關鍵字',
            prefixIcon: Icon(Icons.search_outlined),
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.cancel_outlined),
              onPressed: () => cubit.clear(),
            ),
          ),
          onChanged: (value) {
            onChanged(value);
          },
        );
      },
      items: mockItems,
      onSelected: (index) {
        cubit.clickSuggestion(suggestion: mockItems[index]);
        return false;
      },
      itemBuilder: (index) {
        return ListTile(
          title: Text(mockItems[index].keywords),
          trailing: Icon(Icons.add_outlined),
        );
      },
    );
  }
}
