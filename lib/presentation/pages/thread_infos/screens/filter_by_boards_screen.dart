import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/filter_by_boards_cubit.dart';
import 'package:news_hub/shared/models.dart';

@RoutePage()
class FilterByBoardsScreen extends StatelessWidget {
  const FilterByBoardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterByBoardsCubit, FilterByBoardsState>(builder: (context, state) {
      final cubit = context.read<FilterByBoardsCubit>();
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if (didPop) {
            return;
          }
          AutoRouter.of(context).popForced(cubit.filter);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Filter by boards'),
          ),
          body: state.installedExtensions.when(
            initial: () => Center(child: Text("No installed extensions")),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (exception) => Center(child: Text("Error: ${exception.toString()}")),
            completed: (extensions) => ListView(
              children: [
                ...extensions.flatMap(
                      (e) => [
                    ListTile(
                      title: Text("${e.displayName}"),
                      trailing: Switch(
                        value: state.extensionPkgNames.contains(e.pkgName),
                        onChanged: (value) {
                          if (value) {
                            cubit.chooseExtension(e);
                          } else {
                            cubit.unChooseExtension(e);
                          }
                        },
                      ),
                    ),
                    ...e.boards.map((b) => ListTile(
                      title: Text("[${e.displayName}] ${b.name}"),
                      trailing: Checkbox(
                        value: state.boardIds.contains(b.id),
                        onChanged: (value) {
                          if (value != null) {
                            if (value) {
                              cubit.chooseBoard(b);
                            } else {
                              cubit.unChooseBoard(b);
                            }
                          }
                        },
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        )
      );
    });
  }
}
