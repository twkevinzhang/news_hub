// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:news_hub/presentation/pages/add_extension_repo/view/add_extension_repo_screen.dart'
    as _i1;
import 'package:news_hub/presentation/pages/extension_repos/view/extension_repos_screen.dart'
    as _i2;
import 'package:news_hub/presentation/pages/extensions/view/extensions_screen.dart'
    as _i3;
import 'package:news_hub/presentation/pages/home_screen.dart' as _i5;
import 'package:news_hub/presentation/pages/settings/view/settings_screen.dart'
    as _i7;
import 'package:news_hub/presentation/pages/thread_infos/screens/filter_by_boards_screen.dart'
    as _i4;
import 'package:news_hub/presentation/pages/thread_infos/screens/search_screen.dart'
    as _i6;
import 'package:news_hub/presentation/pages/thread_infos/screens/thread_infos_screen.dart'
    as _i8;
import 'package:news_hub/presentation/pages/thread_infos/screens/thread_infos_wrapper.dart'
    as _i9;

/// generated route for
/// [_i1.AddExtensionRepoScreen]
class AddExtensionRepoRoute extends _i10.PageRouteInfo<void> {
  const AddExtensionRepoRoute({List<_i10.PageRouteInfo>? children})
    : super(AddExtensionRepoRoute.name, initialChildren: children);

  static const String name = 'AddExtensionRepoRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddExtensionRepoScreen();
    },
  );
}

/// generated route for
/// [_i2.ExtensionReposScreen]
class ExtensionReposRoute extends _i10.PageRouteInfo<void> {
  const ExtensionReposRoute({List<_i10.PageRouteInfo>? children})
    : super(ExtensionReposRoute.name, initialChildren: children);

  static const String name = 'ExtensionReposRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExtensionReposScreen();
    },
  );
}

/// generated route for
/// [_i3.ExtensionsScreen]
class ExtensionsRoute extends _i10.PageRouteInfo<void> {
  const ExtensionsRoute({List<_i10.PageRouteInfo>? children})
    : super(ExtensionsRoute.name, initialChildren: children);

  static const String name = 'ExtensionsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.ExtensionsScreen();
    },
  );
}

/// generated route for
/// [_i4.FilterByBoardsScreen]
class FilterByBoardsRoute extends _i10.PageRouteInfo<void> {
  const FilterByBoardsRoute({List<_i10.PageRouteInfo>? children})
    : super(FilterByBoardsRoute.name, initialChildren: children);

  static const String name = 'FilterByBoardsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.FilterByBoardsScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i10.PageRouteInfo<void> {
  const SearchRoute({List<_i10.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.SearchScreen();
    },
  );
}

/// generated route for
/// [_i7.SettingsScreen]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i8.ThreadInfosScreen]
class ThreadInfosRoute extends _i10.PageRouteInfo<void> {
  const ThreadInfosRoute({List<_i10.PageRouteInfo>? children})
    : super(ThreadInfosRoute.name, initialChildren: children);

  static const String name = 'ThreadInfosRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.ThreadInfosScreen();
    },
  );
}

/// generated route for
/// [_i9.ThreadsInfosWrapper]
class ThreadsInfosWrapper extends _i10.PageRouteInfo<void> {
  const ThreadsInfosWrapper({List<_i10.PageRouteInfo>? children})
    : super(ThreadsInfosWrapper.name, initialChildren: children);

  static const String name = 'ThreadsInfosWrapper';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return _i10.WrappedRoute(child: const _i9.ThreadsInfosWrapper());
    },
  );
}
