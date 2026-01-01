import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/extension_repos/bloc/extension_repos_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/shared/shared.dart';

@RoutePage()
class ExtensionReposScreen extends StatelessWidget implements AutoRouteWrapper {
  const ExtensionReposScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExtensionReposCubit>()..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExtensionReposCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: AutoLeadingButton(),
        title: const Text('Extension Repos'),
      ),
      body: cubit.state.repos.when(
        initial: () => const LoadingIndicator(),
        loading: () => const LoadingIndicator(),
        error: (exception) => Center(
          child: Text(exception.toString()),
        ),
        completed: (repos) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: repos.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final repo = repos[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
                child: repo.icon != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: repo.icon!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const LoadingIndicator(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.extension_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.extension_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24,
                      ),
              ),
              title: Text(
                repo.displayName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    repo.baseUrl,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
              trailing: IconButton.outlined(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Repository'),
                      content: Text('Are you sure you want to delete "${repo.displayName}"?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            cubit.deleteExtensionRepo(repo.baseUrl);
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
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
        },
      ),
    );
  }
}
