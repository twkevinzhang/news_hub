import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/settings/extensions/bloc/extension_cubit.dart';
import 'package:news_hub/presentation/pages/settings/extensions/bloc/repo_cubit.dart';
import 'repos_tab.dart';
import 'extension_installed_tab.dart';
import 'extension_browse_tab.dart';

@RoutePage()
class ExtensionManageScreen extends StatelessWidget implements AutoRouteWrapper {
  const ExtensionManageScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<RepoCubit>()..init()),
        BlocProvider(create: (context) => sl<ExtensionCubit>()..init()),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Repo & Extensions'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Repositories'),
              Tab(text: 'Installed'),
              Tab(text: 'Browse'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ReposTab(),
            ExtensionInstalledTab(),
            ExtensionBrowseTab(),
          ],
        ),
      ),
    );
  }
}
