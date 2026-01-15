import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/presentation/pages/settings/extensions/bloc/extension_cubit.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';

class ExtensionBrowseTab extends StatelessWidget {
  const ExtensionBrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtensionCubit, ExtensionState>(
      buildWhen: (previous, current) =>
          previous.extensions != current.extensions,
      builder: (context, state) {
        return state.extensions.when(
          completed: (data) {
            final List<dynamic> allExtensions = [
              ...data.installed,
              ...data.notInstalled,
            ];
            if (allExtensions.isEmpty) {
              return const Center(child: Text('No extensions found'));
            }
            return ListView.builder(
              itemCount: allExtensions.length,
              itemBuilder: (context, index) {
                final dynamic extension = allExtensions[index];
                final String pkgName = extension.pkgName;
                final String displayName = extension.displayName;

                final isInstalled = data.installed.any(
                  (i) => i.pkgName == pkgName,
                );
                return _ExtensionTile(
                  pkgName: pkgName,
                  displayName: displayName,
                  extension: extension is Extension
                      ? extension
                      : Extension(
                          pkgName: extension.pkgName,
                          displayName: extension.displayName,
                          version: extension.version,
                          pythonVersion: extension.pythonVersion,
                          lang: extension.lang,
                          isNsfw: extension.isNsfw,
                        ),
                  isInstalled: isInstalled,
                );
              },
            );
          },
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
  final String pkgName;
  final String displayName;
  final bool isInstalled;

  const _ExtensionTile({
    required this.extension,
    required this.pkgName,
    required this.displayName,
    required this.isInstalled,
  });

  @override
  Widget build(BuildContext context) {
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
          : isInstalled
          ? const OutlinedButton(onPressed: null, child: Text('Installed'))
          : ElevatedButton(
              child: const Text('Install'),
              onPressed: () =>
                  context.read<ExtensionCubit>().installExtension(extension),
            ),
    );
  }
}
