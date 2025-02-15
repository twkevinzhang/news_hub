import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/extensions/bloc/extensions_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';

@RoutePage()
class ExtensionsScreen extends StatelessWidget {
  const ExtensionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExtensionsCubit>()..loadExtensions(),
      child: _ExtensionsView(),
    );
  }
}

class _ExtensionsView extends StatelessWidget {
  _ExtensionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtensionsCubit, ExtensionsState>(
        builder: (context, state) {
          final cubit = context.read<ExtensionsCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Extensions'),
              actions: [
                SearchAnchor(
                    viewOnChanged: (text) => cubit.changeKeywords(text),
                    viewOnSubmitted: (text) {
                      cubit.loadExtensions();
                      cubit.closeView(text);
                    },
                    isFullScreen: true,
                    searchController: cubit.searchController,
                    builder: (BuildContext context, SearchController controller) {
                      return IconButton(
                        icon: const Icon(Icons.filter_list_outlined),
                        onPressed: () {
                          controller.openView();
                        },
                      );
                    },
                    suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            cubit.changeKeywords(item);
                            controller.closeView(item);
                            cubit.loadExtensions();
                          },
                        );
                      });
                    }),
                IconButton(
                  icon: const Icon(Icons.add_outlined),
                  onPressed: () async {
                    await AutoRouter.of(context).push(ExtensionReposRoute());
                  },
                ),
              ],
            ),
            body: StateStatusLayout(
              status: state.extensions,
              onCompletedStatus: (context, data) => ListView(
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
              onErrorStatus: (context, message) => Center(
                child: Text(message),
              ),
              onInitialStatus: const SizedBox(),
              onLoadingStatus: LoadingIndicator(),
            ),
          );
        });
  }
}
