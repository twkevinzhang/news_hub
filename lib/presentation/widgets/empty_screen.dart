import 'package:flutter/material.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({String? message, super.key}): _message = message ?? 'EmptyScreen';

  final String _message;

  @override
  State<EmptyScreen> createState() => _State();
}

class _State extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empty"),
      ),
      body: Center(child: Text(widget._message)),
    );
  }
}
