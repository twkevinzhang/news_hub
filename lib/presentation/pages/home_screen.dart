import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/news_hub_top_app_bar.dart';
import 'package:news_hub/presentation/widgets/news_hub_navigation_drawer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/collections/collection_bloc.dart';
import 'package:news_hub/presentation/sidecar/sidecar_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SidecarCubit>()),
        BlocProvider(create: (context) => sl<CollectionBloc>()..add(LoadCollections())),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: NewsHubTopAppBar(
            title: 'NewsHub',
            onMenuPressed: () {
              Scaffold.of(context).openDrawer();
            },
            onSearchPressed: () {
              context.pushRoute(const SearchRoute());
            },
            onSettingsPressed: () {
              context.pushRoute(const SettingsRoute());
            },
          ),
          drawer: NewsHubNavigationDrawer(
            onCollectionSelected: (collection) {
              context.router.push(CollectionRoute(collectionId: collection.id));
            },
            onBoardSelected: (board) {
              context.router.push(ThreadInfosRoute(
                extensionPkgName: board.extensionPkgName,
                siteId: board.siteId,
                boardsSorting: {board.id: ''},
              ));
            },
            onStatusPressed: () {
              context.pushRoute(const SidecarLogsRoute());
            },
          ),
          body: const AutoRouter(),
        );
      }),
    );
  }
}
