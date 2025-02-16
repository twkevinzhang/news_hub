import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: 'thread-infos',
              page: ThreadsInfosWrapper.page,
              children: [
                AutoRoute(path: '', page: ThreadInfosRoute.page),
                AutoRoute(path: 'search', page: SearchRoute.page),
                AutoRoute(path: 'filter-by-boards', page: FilterByBoardsRoute.page),
              ],
            ),
            AutoRoute(path: 'extensions', page: ExtensionsRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),
        AutoRoute(path: '/extension-repos', page: ExtensionReposRoute.page, children: []),
        AutoRoute(
          path: '/extension-repos/add',
          page: AddExtensionRepoRoute.page,
          fullscreenDialog: true,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
