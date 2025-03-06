import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/presentation/pages/search/bloc/boards_picker_cubit.dart';
import 'package:news_hub/presentation/widgets/molecules/loading_indicator.dart';

class BoardsPickerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BoardsPickerCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Boards Picker"),
      ),
      body: cubit.state.extensionBoards.when(
        initial: () => Center(child: Text("No installed extensions")),
        loading: () => const LoadingIndicator(),
        error: (e) => Center(child: Text(e.toString())),
        completed: (extensionBoards) => ListView(
          children: [
            ...extensionBoards.flatMap(
              (e) => [
                CheckboxListTile(
                  title: Text("${e.displayName}"),
                  value: cubit.getExtensionCheckboxValue(e.pkgName),
                  onChanged: (v) => cubit.toggleExtension(e.pkgName, v),
                  controlAffinity: ListTileControlAffinity.leading,
                  tristate: true,
                ),
                ...e.boards.map(
                  (b) => Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CheckboxListTile(
                      title: Text("${b.name}"),
                      value: cubit.getBoardCheckboxValue(b.id),
                      onChanged: (value) => cubit.toggleBoard(b.id, value),
                      controlAffinity: ListTileControlAffinity.leading,
                      secondary: DropdownButton(
                        items: b.supportedThreadsSorting
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(s),
                                ))
                            .toList(),
                        value: cubit.state.chosenBoardsSorting[b.id] ?? b.supportedThreadsSorting.first,
                        onChanged: cubit.getBoardCheckboxValue(b.id) ? (String? value) => cubit.setBoardSorting(b.id, value) : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        OutlinedButton(
          child: Text("重設"),
          onPressed: () {
            cubit.reset();
          },
        ),
        FilledButton(
          child: Text("儲存"),
          onPressed: () {
            cubit.submit();
            AutoRouter.of(context).popForced(cubit.state.submittedChosenBoardsSorting);
          },
        ),
      ],
    );
  }
}
