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
        AutoRoute(path: '/thread-list', page: ThreadListRoute.page),
        AutoRoute(path: '/thread-detail', page: ThreadDetailRoute.page),
        AutoRoute(path: '/extension-repos', page: WrapperRoute.page, children: [
          AutoRoute(path: '', page: ExtensionReposRoute.page),
          AutoRoute(path: 'add', page: AddExtensionRepoRoute.page),
        ]),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
