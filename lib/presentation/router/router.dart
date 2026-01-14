import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page|Dialog,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(path: 'collection/:collectionId/threads/list', page: CollectionThreadListRoute.page),
            AutoRoute(path: 'collection/:collectionId/boards/:boardId/threads/list', page: CollectionBoardThreadListRoute.page),
          ],
        ),
        AutoRoute(path: '/collection/create', page: CollectionCreateRoute.page),
        AutoRoute(path: '/collection/edit', page: CollectionEditRoute.page),
        AutoRoute(path: '/collection/:collectionId/threads/search', page: SearchRoute.page),

        // AutoRoute(path: '/threads/list', page: ThreadListRoute.page),
        AutoRoute(path: '/threads/:threadId', page: ThreadDetailRoute.page),

        AutoRoute(path: '/settings', page: SettingsRoute.page),
        AutoRoute(path: '/settings/collections', page: CollectionManageRoute.page),
        AutoRoute(path: '/settings/extensions', page: ExtensionManageRoute.page),
        AutoRoute(path: '/settings/sidecar', page: SidecarManageRoute.page),

        AutoRoute(path: '/sidecar/logs', page: SidecarLogsRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
