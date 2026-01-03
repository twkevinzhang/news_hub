import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page|Dialog,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        // Home
        AutoRoute(path: '/', page: HomeRoute.page),

        // NavigationDrawer
        AutoRoute(path: '/collection/create', page: CreateCollectionRoute.page),
        AutoRoute(path: '/thread/list', page: ThreadListRoute.page),
        AutoRoute(path: '/sidecar/logs', page: SidecarLogsRoute.page),

        // TopAppBar
        AutoRoute(
          path: '/settings',
          page: SettingsRoute.page,
        ),
        AutoRoute(path: '/search', page: SearchRoute.page),
        AutoRoute(path: '/extension/manage', page: ExtensionManageRoute.page),
        AutoRoute(path: '/collection/list', page: CollectionListRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
