import 'package:flutter/material.dart';

class GreyText extends StatelessWidget {
  final String text;

  const GreyText(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(color: Colors.grey));
  }
}
