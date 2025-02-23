import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/extensions/bloc/extensions_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';

@RoutePage()
class ExtensionsScreen extends StatelessWidget implements AutoRouteWrapper {
  ExtensionsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExtensionsCubit>()..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ExtensionsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extensions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_outlined),
            onPressed: () => AutoRouter.of(context).push(ExtensionReposRoute()),
          ),
        ],
      ),
      body: cubit.state.extensions.when(
        completed: (data) => ListView(
          children: [
            if (data.updates.isNotEmpty) ...[
              SubheaderTile("等待更新"),
              ...data.updates.map((e) => ListTile(
                    title: Text("${e.displayName}"),
                    trailing: cubit.isInstalling(e)
                        ? CircularProgressIndicator(value: cubit.state.installingExtensions[e.pkgName]!.second)
                        : IconButton(
                            icon: Icon(Icons.update),
                            onPressed: () => cubit.updateExtension(e),
                          ),
                  ))
            ],
            if (data.installed.isNotEmpty) ...[
              SubheaderTile("已安裝"),
              ...data.installed.map((e) => ListTile(
                    title: Text("${e.displayName}"),
                  ))
            ],
            if (data.notInstalled.isNotEmpty) ...[
              SubheaderTile("未安裝"),
              ...data.notInstalled.map((e) => ListTile(
                    title: Text("${e.displayName}"),
                    trailing: cubit.isInstalling(e)
                        ? CircularProgressIndicator(value: cubit.state.installingExtensions[e.pkgName]!.second)
                        : IconButton(
                            icon: Icon(Icons.download),
                            onPressed: () => cubit.installExtension(e),
                          ),
                  ))
            ],
          ],
        ),
        error: (exception) => Center(
          child: Text(exception.toString()),
        ),
        initial: () => const SizedBox(),
        loading: () => const LoadingIndicator(),
      ),
    );
  }
}
