import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';

class AppNavigationDrawer extends StatelessWidget {
  final Function(Collection) onCollectionSelected;
  final Function() onCreateCollectionPressed;
  final Function(CollectionBoard) onBoardSelected;
  final VoidCallback onStatusPressed;

  const AppNavigationDrawer({
    super.key,
    required this.onCollectionSelected,
    required this.onCreateCollectionPressed,
    required this.onBoardSelected,
    required this.onStatusPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 64, 16, 10),
                  child: Text(
                    'NewsHub',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                // 僅在集合數量變動時重建外層容器
                BlocSelector<HomeCubit, HomeState, int>(
                  selector: (state) => state.collections.length,
                  builder: (context, count) {
                    return Column(
                      children: List.generate(
                        count,
                        (index) => _CollectionSection(
                          index: index,
                          onCollectionSelected: onCollectionSelected,
                          onBoardSelected: onBoardSelected,
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(28, 16, 16, 16),
                  leading: const Icon(Icons.add_outlined),
                  title: const Text('Create Collection'),
                  onTap: () => onCreateCollectionPressed(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          BlocSelector<HomeCubit, HomeState, (Color, String)>(
            selector: (state) => (state.sidecarStatusColor, state.sidecarLabel),
            builder: (context, data) {
              return ListTile(
                onTap: onStatusPressed,
                leading: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data.$1,
                  ),
                ),
                title: Text(
                  data.$2,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: const Icon(Icons.chevron_right, size: 16),
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }
}

class _CollectionSection extends StatelessWidget {
  final int index;
  final Function(Collection) onCollectionSelected;
  final Function(CollectionBoard) onBoardSelected;

  const _CollectionSection({
    required this.index,
    required this.onCollectionSelected,
    required this.onBoardSelected,
  });

  @override
  Widget build(BuildContext context) {
    // 獲取特定的 Collection
    final collection = context.select<HomeCubit, Collection>(
      (c) => c.state.collections[index],
    );

    // 獲取展開狀態
    final isExpanded = context.select<HomeCubit, bool>(
      (c) => c.state.expandedCollectionId == collection.id,
    );

    return ExpansionTile(
      key: PageStorageKey(collection.id), // 保持捲動位置
      leading: const Icon(Icons.collections_bookmark_outlined),
      title: Text(collection.name),
      initiallyExpanded: isExpanded,
      // 使用 controller 手動控制展開/摺疊，以配合 Lifted State
      onExpansionChanged: (expanded) {
        context.read<HomeCubit>().toggleCollectionExpansion(collection.id);
      },
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 72),
          title: const Text(
            'View All Posts',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => onCollectionSelected(collection),
        ),
        ...collection.boards.map((board) {
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 72),
            leading: const Icon(Icons.dashboard_outlined, size: 20),
            title: Text(board.identity.boardName),
            onTap: () => onBoardSelected(board),
          );
        }),
      ],
    );
  }
}
