import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/collections/create/bloc/create_collection_cubit.dart';
import 'package:news_hub/presentation/components/rendering/boards-picker/boards_picker.dart';

@RoutePage()
class CreateCollectionPage extends StatelessWidget implements AutoRouteWrapper {
  const CreateCollectionPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateCollectionCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCollectionCubit, CreateCollectionState>(
      listener: (context, state) {
        if (state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('集合已建立')),
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
        final cubit = context.read<CreateCollectionCubit>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('建立新集合'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
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
                ...state.selectedBoards.map((board) => ListTile(
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
                    )),
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
                    : const Text('建立集合'),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showBoardsPicker(BuildContext context, CreateCollectionCubit cubit) async {
    final result = await showDialog<BoardsPickerResult>(
      context: context,
      builder: (context) {
        final initialChosenBoards = Map.fromEntries(
          cubit.state.selectedBoards.map((b) => MapEntry(b.id, b.supportedThreadsSorting.firstOrNull ?? '')),
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
