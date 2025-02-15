import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/add_extension_repo/bloc/add_extension_repo_cubit.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';

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
                    errorText: state.remoteRepo is StateError
                        ? state.remoteRepo.message
                        : null),
                onChanged: (value) {
                  cubit.updateForm(indexUrl: value);
                },
                onTapOutside: (event) {
                  cubit.focusNode.unfocus();
                },
              ),
            ),
            _buildButtonTile(
              context,
              StateStatusLayout(
                status: state.remoteRepo,
                onInitialStatus: ElevatedButton(
                    onPressed: cubit.fetchExtensionRepo,
                    child: const Text('Check it')),
                onErrorStatus: (context, message) =>
                    ElevatedButton(onPressed: null, child: const Text('請重新輸入')),
                onCompletedStatus: (context, data) =>
                    ElevatedButton(onPressed: null, child: const Text('已完成載入')),
                onLoadingStatus: ElevatedButton(
                    onPressed: null, child: CircularProgressIndicator()),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: StateStatusLayout(
                  status: state.remoteRepo,
                  onInitialStatus: const SizedBox(),
                  onLoadingStatus: const SizedBox(),
                  onCompletedStatus: (context, data) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              if (data.icon != null)
                                ...[
                                  Text("icon: "),
                                  CachedNetworkImage(
                                    imageUrl: data.icon!,
                                    width: 32,
                                    height: 32,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Row(
                                      children: [
                                        Icon(Icons.error),
                                        Text('Error loading image on $url: $error')
                                      ],
                                    ),
                                  )
                                ]
                            ],
                          ),
                        ),
                        ListTile(title: Text("baseUrl: ${data.baseUrl}")),
                        ListTile(
                            title: Text("displayName: ${data.displayName}")),
                        ListTile(title: Text("website: ${data.website}")),
                        ListTile(
                            title: Text(
                                "signingKeyFingerprint: ${data.signingKeyFingerprint}")),
                      ],
                    );
                  },
                  onErrorStatus: (context, message) => SizedBox(),
                )),
            if (state.remoteRepo is StateCompleted)
              _buildButtonTile(
                context,
                StateStatusLayout(
                  status: state.addResult,
                  onInitialStatus: ElevatedButton(
                      onPressed: cubit.addExtensionRepo,
                      child: const Text('Add Repo')),
                  onErrorStatus: (context, message) =>
                      ElevatedButton(onPressed: null, child: Text(message)),
                  onCompletedStatus: (context, data) =>
                      ElevatedButton(onPressed: null, child: const Text('已完成加入')),
                  onLoadingStatus: ElevatedButton(
                      onPressed: null, child: CircularProgressIndicator()),
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildButtonTile(BuildContext context, Widget button) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: button,
        ));
  }
}
