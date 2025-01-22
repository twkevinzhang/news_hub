import 'package:flutter/material.dart';

class LargeTitle extends StatelessWidget {
  final String title; // 接受參數

  const LargeTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.titleLarge);
  }
}
