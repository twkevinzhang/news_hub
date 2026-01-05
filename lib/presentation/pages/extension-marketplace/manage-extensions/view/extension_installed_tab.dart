import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/extension-marketplace/manage-extensions/bloc/extension_cubit.dart';
import 'package:news_hub/presentation/shared/shared.dart';
import 'package:news_hub/shared/models.dart';

class ExtensionInstalledTab extends StatelessWidget {
  const ExtensionInstalledTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExtensionCubit>();
    return cubit.state.extensions.when(
      completed: (data) => data.installed.isEmpty
          ? const Center(child: Text('No extensions installed'))
          : ListView(
              children: [
                ...data.installed.map((e) {
                  final installing = cubit.state.installingExtensions[e.pkgName];
                  return ListTile(
                    title: Text(e.displayName),
                    subtitle: installing != null ? LinearProgressIndicator(value: installing.second) : Text(e.pkgName),
                    trailing: installing != null
                        ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
                        : IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () => _confirmUninstall(context, cubit, e),
                          ),
                  );
                })
              ],
            ),
      error: (e) => Center(child: Text(e.toString())),
      initial: () => const SizedBox(),
      loading: () => const LoadingIndicator(),
    );
  }

  void _confirmUninstall(BuildContext context, ExtensionCubit cubit, Extension extension) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Uninstall Extension'),
        content: Text('Are you sure you want to uninstall ${extension.displayName}?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              cubit.uninstallExtension(extension);
              Navigator.pop(context);
            },
            child: const Text('Uninstall'),
          ),
        ],
      ),
    );
  }
}
