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
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _getRouteTitle(RouteData? route) {
    if (route == null) return 'NewsHub';
    if (route.name == SidecarLogsRoute.name) return 'Sidecar Logs';
    if (route.name == CollectionRoute.name) return 'Collection';
    if (route.name == SearchRoute.name) return 'Search';
    if (route.name == SettingsRoute.name) return 'Settings';
    if (route.name == ExtensionsRoute.name) return 'Extensions';
    return 'NewsHub';
  }

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final innerRouter = router.innerRouterOf(HomeRoute.name);

    // Use ListenableBuilder to rebuild when the inner router changes
    return ListenableBuilder(
      listenable: innerRouter ?? router,
      builder: (context, _) {
        final currentChild = innerRouter?.current;
        final title = _getRouteTitle(currentChild);

        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<SidecarCubit>()),
            BlocProvider(create: (context) => sl<CollectionBloc>()..add(LoadCollections())),
          ],
          child: Scaffold(
            key: _scaffoldKey,
            appBar: NewsHubTopAppBar(
              title: title,
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
                _scaffoldKey.currentState?.closeDrawer();
                context.router.push(CollectionRoute(collectionId: collection.id));
              },
              onBoardSelected: (board) {
                _scaffoldKey.currentState?.closeDrawer();
                context.router.push(ThreadInfosRoute(
                  filter: ThreadsFilter(
                    boardsSorting: {board.id: ''},
                    keywords: '',
                  ),
                  sorting: const ThreadsSorting(boardsOrder: []),
                ));
              },
              onStatusPressed: () {
                _scaffoldKey.currentState?.closeDrawer();
                context.pushRoute(const SidecarLogsRoute());
              },
            ),
            body: const AutoRouter(),
          ),
        );
      },
    );
  }
}
