import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: [
          ThreadInfosRoute(),
          ExtensionsRoute(),
          SettingsRoute(),
        ],
        bottomNavigationBuilder: (_, router) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper), label: 'Threads'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.extension), label: 'Extensions'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            currentIndex: router.activeIndex,
            onTap: (index) {
              router.setActiveIndex(index);
            },
          );
        });
  }
}
