import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/presentation/pages/settings/collections/bloc/collection_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

import 'package:news_hub/locator.dart';

@RoutePage()
class CollectionManageScreen extends StatelessWidget implements AutoRouteWrapper {
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
    return Scaffold(
      appBar: AppBar(title: const Text('Collections')),
      body: BlocBuilder<CollectionCubit, CollectionState>(
        builder: (context, state) {
          if (state.isLoading && state.collections.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.collections.isEmpty) {
            return const Center(child: Text('No collections'));
          }
          return ReorderableListView(
            onReorder: (oldIndex, newIndex) {
              context.read<CollectionCubit>().reorderCollections(oldIndex, newIndex);
            },
            children: state.collections.map((collection) {
              return ListTile(
                key: Key(collection.id),
                leading: const Icon(Icons.drag_handle),
                title: Text(collection.name),
                subtitle: Text('${collection.boards.length} boards'),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'edit') {
                      context.router.push(CollectionEditRoute(initialCollection: collection));
                    } else if (value == 'delete') {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Collection'),
                          content: Text('Are you sure you want to delete "${collection.name}"?'),
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
                      if (confirm == true) {
                        if (context.mounted) {
                          context.read<CollectionCubit>().deleteCollection(collection.id);
                        }
                      }
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ];
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(CollectionCreateRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
