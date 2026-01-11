import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/forms/collection/bloc/collection_form_cubit.dart';
import 'package:news_hub/presentation/components/rendering/boards-picker/boards_picker.dart';

class CollectionForm extends StatelessWidget {
  final Collection? initialCollection;

  const CollectionForm({super.key, this.initialCollection});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CollectionFormCubit, CollectionFormState>(
      listener: (context, state) {
        if (state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.isEditing ? '集合已更新' : '集合已建立')),
          );
          context.maybePop();
        }
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<CollectionFormCubit>();

        return Scaffold(
          appBar: AppBar(
            title: Text(state.isEditing ? '編輯集合' : '建立新集合'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                controller: TextEditingController(text: state.name)..selection = TextSelection.fromPosition(TextPosition(offset: state.name.length)),
                decoration: InputDecoration(
                  labelText: '集合名稱 (選填)',
                  hintText: state.defaultName.isEmpty ? '某版塊...等' : state.defaultName,
                  border: const OutlineInputBorder(),
                ),
                onChanged: cubit.updateName,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '版塊 (${state.selectedBoards.length})',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton.icon(
                    onPressed: () => _showBoardsPicker(context, cubit),
                    icon: const Icon(Icons.add),
                    label: const Text('選擇版塊'),
                  ),
                ],
              ),
              const Divider(),
              if (state.selectedBoards.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: Text('尚未選擇任何版塊', style: TextStyle(color: Colors.grey)),
                  ),
                )
              else
                ...state.selectedBoards.map((board) {
                  final options = state.boardSortOptions[board.id] ?? [];
                  final currentSort = state.boardSorts[board.id];

                  return Column(
                    children: [
                      ListTile(
                        leading: board.icon.isNotEmpty
                            ? Image.network(board.icon, width: 24, height: 24, errorBuilder: (_, __, ___) => const Icon(Icons.dashboard))
                            : const Icon(Icons.dashboard),
                        title: Text(board.name),
                        subtitle: Text(board.id),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            final newSelected = state.selectedBoards.where((b) => b != board).toList();
                            cubit.updateSelectedBoards(newSelected);
                          },
                        ),
                      ),
                      if (options.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: DropdownButtonFormField<String>(
                            value: currentSort,
                            decoration: const InputDecoration(
                              labelText: '預設排序方式',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            items: options
                                .map((opt) => DropdownMenuItem(
                                      value: opt,
                                      child: Text(opt),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              if (val != null) cubit.updateBoardSort(board.id, val);
                            },
                          ),
                        ),
                      const Divider(),
                    ],
                  );
                }),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: state.isSaving ? null : cubit.submit,
                child: state.isSaving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : Text(state.isEditing ? '更新集合' : '建立集合'),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showBoardsPicker(BuildContext context, CollectionFormCubit cubit) async {
    final result = await showDialog<BoardsPickerResult>(
      context: context,
      builder: (context) {
        final initialChosenBoards = Map.fromEntries(
          cubit.state.selectedBoards.map((b) => MapEntry(b.id, b.sortOptions.firstOrNull ?? '')),
        );
        return Dialog.fullscreen(
          child: BlocProvider<BoardsPickerCubit>(
            create: (context) => sl<BoardsPickerCubit>()..init(chosenBoards: initialChosenBoards),
            child: const BoardsPickerScreen(),
          ),
        );
      },
    );

    if (result != null) {
      cubit.updateSelectedBoards(result.boards);
    }
  }
}
