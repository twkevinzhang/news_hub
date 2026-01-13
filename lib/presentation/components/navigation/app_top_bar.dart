import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppTopBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onSettingsPressed;

  const AppTopBar({
    super.key,
    this.title,
    this.onMenuPressed,
    this.onSearchPressed,
    this.onSettingsPressed,
  });

  @override
  State<AppTopBar> createState() => _AppTopBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppTopBarState extends State<AppTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _buildLeading(context),
      title: Text(widget.title ?? 'Untitled'),
      actions: _buildActions(),
    );
  }

  Widget _buildLeading(BuildContext context) {
    final canPop = context.router.canPop();

    if (canPop) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.router.maybePop(),
      );
    }

    if (widget.onMenuPressed != null) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: widget.onMenuPressed,
      );
    }

    return const SizedBox.shrink();
  }

  List<Widget> _buildActions() {
    return [
      if (widget.onSearchPressed != null)
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: widget.onSearchPressed,
        ),
      if (widget.onSettingsPressed != null)
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: widget.onSettingsPressed,
        ),
    ];
  }
}
