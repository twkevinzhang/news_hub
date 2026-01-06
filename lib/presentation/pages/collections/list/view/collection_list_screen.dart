import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CollectionListScreen extends StatelessWidget {
  const CollectionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Collections')),
      body: const Center(child: Text('Collections List (Placeholder)')),
    );
  }
}
