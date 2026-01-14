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

  @override
  void initState() {
    super.initState();
    _homeCubit = sl<HomeCubit>()..init();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.router.addListener(_onRouteChanged);
      _onRouteChanged();
    });
  }

  void _onRouteChanged() {
    if (!mounted) return;

    _homeCubit.handleRouteChanged(context.router.current);
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
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocSelector<HomeCubit, HomeState, String>(
            selector: (state) => state.title,
            builder: (context, title) {
              return AppTopBar(
                title: title,
                onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
                onSearchPressed: () => context.router.push(SearchRoute()),
                onSettingsPressed: () =>
                    context.router.push(const SettingsRoute()),
              );
            },
          ),
        ),
        drawer: BlocSelector<HomeCubit, HomeState, HomeState>(
          selector: (state) => state,
          builder: (context, state) {
            return AppNavigationDrawer(
              collections: state.collections,
              expandedCollectionId: state.expandedCollectionId,
              sidecarLabel: state.sidecarLabel,
              sidecarStatusColor: state.sidecarStatusColor,
              onToggleExpansion: (id) =>
                  _homeCubit.toggleCollectionExpansion(id),
              onCollectionSelected: (collection) {
                _safeNavigate(
                  () => context.router.replace(
                    CollectionThreadListRoute(collectionId: collection.id),
                  ),
                );
              },
              onCreateCollectionPressed: () {
                _safeNavigate(
                  () => context.router.push(const CollectionCreateRoute()),
                );
              },
              onBoardSelected: (board) {
                _safeNavigate(
                  () => context.router.replace(
                    CollectionBoardThreadListRoute(
                      collectionId: board.collectionId,
                      boardId: board.identity.boardId,
                    ),
                  ),
                );
              },
              onStatusPressed: () {
                _safeNavigate(
                  () => context.router.push(const SidecarLogsRoute()),
                );
              },
            );
          },
        ),
        body: const AutoRouter(),
      ),
    );
  }
}
