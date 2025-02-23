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
    return BlocBuilder<ExtensionsCubit, ExtensionsState>(
        builder: (context, state) {
      final cubit = context.read<ExtensionsCubit>();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Extensions'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_outlined),
              onPressed: () async {
                await AutoRouter.of(context).push(ExtensionReposRoute());
              },
            ),
          ],
        ),
        body: state.extensions.when(
          completed: (data) => ListView(
            children: [
              if (data.updates.isNotEmpty) ...[
                ListTile(title: TextDivider("等待更新")),
                ...data.updates.map((e) => ListTile(
                      title: Text("${e.displayName}"),
                      trailing: state.installingExtensions
                              .containsKey(e.pkgName)
                          ? CircularProgressIndicator(
                              value:
                                  state.installingExtensions[e.pkgName]!.second)
                          : IconButton(
                              icon: Icon(Icons.update),
                              onPressed: () => {
                                cubit.updateExtension(e),
                              },
                            ),
                    ))
              ],
              if (data.installed.isNotEmpty) ...[
                ListTile(title: TextDivider("已安裝")),
                ...data.installed.map((e) => ListTile(
                      title: Text("${e.displayName}"),
                    ))
              ],
              if (data.notInstalled.isNotEmpty) ...[
                ListTile(title: TextDivider("未安裝")),
                ...data.notInstalled.map((e) => ListTile(
                      title: Text("${e.displayName}"),
                      trailing: state.installingExtensions
                              .containsKey(e.pkgName)
                          ? CircularProgressIndicator(
                              value:
                                  state.installingExtensions[e.pkgName]!.second)
                          : IconButton(
                              icon: Icon(Icons.download),
                              onPressed: () => {
                                cubit.installExtension(e),
                              },
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
    });
  }
}
