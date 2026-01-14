import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/navigation/app_bar_title_notifier.dart';

class AppTopBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onSettingsPressed;

  const AppTopBar({
    super.key,
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
      title: _buildTitle(),
      actions: _buildActions(),
    );
  }

  Widget _buildTitle() {
    final titleNotifier = sl<AppBarTitleNotifier>();

    return ListenableBuilder(
      listenable: titleNotifier,
      builder: (context, _) => Text(titleNotifier.title),
    );
  }

  Widget _buildLeading(BuildContext context) {
    final router = context.router;

    return ListenableBuilder(
      listenable: router,
      builder: (context, _) {
        if (router.canPop()) {
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => router.maybePop(),
          );
        }

        if (widget.onMenuPressed != null) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: widget.onMenuPressed,
          );
        }

        return const SizedBox.shrink();
      },
    );
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
