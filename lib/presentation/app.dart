import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/index.dart';
import 'package:news_hub/presentation/pages/threads/index.dart';
import 'package:news_hub/presentation/router/router.dart';

class App extends StatelessWidget {
  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();
    return MaterialApp.router(
      routerConfig: router.config(),
    );
  }
}
