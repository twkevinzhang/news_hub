import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({String? message, super.key})
      : _message = message ?? 'EmptyScreen';

  final String _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empty"),
      ),
      body: Center(child: Text(_message)),
    );
  }
}
