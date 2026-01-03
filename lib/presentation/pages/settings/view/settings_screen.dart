import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.extension),
            title: const Text('Repo & Extensions'),
            subtitle: const Text('Manage your repositories and extensions'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.router.push(const ExtensionManageRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.collections),
            title: const Text('Collections'),
            subtitle: const Text('Manage your data collections'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.router.push(const CollectionListRoute()),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.monitor_heart_outlined),
            title: const Text('Sidecar Settings'),
            subtitle: const Text('Manage logs and system status settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.router.push(const SidecarManageRoute()),
          ),
        ],
      ),
    );
  }
}
