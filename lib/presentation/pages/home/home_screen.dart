import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/navigation/app_navigation_drawer.dart';
import 'package:news_hub/presentation/components/navigation/app_top_bar.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _drawerCloseDuration = Duration(milliseconds: 250);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late final HomeCubit _homeCubit;
  bool _hasNavigatedToFirstCollection = false;

  @override
  void initState() {
    super.initState();
    _homeCubit = sl<HomeCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.router.addListener(_onRouteChanged);
      _onRouteChanged();
      _navigateToFirstCollectionIfNeeded();
    });
  }

  void _navigateToFirstCollectionIfNeeded() {
    if (_hasNavigatedToFirstCollection) return;
    if (_homeCubit.state.collections.isEmpty) return;

    final currentRoute = context.router.current;
    final isRootRoute = currentRoute.name == 'HomeRoute';
    final hasNoChild = context.router.currentChild == null;

    if (!isRootRoute || !hasNoChild) return;

    _hasNavigatedToFirstCollection = true;
    _homeCubit.navigateToFirstCollection(context.router);
  }

  void _onRouteChanged() {
    if (!mounted) return;

    final routes = context.router.currentHierarchy();
    final target = routes.isNotEmpty
        ? routes.last as RouteData
        : context.router.current;

    _homeCubit.handleRouteChanged(target);
  }

  Future<void> _safeNavigate(VoidCallback navigate) async {
    _scaffoldKey.currentState?.closeDrawer();
    await Future.delayed(_drawerCloseDuration);
    if (!mounted) return;
    navigate();
  }

  @override
  void dispose() {
    context.router.removeListener(_onRouteChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeCubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppTopBar(
              title: state.title,
              onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
              onSearchPressed: () => context.router.push(SearchRoute()),
              onSettingsPressed: () => context.router.push(const SettingsRoute()),
            ),
            drawer: AppNavigationDrawer(
              onCollectionSelected: (collection) {
                _safeNavigate(() => context.router.replace(
                    CollectionThreadListRoute(collectionId: collection.id)));
              },
              onCreateCollectionPressed: () {
                _safeNavigate(() => context.router.push(CollectionCreateRoute()));
              },
              onBoardSelected: (board) {
                _safeNavigate(() => context.router.replace(
                    CollectionBoardThreadListRoute(
                      collectionId: board.collectionId,
                      boardId: board.identity.boardId,
                    )));
              },
              onStatusPressed: () {
                _safeNavigate(() => context.router.push(const SidecarLogsRoute()));
              },
            ),
            body: const AutoRouter(),
          );
        },
      ),
    );
  }
}
