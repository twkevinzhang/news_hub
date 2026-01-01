import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/news_hub_top_app_bar.dart';
import 'package:news_hub/presentation/widgets/news_hub_navigation_drawer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/collections/collection_bloc.dart';
import 'package:news_hub/presentation/sidecar/sidecar_cubit.dart';

import 'package:news_hub/domain/models/models.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SidecarCubit>()),
        BlocProvider(create: (context) => sl<CollectionBloc>()..add(LoadCollections())),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        appBar: NewsHubTopAppBar(
          title: 'NewsHub',
          onMenuPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          onSearchPressed: () {
            context.pushRoute(SearchRoute());
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
              filter: ThreadsFilter(
                boardsSorting: {board.id: ''},
                keywords: '',
              ),
              sorting: const ThreadsSorting(boardsOrder: []),
            ));
          },
          onStatusPressed: () {
            context.pushRoute(const SidecarLogsRoute());
          },
        ),
        body: const AutoRouter(),
      ),
    );
  }
}
