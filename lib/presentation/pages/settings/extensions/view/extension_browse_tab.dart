import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/presentation/pages/settings/extensions/bloc/extension_cubit.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';

class ExtensionBrowseTab extends StatelessWidget {
  const ExtensionBrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExtensionCubit>();
    return cubit.state.extensions.when(
      completed: (data) {
        final allExtensions = [...data.installed, ...data.notInstalled];
        if (allExtensions.isEmpty) {
          return const Center(child: Text('No extensions found'));
        }
        return ListView(
          children: [
            ...allExtensions.map((e) {
              final installing = cubit.state.installingExtensions[e.pkgName];
              final isInstalled = data.installed.any((i) => i.pkgName == e.pkgName);

              return ListTile(
                title: Text(e.displayName),
                subtitle: installing != null ? LinearProgressIndicator(value: installing.second) : Text(e.pkgName),
                trailing: installing != null
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : isInstalled
                        ? const OutlinedButton(
                            onPressed: null, // Disabled or click to open?
                            child: Text('Installed'),
                          )
                        : ElevatedButton(
                            child: const Text('Install'),
                            onPressed: () {
                              cubit.installExtension(e);
                            },
                          ),
              );
            })
          ],
        );
      },
      error: (e) => Center(child: Text(e.toString())),
      initial: () => const SizedBox(),
      loading: () => const LoadingIndicator(),
    );
  }
}
