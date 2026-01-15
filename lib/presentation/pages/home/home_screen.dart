import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/navigation/app_navigation_drawer.dart';
import 'package:news_hub/presentation/components/navigation/app_top_bar.dart';
import 'package:news_hub/presentation/components/forms/thread-search/search_mode_notifier.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/domain/models/models.dart';

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
  }

  Future<void> _safeNavigate(VoidCallback navigate) async {
    _scaffoldKey.currentState?.closeDrawer();
    await Future.delayed(_drawerCloseDuration);
    if (!mounted) return;
    navigate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeCubit,
      child: ListenableBuilder(
        listenable: sl<SearchModeNotifier>(),
        builder: (context, _) {
          final isSearchMode = sl<SearchModeNotifier>().isSearchMode;
          return PopScope(
            canPop: !isSearchMode,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;
              sl<SearchModeNotifier>().exitSearchMode();
            },
            child: Scaffold(
              key: _scaffoldKey,
              appBar: isSearchMode
                  ? null
                  : PreferredSize(
                      preferredSize: const Size.fromHeight(kToolbarHeight),
                      child: AppTopBar(
                        onMenuPressed: () =>
                            _scaffoldKey.currentState?.openDrawer(),
                        onSearchPressed: () =>
                            context.read<HomeCubit>().triggerSearch(),
                        onSettingsPressed: () =>
                            context.router.push(const SettingsRoute()),
                      ),
                    ),
              // 使用 BlocSelector 精確訂閱 Drawer 需要的狀態
              drawer:
                  BlocSelector<
                    HomeCubit,
                    HomeState,
                    (List<Collection>, String?, String, Color)
                  >(
                    selector: (state) => (
                      state.collections,
                      state.expandedCollectionId,
                      state.sidecarLabel,
                      state.sidecarStatusColor,
                    ),
                    builder: (context, data) {
                      final (
                        collections,
                        expandedId,
                        sidecarLabel,
                        sidecarStatusColor,
                      ) = data;
                      return AppNavigationDrawer(
                        collections: collections,
                        expandedCollectionId: expandedId,
                        sidecarLabel: sidecarLabel,
                        sidecarStatusColor: sidecarStatusColor,
                        onToggleExpansion: (id) =>
                            _homeCubit.toggleCollectionExpansion(id),
                        onCollectionSelected: (collection) {
                          _safeNavigate(
                            () => context.router.replace(
                              CollectionThreadListRoute(
                                collectionId: collection.id,
                              ),
                            ),
                          );
                        },
                        onCreateCollectionPressed: () {
                          _safeNavigate(
                            () => context.router.push(
                              const CollectionCreateRoute(),
                            ),
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
        },
      ),
    );
  }
}
