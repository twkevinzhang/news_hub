import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/content-organization/create-collection/bloc/create_collection_cubit.dart';
import 'package:news_hub/presentation/shared/boards_picker/boards_picker.dart';

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
                decoration: const InputDecoration(
                  labelText: '集合名稱 (選填)',
                  hintText: '預設：第一個版塊名稱...等',
                  border: OutlineInputBorder(),
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
    final List<Board>? selectedBoards = await showDialog<List<Board>>(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: BlocProvider<BoardsPickerCubit>(
            create: (context) => sl<BoardsPickerCubit>()..init(),
            child: const BoardsPickerScreen(),
          ),
        );
      },
    );

    if (selectedBoards != null) {
      cubit.updateSelectedBoards(selectedBoards);
    }
  }
}
