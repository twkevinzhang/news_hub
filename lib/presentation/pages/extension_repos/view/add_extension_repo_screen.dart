import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/extension_repos/bloc/add_extension_repo_cubit.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:news_hub/shared/models.dart';

@RoutePage()
class AddExtensionRepoScreen extends StatelessWidget implements AutoRouteWrapper {
  const AddExtensionRepoScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddExtensionRepoCubit>()..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddExtensionRepoCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Extension Repo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: cubit.textEditingController,
              focusNode: cubit.focusNode,
              decoration: InputDecoration(
                labelText: 'index url',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => cubit.clearForm(),
                  icon: const Icon(Icons.clear),
                ),
                errorText: cubit.state.remoteRepo.maybeWhen(orElse: () => null, error: (e) => e.toString()),
              ),
              onChanged: cubit.onChanged,
              onTapOutside: cubit.onTapOutside,
            ),
          ),
          cubit.state.remoteRepo.when(
            initial: () => _buildOutlineButtonTile(context, cubit.fetchExtensionRepo, const Text('Check it')),
            loading: () => _buildOutlineButtonTile(context, null, const CircularProgressIndicator()),
            error: (exception) => _buildOutlineButtonTile(context, null, Text(exception.toString())),
            completed: (repo) => Column(
              children: [
                _buildOutlineButtonTile(context, null, const Text('已完成載入')),
                Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Repository Header
                        Row(
                          children: [
                            if (repo.icon != null) ...[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Theme.of(context).colorScheme.surfaceVariant,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: CachedNetworkImage(
                                  imageUrl: repo.icon!,
                                  width: 48,
                                  height: 48,
                                  placeholder: (context, url) => const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    repo.displayName,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  ...[
                                    const SizedBox(height: 4),
                                    Text(
                                      repo.website,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: Theme.of(context).colorScheme.primary,
                                          ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Repository Details
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoRow(
                                context,
                                "Base URL",
                                repo.baseUrl,
                                Icons.link,
                              ),
                              const SizedBox(height: 16),
                              _buildInfoRow(
                                context,
                                "Signing Key",
                                repo.signingKeyFingerprint,
                                Icons.key,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                cubit.state.addResult.when(
                  initial: () => _buildFilledButton(
                    context,
                    cubit.addExtensionRepo,
                    const Text('Add Repo'),
                  ),
                  loading: () => _buildFilledButton(
                    context,
                    null,
                    CircularProgressIndicator(),
                  ),
                  completed: (r) => _buildFilledButton(
                    context,
                    null,
                    Text('已完成加入'),
                  ),
                  error: (exception) => _buildFilledButton(
                    context,
                    null,
                    Text(exception.toString()),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonTile(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildOutlineButtonTile(BuildContext context, void Function()? onPressed, Widget child) {
    return _buildButtonTile(
      context,
      OutlinedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  Widget _buildFilledButton(BuildContext context, void Function()? onPressed, Widget child) {
    return _buildButtonTile(
      context,
      FilledButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
