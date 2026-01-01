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
  late final CollectionBloc _collectionBloc;
  late final SidecarCubit _sidecarCubit;
  late final ValueNotifier<String> _titleNotifier;

  @override
  void initState() {
    super.initState();
    _sidecarCubit = sl<SidecarCubit>();
    _collectionBloc = sl<CollectionBloc>()..add(const CollectionEvent.load());
    _titleNotifier = ValueNotifier<String>('NewsHub');

    // Sync title with router state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final router = context.router;
      final innerRouter = router.innerRouterOf(HomeRoute.name);
      _updateTitle(innerRouter?.current);
      (innerRouter ?? router).addListener(() {
        if (mounted) {
          _updateTitle(innerRouter?.current);
        }
      });
    });
  }

  void _updateTitle(RouteData? route) {
    _titleNotifier.value = _getRouteTitle(route);
  }

  String _getRouteTitle(RouteData? route) {
    if (route == null) return 'NewsHub';
    if (route.name == SidecarLogsRoute.name) return 'Sidecar Logs';
    if (route.name == CollectionRoute.name) return 'Collection';
    if (route.name == SearchRoute.name) return 'Search';
    if (route.name == SettingsRoute.name) return 'Settings';
    if (route.name == ExtensionsRoute.name) return 'Extensions';
    return 'NewsHub';
  }

  Future<void> _safeNavigate(VoidCallback navigate) async {
    // 1. Close drawer first
    _scaffoldKey.currentState?.closeDrawer();
    // 2. Wait for drawer closing animation (standard is ~250-300ms)
    await Future.delayed(const Duration(milliseconds: 250));
    // 3. Execute navigation if still mounted
    if (mounted) {
      navigate();
    }
  }

  @override
  void dispose() {
    _sidecarCubit.close();
    _collectionBloc.close();
    _titleNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _sidecarCubit),
        BlocProvider.value(value: _collectionBloc),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ValueListenableBuilder<String>(
            valueListenable: _titleNotifier,
            builder: (context, title, _) {
              return NewsHubTopAppBar(
                title: title,
                onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
                onSearchPressed: () => context.router.push(SearchRoute()),
                onSettingsPressed: () => context.router.push(const SettingsRoute()),
              );
            },
          ),
        ),
        drawer: NewsHubNavigationDrawer(
          onCollectionSelected: (collection) {
            _safeNavigate(() => context.router.push(CollectionRoute(collectionId: collection.id)));
          },
          onBoardSelected: (board) {
            _safeNavigate(() => context.router.push(ThreadInfosRoute(
                  filter: ThreadsFilter(
                    boardsSorting: {board.id: ''},
                    keywords: '',
                  ),
                  sorting: const ThreadsSorting(boardsOrder: []),
                )));
          },
          onStatusPressed: () {
            _safeNavigate(() => context.router.push(const SidecarLogsRoute()));
          },
        ),
        body: const AutoRouter(),
      ),
    );
  }
}
