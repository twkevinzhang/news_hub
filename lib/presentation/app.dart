import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/index.dart';
import 'package:news_hub/presentation/pages/threads/index.dart';
import 'package:news_hub/presentation/router.dart';

class App extends StatelessWidget {
  App({super.key});

  final router = sl<AppRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ThreadsCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchCubit>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router.config(),
      ),
    );
  }
}
