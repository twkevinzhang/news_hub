import 'package:flutter/material.dart';

class SubheaderTile extends StatelessWidget {
  final String text;

  const SubheaderTile(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(title: Text(text,
        style: theme
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.black54)));
  }
}
