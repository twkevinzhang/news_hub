import 'package:flutter/material.dart';
import 'package:news_hub/presentation/widgets/molecules/reactive_text_form_field.dart';
import 'package:news_hub/presentation/widgets/molecules/text_field_anchor.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

class AppSearchBar extends StatelessWidget {
  final int boardsTotal;
  final String value;
  final Function(String?) onChanged;
  final Function(domain.Suggestion) onSelected;
  final Function() onClear;
  const AppSearchBar({
    super.key,
    required this.value,
    required this.boardsTotal,
    required this.onChanged,
    required this.onSelected,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final mockItems = [
      domain.Suggestion(
        id: "1",
        keywords: 'Text',
        latestUsedAt: DateTime.now(),
      ),
      domain.Suggestion(
        id: "2",
        keywords: 'Content',
        latestUsedAt: DateTime.now(),
      ),
      domain.Suggestion(
        id: "3",
        keywords: 'Maybe',
        latestUsedAt: DateTime.now(),
      ),
    ];
    return Column(
      children: [
        TextFieldAnchor(
          textFieldBuilder: (focusNode) {
            return ReactiveTextFormField(
              focusNode: focusNode,
              decoration: InputDecoration(
                label: Text('在 $boardsTotal 個版面中搜尋'),
                helperText: '請輸入關鍵字',
                prefixIcon: Icon(Icons.search_outlined),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.cancel_outlined),
                  onPressed: onClear,
                ),
              ),
              value: value,
              onChanged: onChanged,
            );
          },
          items: mockItems,
          onSelected: (index) {
            onSelected(mockItems[index]);
            return false;
          },
          itemBuilder: (index) {
            return ListTile(
              title: Text(mockItems[index].keywords),
              trailing: Icon(Icons.add_outlined),
            );
          },
        ),
      ],
    );
  }
}
