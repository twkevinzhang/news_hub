import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/collection/list/bloc/collection_list_bloc.dart';
import 'package:news_hub/presentation/sidecar/sidecar_cubit.dart';

class AppNavigationDrawer extends StatefulWidget {
  final Function(Collection) onCollectionSelected;
  final Function() onCreateCollectionPressed;
  final Function(Board) onBoardSelected;
  final VoidCallback onStatusPressed;

  const AppNavigationDrawer({
    super.key,
    required this.onCollectionSelected,
    required this.onCreateCollectionPressed,
    required this.onBoardSelected,
    required this.onStatusPressed,
  });

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  final Map<String, ExpansionTileController> _controllers = {};

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // App Logo
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
                // Collection List
                BlocBuilder<CollectionListBloc, CollectionListState>(
                  builder: (context, state) {
                    if (state.isLoading && state.collections.isEmpty) {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ));
                    }
                    return Column(
                      children: state.collections.map((collection) {
                        final controller = _controllers.putIfAbsent(
                          collection.id,
                          () => ExpansionTileController(),
                        );

                        return ExpansionTile(
                          key: Key(collection.id),
                          controller: controller,
                          onExpansionChanged: (expanded) {
                            if (expanded) {
                              // Collapse others
                              for (final entry in _controllers.entries) {
                                if (entry.key != collection.id) {
                                  entry.value.collapse();
                                }
                              }
                            }
                          },
                          leading: const Icon(Icons.collections_bookmark_outlined),
                          title: Text(collection.name),
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.only(left: 72),
                              title: const Text('View All Posts', style: TextStyle(fontWeight: FontWeight.bold)),
                              onTap: () => widget.onCollectionSelected(collection),
                            ),
                            ...collection.boards.map((board) {
                              return ListTile(
                                contentPadding: const EdgeInsets.only(left: 72),
                                leading: const Icon(Icons.dashboard_outlined, size: 20),
                                title: Text(board.id),
                                onTap: () => widget.onBoardSelected(board),
                              );
                            }),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
                // Create Collection Button
                ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(28, 16, 16, 16),
                  leading: const Icon(Icons.add_outlined),
                  title: const Text('Create Collection'),
                  onTap: () => widget.onCreateCollectionPressed(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          BlocBuilder<SidecarCubit, SidecarState>(
            builder: (context, state) {
              return ListTile(
                onTap: widget.onStatusPressed,
                leading: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state.statusColor,
                  ),
                ),
                title: Text(
                  state.label,
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

  @override
  void dispose() {
    _controllers.clear();
    super.dispose();
  }
}
