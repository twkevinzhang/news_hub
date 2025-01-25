import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey));
  }
}