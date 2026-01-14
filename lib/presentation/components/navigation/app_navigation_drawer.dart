import 'package:flutter/material.dart';
import 'package:news_hub/domain/models/models.dart';

class AppNavigationDrawer extends StatelessWidget {
  final List<Collection> collections;
  final String? expandedCollectionId;
  final Function(String) onToggleExpansion;
  final Function(Collection) onCollectionSelected;
  final Function() onCreateCollectionPressed;
  final Function(CollectionBoard) onBoardSelected;
  final VoidCallback onStatusPressed;
  final String sidecarLabel;
  final Color sidecarStatusColor;

  const AppNavigationDrawer({
    super.key,
    required this.collections,
    required this.expandedCollectionId,
    required this.onToggleExpansion,
    required this.onCollectionSelected,
    required this.onCreateCollectionPressed,
    required this.onBoardSelected,
    required this.onStatusPressed,
    required this.sidecarLabel,
    required this.sidecarStatusColor,
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
                Column(
                  children: List.generate(collections.length, (index) {
                    final collection = collections[index];
                    return _CollectionSection(
                      collection: collection,
                      isExpanded: expandedCollectionId == collection.id,
                      onToggle: () => onToggleExpansion(collection.id),
                      onCollectionSelected: onCollectionSelected,
                      onBoardSelected: onBoardSelected,
                    );
                  }),
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
          ListTile(
            onTap: onStatusPressed,
            leading: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: sidecarStatusColor,
              ),
            ),
            title: Text(
              sidecarLabel,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.chevron_right, size: 16),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }
}

class _CollectionSection extends StatefulWidget {
  final Collection collection;
  final bool isExpanded;
  final VoidCallback onToggle;
  final Function(Collection) onCollectionSelected;
  final Function(CollectionBoard) onBoardSelected;

  const _CollectionSection({
    required this.collection,
    required this.isExpanded,
    required this.onToggle,
    required this.onCollectionSelected,
    required this.onBoardSelected,
  });

  @override
  State<_CollectionSection> createState() => _CollectionSectionState();
}

class _CollectionSectionState extends State<_CollectionSection> {
  final ExpansionTileController _controller = ExpansionTileController();

  @override
  void didUpdateWidget(_CollectionSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 同步 ExpansionTile 的內部狀態
    if (widget.isExpanded) {
      _controller.expand();
    } else {
      _controller.collapse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: _controller,
      key: PageStorageKey(widget.collection.id), // 保持捲動位置
      leading: const Icon(Icons.collections_bookmark_outlined),
      title: Text(widget.collection.name),
      initiallyExpanded: widget.isExpanded,
      // 使用 controller 手動控制展開/摺疊，以配合 Lifted State
      onExpansionChanged: (expanded) {
        // 只有當使用者點擊與目前狀態不符時才通知父層
        if (expanded != widget.isExpanded) {
          widget.onToggle();
        }
      },
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 72),
          title: const Text(
            'View All Posts',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => widget.onCollectionSelected(widget.collection),
        ),
        ...widget.collection.boards.map((board) {
          return ListTile(
            contentPadding: const EdgeInsets.only(left: 72),
            leading: const Icon(Icons.dashboard_outlined, size: 20),
            title: Text(board.identity.boardName),
            onTap: () => widget.onBoardSelected(board),
          );
        }),
      ],
    );
  }
}
