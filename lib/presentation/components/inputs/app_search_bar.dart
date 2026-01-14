import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final VoidCallback onSearch;
  final String? hintText;
  final bool autoFocus;

  const AppSearchBar({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onClear,
    required this.onSearch,
    this.hintText,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    // This is a controlled component
    return TextField(
      controller: TextEditingController(text: value)
        ..selection = TextSelection.collapsed(offset: value.length),
      autofocus: autoFocus,
      onChanged: onChanged,
      onSubmitted: (_) => onSearch(),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hintText ?? '搜尋...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: value.isNotEmpty
            ? IconButton(icon: const Icon(Icons.clear), onPressed: onClear)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
