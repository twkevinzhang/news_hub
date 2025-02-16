import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/add_extension_repo/bloc/add_extension_repo_cubit.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:news_hub/shared/models.dart';

@RoutePage()
class AddExtensionRepoScreen extends StatelessWidget {
  const AddExtensionRepoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddExtensionRepoCubit>(),
      child: _AddExtensionRepoView(),
    );
  }
}

class _AddExtensionRepoView extends StatelessWidget {
  _AddExtensionRepoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExtensionRepoCubit, AddExtensionRepoState>(
        builder: (context, state) {
      final cubit = context.read<AddExtensionRepoCubit>();
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
                      onPressed: () {
                        cubit.clearForm();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    errorText: switch (state.remoteRepo) {
                      ResultError error => error.exception.toString(),
                      _ => null
                    }),
                onChanged: (value) {
                  cubit.updateForm(indexUrl: value);
                },
                onTapOutside: (event) {
                  cubit.focusNode.unfocus();
                },
              ),
            ),
            state.remoteRepo.when(
              initial: () => _buildElevatedButtonTile(
                  context, cubit.fetchExtensionRepo, const Text('Check it')),
              loading: () => _buildElevatedButtonTile(
                  context, null, const CircularProgressIndicator()),
              error: (exception) => _buildElevatedButtonTile(
                  context, null, Text(exception.toString())),
              completed: (repo) {
                return Column(
                  children: [
                    _buildElevatedButtonTile(
                        context, null, const Text('已完成載入')),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                if (repo.icon != null) ...[
                                  Text("icon: "),
                                  CachedNetworkImage(
                                    imageUrl: repo.icon!,
                                    width: 32,
                                    height: 32,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Row(
                                      children: [
                                        Icon(Icons.error),
                                        Text(
                                            'Error loading image on $url: $error')
                                      ],
                                    ),
                                  )
                                ]
                              ],
                            ),
                          ),
                          ListTile(title: Text("baseUrl: ${repo.baseUrl}")),
                          ListTile(
                              title: Text("displayName: ${repo.displayName}")),
                          ListTile(title: Text("website: ${repo.website}")),
                          ListTile(
                              title: Text(
                                  "signingKeyFingerprint: ${repo.signingKeyFingerprint}")),
                        ],
                      ),
                    ),
                    state.addResult.when(
                      initial: () => _buildElevatedButtonTile(context,
                          cubit.addExtensionRepo, const Text('Add Repo')),
                      loading: () => _buildElevatedButtonTile(
                          context, null, const CircularProgressIndicator()),
                      completed: (r) => _buildElevatedButtonTile(
                          context, null, const Text('已完成加入')),
                      error: (exception) => _buildElevatedButtonTile(
                          context, null, Text(exception.toString())),
                    )
                  ],
                );
              },
            )
          ],
        ),
      );
    });
  }

  Widget _buildElevatedButtonTile(
      BuildContext context, VoidCallback? onPressed, Widget? child) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: onPressed, child: child),
        ));
  }
}
