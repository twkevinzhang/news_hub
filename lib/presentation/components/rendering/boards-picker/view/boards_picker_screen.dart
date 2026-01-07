import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/components/rendering/boards-picker/bloc/boards_picker_cubit.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';

class BoardsPickerScreen extends StatelessWidget {
  const BoardsPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardsPickerCubit, BoardsPickerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('選擇版塊'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(BoardsPickerResult(
                    chosenBoards: state.chosenBoards,
                    boards: state.chosenBoardsList,
                  ));
                },
                child: const Text('完成'),
              ),
            ],
          ),
          body: state.extensionBoards.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: LoadingIndicator()),
            error: (e) => Center(child: Text(' Error: $e')),
            completed: (data) {
              if (data.isEmpty) {
                return const Center(child: Text('沒有安裝任何擴充元件'));
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final ext = data[index];
                  return _CategorySection(
                    extensionPkgName: ext.pkgName,
                    site: ext.site,
                    boards: ext.boards.toList(),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _CategorySection extends StatelessWidget {
  final String extensionPkgName;
  final Site site;
  final List<Board> boards;

  const _CategorySection({
    required this.extensionPkgName,
    required this.site,
    required this.boards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BlocBuilder<BoardsPickerCubit, BoardsPickerState>(
                    builder: (context, state) {
                      final cubit = context.read<BoardsPickerCubit>();
                      final value = cubit.getExtensionCheckboxValue(extensionPkgName);
                      return Checkbox(
                        value: value,
                        tristate: true,
                        onChanged: (v) => cubit.toggleExtension(extensionPkgName, v),
                      );
                    },
                  ),
                  Text(
                    site.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // TODO: Implement See All
                },
                child: Text('查看全部 ${boards.length}'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: boards.length,
            itemBuilder: (context, index) {
              final board = boards[index];
              return _BoardCard(board: board);
            },
          ),
        ),
      ],
    );
  }
}

class _BoardCard extends StatelessWidget {
  final Board board;

  const _BoardCard({required this.board});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BoardsPickerCubit>();
    final isSelected = cubit.getBoardCheckboxValue(board.id);

    return GestureDetector(
      onTap: () => cubit.toggleBoard(board.id, !isSelected),
      child: Container(
        width: 140,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: Theme.of(context).colorScheme.primary, width: 2) : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: board.icon.isNotEmpty
                            ? Image.network(board.icon, errorBuilder: (_, __, ___) => const Icon(Icons.dashboard))
                            : const Icon(Icons.dashboard),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (v) => cubit.toggleBoard(board.id, v),
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Expanded(
                        child: Text(
                          board.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    board.id,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
