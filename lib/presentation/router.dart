import 'package:auto_route/auto_route.dart';
import 'package:news_hub/presentation/router.gr.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: HomeRoute.page,
      children: [
        AutoRoute(path: 'threads', page: ThreadsRoute.page),
        AutoRoute(path: 'extensions', page: ExtensionsRoute.page),
        AutoRoute(path: 'settings', page: SettingsRoute.page),
      ],
    ),
    AutoRoute(path: '/search', page: SearchRoute.page),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    // optionally add root guards here
  ];
}