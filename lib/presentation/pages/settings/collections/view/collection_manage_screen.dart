import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/presentation/pages/settings/collections/bloc/collection_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

import 'package:news_hub/locator.dart';

@RoutePage()
class CollectionManageScreen extends StatelessWidget
    implements AutoRouteWrapper {
  const CollectionManageScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CollectionCubit>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSortingMode = context.select<CollectionCubit, bool>(
      (c) => c.state.isSortingMode,
    );

    return PopScope(
      canPop: !isSortingMode,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final confirm = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('放棄排序？'),
            content: const Text('確定要結束排序模式嗎？'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('取消'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('確定'),
              ),
            ],
          ),
        );
        if (confirm == true && context.mounted) {
          context.read<CollectionCubit>().toggleSortingMode();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(isSortingMode ? '排序集合' : '集合管理'),
          backgroundColor: isSortingMode
              ? Theme.of(context).colorScheme.primaryContainer
              : null,
          leading: isSortingMode
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).maybePop(),
                )
              : null,
          actions: [
            if (isSortingMode)
              TextButton(
                onPressed: () =>
                    context.read<CollectionCubit>().toggleSortingMode(),
                child: Text(
                  '完成',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              )
            else
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () =>
                    context.read<CollectionCubit>().toggleSortingMode(),
              ),
          ],
        ),
        body: BlocBuilder<CollectionCubit, CollectionState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.collections != current.collections ||
              previous.isSortingMode != current.isSortingMode,
          builder: (context, state) {
            if (state.isLoading && state.collections.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.collections.isEmpty) {
              return const Center(child: Text('No collections'));
            }
            return ReorderableListView.builder(
              itemCount: state.collections.length,
              onReorder: (oldIndex, newIndex) {
                context.read<CollectionCubit>().reorderCollections(
                  oldIndex,
                  newIndex,
                );
              },
              buildDefaultDragHandles: state.isSortingMode,
              itemBuilder: (context, index) {
                final collection = state.collections[index];
                return ListTile(
                  key: Key(collection.id),
                  onTap: state.isSortingMode
                      ? null
                      : () => context.router.push(
                          CollectionEditRoute(initialCollection: collection),
                        ),
                  leading: state.isSortingMode
                      ? null
                      : const Icon(Icons.collections),
                  title: Text(collection.name),
                  subtitle: Text('${collection.boards.length} boards'),
                  trailing: state.isSortingMode
                      ? const ReorderableDragStartListener(
                          index: 0,
                          child: Icon(Icons.drag_handle),
                        )
                      : PopupMenuButton<String>(
                          onSelected: (value) async {
                            if (value == 'edit') {
                              context.router.push(
                                CollectionEditRoute(
                                  initialCollection: collection,
                                ),
                              );
                            } else if (value == 'delete') {
                              final confirm = await _showDeleteDialog(
                                context,
                                collection.name,
                              );
                              if (confirm == true && context.mounted) {
                                context
                                    .read<CollectionCubit>()
                                    .deleteCollection(collection.id);
                              }
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                );
              },
            );
          },
        ),
        floatingActionButton: isSortingMode
            ? null
            : FloatingActionButton(
                onPressed: () =>
                    context.router.push(const CollectionCreateRoute()),
                child: const Icon(Icons.add),
              ),
      ),
    );
  }

  Future<bool?> _showDeleteDialog(BuildContext context, String collectionName) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Collection'),
        content: Text('Are you sure you want to delete "$collectionName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
