import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SidecarLogsPage extends StatelessWidget {
  const SidecarLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sidecar Logs')),
      body: const Center(child: Text('Sidecar Logs Placeholder')),
    );
  }
}
