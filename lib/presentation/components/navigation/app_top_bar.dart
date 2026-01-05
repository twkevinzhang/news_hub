import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
  late final ValueNotifier<String> _titleNotifier;

  @override
  void initState() {
    super.initState();
    _titleNotifier = ValueNotifier<String>('NewsHub');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupRouteListener();
    });
  }

  void _setupRouteListener() {
    if (!mounted) return;

    final router = context.router;
    _updateTitle(router.current);
    router.addListener(_onRouteChanged);
  }

  void _onRouteChanged() {
    if (!mounted) return;
    _updateTitle(context.router.current);
  }

  void _updateTitle(RouteData? route) {
    _titleNotifier.value = route?.displayTitle ?? 'NewsHub';
  }

  @override
  void dispose() {
    context.router.removeListener(_onRouteChanged);
    _titleNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _titleNotifier,
      builder: (context, title, _) {
        return AppBar(
          leading: _buildLeading(context),
          title: Text(title),
          actions: _buildActions(),
        );
      },
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

extension RouteDataExtensions on RouteData {
  String get displayTitle {
    // 優先使用 meta 中的 title
    final metaTitle = meta['title'] as String?;
    if (metaTitle != null) return metaTitle;

    // 備用：從路由名稱映射
    const titleMap = {
      'CreateCollectionRoute': '建立收藏',
      'ThreadListRoute': 'NewsHub',
      'SidecarLogsRoute': 'Sidecar Logs',
      'SettingsRoute': '設定',
      'SearchRoute': '搜尋',
    };

    return titleMap[name] ?? 'NewsHub';
  }
}