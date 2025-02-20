import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/extension_repos/bloc/extension_repos_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';

@RoutePage()
class ExtensionReposScreen extends StatelessWidget {
  const ExtensionReposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExtensionReposCubit>()..init(),
      child: _ExtensionReposView(),
    );
  }
}

class _ExtensionReposView extends StatelessWidget {
  _ExtensionReposView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtensionReposCubit, ExtensionReposState>(
        builder: (context, state) {
      final cubit = context.read<ExtensionReposCubit>();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Extension Repos'),
        ),
        body: state.repos.when(
          initial: () => const LoadingIndicator(),
          loading: () => const LoadingIndicator(),
          error: (exception) => Center(
            child: Text(exception.toString()),
          ),
          completed: (repos) => ListView.builder(
            itemCount: repos.length,
            itemBuilder: (context, index) {
              final repo = repos[index];
              return ListTile(
                title: Text(repo.displayName),
                subtitle: Text(repo.baseUrl),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    cubit.deleteExtensionRepo(repo.baseUrl);
                  },
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () {
            AutoRouter.of(context).push(AddExtensionRepoRoute());
            // Navigator.of(context).push(MaterialPageRoute<void>(
            //     builder: (BuildContext context) {
            //       return AddExtensionRepoDialog();
            //     },
            //     fullscreenDialog: true));
          },
        ),
      );
    });
  }
}
