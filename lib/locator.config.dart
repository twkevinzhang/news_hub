// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:grpc/grpc.dart' as _i1017;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_hub/app/bookmark/bookmark_repository_impl.dart' as _i495;
import 'package:news_hub/app/collection/collection_repository_impl.dart'
    as _i815;
import 'package:news_hub/app/extension/preferences/extension_preferences_service_impl.dart'
    as _i29;
import 'package:news_hub/app/extension/repository/extension_repo_repository_impl.dart'
    as _i795;
import 'package:news_hub/app/extension/repository/installed_extension_repository_impl.dart'
    as _i753;
import 'package:news_hub/app/service/api/sidecar_api_impl.dart' as _i75;
import 'package:news_hub/app/service/cache/cache.dart' as _i158;
import 'package:news_hub/app/service/database/database.dart' as _i539;
import 'package:news_hub/app/service/grpc/grpc_connection_manager.dart'
    as _i790;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart'
    as _i280;
import 'package:news_hub/app/sidecar/repository/sidecar_repository_impl.dart'
    as _i757;
import 'package:news_hub/app/suggestion/repository/suggestion_repository_impl.dart'
    as _i530;
import 'package:news_hub/domain/api_service.dart' as _i113;
import 'package:news_hub/domain/bookmark/bookmark_repository.dart' as _i521;
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart'
    as _i1049;
import 'package:news_hub/domain/collection/collection_repository.dart' as _i920;
import 'package:news_hub/domain/extension/extension_preferences_service.dart'
    as _i515;
import 'package:news_hub/domain/extension/interactor/add_extension_repo.dart'
    as _i45;
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart'
    as _i266;
import 'package:news_hub/domain/extension/interactor/install_extension.dart'
    as _i783;
import 'package:news_hub/domain/extension/interactor/list_extension_repos.dart'
    as _i443;
import 'package:news_hub/domain/extension/interactor/list_extensions.dart'
    as _i214;
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart'
    as _i351;
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart'
    as _i915;
import 'package:news_hub/domain/extension/interactor/remove_extension_repo.dart'
    as _i428;
import 'package:news_hub/domain/extension/interactor/uninstall_extension.dart'
    as _i517;
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart'
    as _i163;
import 'package:news_hub/domain/extension/repository/installed_extension_repository.dart'
    as _i37;
import 'package:news_hub/domain/sidecar/interactor/get_health_status.dart'
    as _i800;
import 'package:news_hub/domain/sidecar/interactor/watch_health.dart' as _i503;
import 'package:news_hub/domain/sidecar/interactor/watch_logs.dart' as _i617;
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart'
    as _i466;
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart'
    as _i446;
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart'
    as _i643;
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart'
    as _i650;
import 'package:news_hub/domain/suggestion/suggestion_repository.dart' as _i677;
import 'package:news_hub/domain/thread/interactor/get_thread.dart' as _i616;
import 'package:news_hub/domain/thread/interactor/list_regarding_posts.dart'
    as _i492;
import 'package:news_hub/domain/thread/interactor/list_threads.dart' as _i757;
import 'package:news_hub/locator.dart' as _i56;
import 'package:news_hub/presentation/pages/collection/create/bloc/create_collection_cubit.dart'
    as _i235;
import 'package:news_hub/presentation/pages/collection/list/bloc/collection_list_bloc.dart'
    as _i672;
import 'package:news_hub/presentation/pages/extension/bloc/extension_cubit.dart'
    as _i558;
import 'package:news_hub/presentation/pages/extension/bloc/extension_repo_cubit.dart'
    as _i186;
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart'
    as _i21;
import 'package:news_hub/presentation/pages/sidecar/bloc/sidecar_cubit.dart'
    as _i164;
import 'package:news_hub/presentation/pages/sidecar/bloc/sidecar_logs_cubit.dart'
    as _i987;
import 'package:news_hub/presentation/pages/thread/detail/bloc/thread_detail_cubit.dart'
    as _i994;
import 'package:news_hub/presentation/pages/thread/list/bloc/thread_list_cubit.dart'
    as _i660;
import 'package:news_hub/presentation/router/router.dart' as _i762;
import 'package:news_hub/presentation/shared/boards_picker/bloc/boards_picker_cubit.dart'
    as _i919;
import 'package:rx_shared_preferences/rx_shared_preferences.dart' as _i579;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appProvider = _$AppProvider();
    await gh.factoryAsync<_i579.SharedPreferences>(
      () => appProvider.prefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => appProvider.dio);
    gh.singleton<_i539.AppDatabase>(() => _i539.AppDatabase());
    gh.singleton<_i158.CacheService>(() => _i158.CacheService());
    gh.singleton<_i790.GrpcConnectionManager>(
        () => _i790.GrpcConnectionManager());
    gh.lazySingleton<_i762.AppRouter>(() => _i762.AppRouter());
    gh.lazySingleton<_i1017.ClientChannel>(
        () => appProvider.clientChannel(gh<_i790.GrpcConnectionManager>()));
    gh.lazySingleton<_i677.SuggestionRepository>(
        () => _i530.SuggestionRepositoryImpl(db: gh<_i539.AppDatabase>()));
    gh.lazySingleton<_i920.CollectionRepository>(
        () => _i815.CollectionRepositoryImpl(db: gh<_i539.AppDatabase>()));
    gh.lazySingleton<_i521.BookmarkRepository>(
        () => _i495.BookmarkRepositoryImpl());
    gh.factory<_i235.CreateCollectionCubit>(
        () => _i235.CreateCollectionCubit(gh<_i920.CollectionRepository>()));
    gh.lazySingleton<_i1049.ListBookmarks>(
        () => _i1049.ListBookmarks(repo: gh<_i521.BookmarkRepository>()));
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
    gh.lazySingleton<_i515.ExtensionPreferencesService>(() =>
        _i29.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.lazySingleton<_i643.ListSuggestions>(() => _i643.ListSuggestions(
        suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.lazySingleton<_i650.UpdateSuggestionLatestUsedAt>(() =>
        _i650.UpdateSuggestionLatestUsedAt(
            suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.lazySingleton<_i446.InsertSuggestion>(() => _i446.InsertSuggestion(
        suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.lazySingleton<_i113.ApiService>(
        () => _i75.SidecarApiImpl(clientChannel: gh<_i1017.ClientChannel>()));
    gh.factory<_i672.CollectionListBloc>(
        () => _i672.CollectionListBloc(gh<_i920.CollectionRepository>()));
    gh.lazySingleton<_i163.ExtensionRepoRepository>(
        () => _i795.ExtensionRepoRepositoryImpl(
              gh<_i113.ApiService>(),
              gh<_i790.GrpcConnectionManager>(),
            ));
    gh.lazySingleton<_i466.SidecarRepository>(() => _i757.SidecarRepositoryImpl(
          gh<_i113.ApiService>(),
          gh<_i790.GrpcConnectionManager>(),
        ));
    gh.singleton<_i280.SidecarPreferences>(
        () => appProvider.sidecarPreferences(gh<_i365.PreferenceStore>()));
    gh.factory<_i56.Launcher>(() => _i56.AppLauncher(
          gh<_i790.GrpcConnectionManager>(),
          gh<_i466.SidecarRepository>(),
          gh<_i280.SidecarPreferences>(),
        ));
    gh.factory<_i987.SidecarLogsCubit>(() => _i987.SidecarLogsCubit(
          gh<_i790.GrpcConnectionManager>(),
          gh<_i280.SidecarPreferences>(),
        ));
    gh.lazySingleton<_i45.AddExtensionRepo>(
        () => _i45.AddExtensionRepo(gh<_i163.ExtensionRepoRepository>()));
    gh.lazySingleton<_i428.RemoveExtensionRepo>(
        () => _i428.RemoveExtensionRepo(gh<_i163.ExtensionRepoRepository>()));
    gh.lazySingleton<_i443.ListExtensionRepos>(
        () => _i443.ListExtensionRepos(gh<_i163.ExtensionRepoRepository>()));
    gh.lazySingleton<_i37.InstalledExtensionRepository>(
        () => _i753.InstalledExtensionRepositoryImpl(
              gh<_i113.ApiService>(),
              gh<_i790.GrpcConnectionManager>(),
              gh<_i163.ExtensionRepoRepository>(),
            ));
    gh.factory<_i186.ExtensionRepoCubit>(() => _i186.ExtensionRepoCubit(
          listExtensionRepos: gh<_i443.ListExtensionRepos>(),
          addExtensionRepo: gh<_i45.AddExtensionRepo>(),
          removeExtensionRepo: gh<_i428.RemoveExtensionRepo>(),
        ));
    gh.lazySingleton<_i351.ListInstalledExtensions>(
        () => _i351.ListInstalledExtensions(
              repository: gh<_i37.InstalledExtensionRepository>(),
              apiService: gh<_i113.ApiService>(),
            ));
    gh.lazySingleton<_i783.InstallExtension>(() => _i783.InstallExtension(
        repository: gh<_i37.InstalledExtensionRepository>()));
    gh.lazySingleton<_i517.UninstallExtension>(() => _i517.UninstallExtension(
        repository: gh<_i37.InstalledExtensionRepository>()));
    gh.lazySingleton<_i266.GetInstalledExtension>(() =>
        _i266.GetInstalledExtension(
            repository: gh<_i37.InstalledExtensionRepository>()));
    gh.lazySingleton<_i915.ListRemoteExtensions>(() =>
        _i915.ListRemoteExtensions(
            repository: gh<_i37.InstalledExtensionRepository>()));
    gh.lazySingleton<_i616.GetThread>(() => _i616.GetThread(
          apiService: gh<_i113.ApiService>(),
          installedExtensionRepository: gh<_i266.GetInstalledExtension>(),
        ));
    gh.lazySingleton<_i492.ListRegardingPosts>(() => _i492.ListRegardingPosts(
          apiService: gh<_i113.ApiService>(),
          installedExtensionRepository: gh<_i266.GetInstalledExtension>(),
        ));
    gh.factory<_i503.WatchHealthUseCase>(
        () => _i503.WatchHealthUseCase(gh<_i466.SidecarRepository>()));
    gh.factory<_i800.GetHealthStatusUseCase>(
        () => _i800.GetHealthStatusUseCase(gh<_i466.SidecarRepository>()));
    gh.factory<_i617.WatchLogsUseCase>(
        () => _i617.WatchLogsUseCase(gh<_i466.SidecarRepository>()));
    gh.lazySingleton<_i214.ListExtensions>(() => _i214.ListExtensions(
          prefService: gh<_i515.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i915.ListRemoteExtensions>(),
        ));
    gh.lazySingleton<_i757.ListThreads>(() => _i757.ListThreads(
          apiService: gh<_i113.ApiService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    gh.factory<_i919.BoardsPickerCubit>(
        () => _i919.BoardsPickerCubit(gh<_i351.ListInstalledExtensions>()));
    gh.factory<_i994.ThreadDetailCubit>(() => _i994.ThreadDetailCubit(
          getThread: gh<_i616.GetThread>(),
          listRegardingPosts: gh<_i492.ListRegardingPosts>(),
        ));
    gh.factory<_i558.ExtensionCubit>(() => _i558.ExtensionCubit(
          listExtensions: gh<_i214.ListExtensions>(),
          installExtension: gh<_i783.InstallExtension>(),
          uninstallExtension: gh<_i517.UninstallExtension>(),
        ));
    gh.factory<_i164.SidecarCubit>(
        () => _i164.SidecarCubit(gh<_i503.WatchHealthUseCase>()));
    gh.factory<_i21.SearchCubit>(() => _i21.SearchCubit(
          listSuggestions: gh<_i643.ListSuggestions>(),
          updateSuggestionLatestUsedAt:
              gh<_i650.UpdateSuggestionLatestUsedAt>(),
          insertSuggestion: gh<_i446.InsertSuggestion>(),
          listThreadList: gh<_i757.ListThreads>(),
        ));
    gh.factory<_i660.ThreadListCubit>(() => _i660.ThreadListCubit(
          listThreadList: gh<_i757.ListThreads>(),
          listExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
