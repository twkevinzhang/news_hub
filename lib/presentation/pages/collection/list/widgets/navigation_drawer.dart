import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/sidecar/bloc/sidecar_cubit.dart';

import '../bloc/collection_list_bloc.dart';

class NavigationDrawer extends StatefulWidget {
  final Function(Collection) onCollectionSelected;
  final Function(Board) onBoardSelected;
  final VoidCallback onStatusPressed;
  final VoidCallback onCreateCollectionPressed;

  const NavigationDrawer({
    super.key,
    required this.onCollectionSelected,
    required this.onBoardSelected,
    required this.onStatusPressed,
    required this.onCreateCollectionPressed,
  });

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
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
                const Divider(indent: 28, endIndent: 28),
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
                          subtitle: collection.boards.isNotEmpty
                              ? Text(
                                  _getBoardsSummary(collection.boards),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              : null,
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
                                title: Text(board.name),
                                onTap: () => widget.onBoardSelected(board),
                              );
                            }),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('New Collection'),
                  onTap: () => widget.onCreateCollectionPressed(),
                )
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

  String _getBoardsSummary(List<Board> boards) {
    if (boards.isEmpty) return '';
    final names = boards.take(2).map((b) => b.name).join(' + ');
    if (boards.length > 2) {
      return '$names...等 (${boards.length})';
    }
    return '$names (${boards.length})';
  }

  @override
  void dispose() {
    _controllers.clear();
    super.dispose();
  }
}
