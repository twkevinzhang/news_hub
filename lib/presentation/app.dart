import 'package:flutter/material.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();
    return MaterialApp.router(
      routerConfig: router.config(),
    );
  }
}
