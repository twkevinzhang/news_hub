import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/components/rendering/empty_screen.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

@RoutePage()
class HomeEmptyScreen extends StatelessWidget {
  const HomeEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      title: '尚未建立收藏',
      message: '點擊下方按鈕或左側選單來建立您的第一個收藏',
      icon: Icons.auto_awesome_motion_outlined,
      onRetry: () => context.router.push(const CollectionCreateRoute()),
      retryLabel: '建立收藏',
    );
  }
}
