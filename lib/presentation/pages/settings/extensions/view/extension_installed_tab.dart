import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/presentation/pages/settings/extensions/bloc/extension_cubit.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';

class ExtensionInstalledTab extends StatelessWidget {
  const ExtensionInstalledTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtensionCubit, ExtensionState>(
      buildWhen: (previous, current) =>
          previous.extensions != current.extensions,
      builder: (context, state) {
        return state.extensions.when(
          completed: (data) => data.installed.isEmpty
              ? const Center(child: Text('No extensions installed'))
              : ListView.builder(
                  itemCount: data.installed.length,
                  itemBuilder: (context, index) {
                    final extension = data.installed.elementAt(index);
                    return _ExtensionTile(extension: extension);
                  },
                ),
          error: (e) => Center(child: Text(e.toString())),
          initial: () => const SizedBox(),
          loading: () => const LoadingIndicator(),
        );
      },
    );
  }
}

class _ExtensionTile extends StatelessWidget {
  final Extension extension;

  const _ExtensionTile({required this.extension});

  @override
  Widget build(BuildContext context) {
    final pkgName = extension.pkgName;
    final displayName = extension.displayName;

    final installing = context
        .select<ExtensionCubit, Pair<InstallStatus, double>?>(
          (c) => c.state.installingExtensions[pkgName],
        );

    return ListTile(
      title: Text(displayName),
      subtitle: installing != null
          ? LinearProgressIndicator(value: installing.second)
          : Text(pkgName),
      trailing: installing != null
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmUninstall(
                context,
                context.read<ExtensionCubit>(),
                extension,
              ),
            ),
    );
  }

  void _confirmUninstall(
    BuildContext context,
    ExtensionCubit cubit,
    Extension extension,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Uninstall Extension'),
        content: Text(
          'Are you sure you want to uninstall ${extension.displayName}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
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
