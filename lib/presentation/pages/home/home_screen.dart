// lib/presentation/pages/home/home_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/collection/list/bloc/collection_list_bloc.dart';
import 'package:news_hub/presentation/pages/home/widgets/app_navigation_drawer.dart';
import 'package:news_hub/presentation/pages/home/widgets/app_top_bar.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/sidecar/sidecar_cubit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final CollectionListBloc _collectionListBloc;
  late final SidecarCubit _sidecarCubit;

  @override
  void initState() {
    super.initState();
    _sidecarCubit = sl<SidecarCubit>();
    _collectionListBloc = sl<CollectionListBloc>()
      ..add(const CollectionListEvent.load());
  }

  Future<void> _safeNavigate(VoidCallback navigate) async {
    _scaffoldKey.currentState?.closeDrawer();
    await Future.delayed(const Duration(milliseconds: 250));
    if (mounted) {
      navigate();
    }
  }

  @override
  void dispose() {
    _sidecarCubit.close();
    _collectionListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _sidecarCubit),
        BlocProvider.value(value: _collectionListBloc),
      ],
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppTopBar(
          onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
          onSearchPressed: () => context.router.push(SearchRoute()),
          onSettingsPressed: () => context.router.push(const SettingsRoute()),
        ),
        drawer: AppNavigationDrawer(
          onCollectionSelected: (collection) {
            _safeNavigate(() => context.router.push(
              const CreateCollectionRoute(),
            ));
          },
          onBoardSelected: (board) {
            _safeNavigate(() => context.router.push(
              ThreadListRoute(),
            ));
          },
          onStatusPressed: () {
            _safeNavigate(() => context.router.push(const SidecarLogsRoute()));
          },
        ),
        body: const Center(child: Text('Home Screen')),
      ),
    );
  }
}