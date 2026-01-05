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
        // ============================================
        // 🏠 App Shell - 應用框架
        // ============================================
        AutoRoute(path: '/', page: HomeRoute.page),
        AutoRoute(path: '/settings', page: SettingsRoute.page),

        // ============================================
        // 📰 Content Discovery - 內容探索
        // ============================================
        AutoRoute(path: '/thread/list', page: ThreadListRoute.page),
        AutoRoute(path: '/search', page: SearchRoute.page),

        // ============================================
        // 📁 Content Organization - 內容整理
        // ============================================
        AutoRoute(path: '/collection/list', page: CollectionListRoute.page),
        AutoRoute(path: '/collection/create', page: CreateCollectionRoute.page),

        // ============================================
        // 🧩 Extension Marketplace - 擴充市集
        // ============================================
        AutoRoute(path: '/settings/extensions', page: ExtensionManageRoute.page),

        // ============================================
        // ⚙️ System Operations - 系統維運
        // ============================================
        AutoRoute(path: '/sidecar/logs', page: SidecarLogsRoute.page),
        AutoRoute(path: '/settings/sidecar', page: SidecarManageRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
