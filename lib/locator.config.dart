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
import 'package:news_hub/app/extension/api/grpc_extension_api_service_impl.dart'
    as _i672;
import 'package:news_hub/app/extension/api/mock_extension_api_service_impl.dart'
    as _i511;
import 'package:news_hub/app/extension/installer/extension_install_service_impl.dart'
    as _i1036;
import 'package:news_hub/app/extension/installer/mock_extension_install_service_impl.dart'
    as _i863;
import 'package:news_hub/app/extension/preferences/extension_preferences_service_impl.dart'
    as _i29;
import 'package:news_hub/app/extension/repository/collection_repository_impl.dart'
    as _i548;
import 'package:news_hub/app/extension/repository/installed_extension_repository_impl.dart'
    as _i753;
import 'package:news_hub/app/extension/repository/mock_installed_extension_repository_impl.dart'
    as _i1056;
import 'package:news_hub/app/extension_repo/api/extension_repo_api_service_impl.dart'
    as _i999;
import 'package:news_hub/app/extension_repo/api/mock_extension_repo_api_service_impl.dart'
    as _i681;
import 'package:news_hub/app/extension_repo/repository/extension_repo_repository_impl.dart'
    as _i374;
import 'package:news_hub/app/extension_repo/repository/mock_extension_repo_repository_impl.dart'
    as _i178;
import 'package:news_hub/app/service/cache/cache.dart' as _i158;
import 'package:news_hub/app/service/database/database.dart' as _i539;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/app/suggestion/repository/suggestion_repository_impl.dart'
    as _i530;
import 'package:news_hub/domain/bookmark/bookmark_repository.dart' as _i521;
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart'
    as _i1049;
import 'package:news_hub/domain/extension/collection_repository.dart' as _i682;
import 'package:news_hub/domain/extension/extension.dart' as _i315;
import 'package:news_hub/domain/extension/extension_api_service.dart' as _i892;
import 'package:news_hub/domain/extension/extension_install_service.dart'
    as _i103;
import 'package:news_hub/domain/extension/extension_preferences_service.dart'
    as _i515;
import 'package:news_hub/domain/extension/extension_repository.dart' as _i981;
import 'package:news_hub/domain/extension/interactor/install_extension.dart'
    as _i783;
import 'package:news_hub/domain/extension/interactor/list_extensions.dart'
    as _i214;
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart'
    as _i351;
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart'
    as _i915;
import 'package:news_hub/domain/extension/interactor/uninstall_extension.dart'
    as _i517;
import 'package:news_hub/domain/extension_repo/extension_repo.dart' as _i623;
import 'package:news_hub/domain/extension_repo/extension_repo_api_service.dart'
    as _i1021;
import 'package:news_hub/domain/extension_repo/extension_repo_repository.dart'
    as _i525;
import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart'
    as _i460;
import 'package:news_hub/domain/extension_repo/interactor/delete_extension_repo.dart'
    as _i1062;
import 'package:news_hub/domain/extension_repo/interactor/get_extension_repo.dart'
    as _i581;
import 'package:news_hub/domain/extension_repo/interactor/get_remote_extension_repo.dart'
    as _i872;
import 'package:news_hub/domain/extension_repo/interactor/list_extension_repos.dart'
    as _i25;
import 'package:news_hub/domain/extension_repo/interactor/valid_extension_repo_url.dart'
    as _i475;
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart'
    as _i446;
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart'
    as _i643;
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart'
    as _i650;
import 'package:news_hub/domain/suggestion/suggestion_repository.dart' as _i677;
import 'package:news_hub/domain/thread/interactor/get_thread.dart' as _i616;
import 'package:news_hub/domain/thread/interactor/get_thread_list.dart'
    as _i791;
import 'package:news_hub/domain/thread/interactor/list_regarding_posts.dart'
    as _i492;
import 'package:news_hub/locator.dart' as _i56;
import 'package:news_hub/presentation/pages/collection/create/bloc/create_collection_cubit.dart'
    as _i235;
import 'package:news_hub/presentation/pages/collection/list/bloc/collection_list_bloc.dart'
    as _i672;
import 'package:news_hub/presentation/pages/extension/bloc/extension_cubit.dart'
    as _i558;
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart'
    as _i21;
import 'package:news_hub/presentation/pages/thread/detail/bloc/thread_detail_cubit.dart'
    as _i994;
import 'package:news_hub/presentation/pages/thread/list/bloc/thread_list_cubit.dart'
    as _i660;
import 'package:news_hub/presentation/router/router.dart' as _i762;
import 'package:news_hub/presentation/shared/boards_picker/bloc/boards_picker_cubit.dart'
    as _i919;
import 'package:news_hub/presentation/sidecar/sidecar_cubit.dart' as _i487;
import 'package:rx_shared_preferences/rx_shared_preferences.dart' as _i579;

const String _mockData = 'mockData';
const String _localAdapter = 'localAdapter';
const String _remoteAdapter = 'remoteAdapter';

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
    gh.lazySingleton<_i475.ValidExtensionRepoUrl>(
        () => _i475.ValidExtensionRepoUrl());
    gh.lazySingleton<_i762.AppRouter>(() => _i762.AppRouter());
    gh.lazySingleton<_i487.SidecarCubit>(() => _i487.SidecarCubit());
    gh.factory<_i56.Launcher>(
      () => _i56.MockDataLauncher(),
      registerFor: {_mockData},
    );
    gh.lazySingleton<_i315.ExtensionApiService>(
      () => _i511.MockExtensionApiServiceImpl(),
      registerFor: {_mockData},
    );
    gh.lazySingleton<_i623.ExtensionRepoApiService>(
      () => _i681.MockExtensionRepoApiServiceImpl(),
      registerFor: {_mockData},
    );
    gh.lazySingleton<_i677.SuggestionRepository>(
        () => _i530.SuggestionRepositoryImpl(db: gh<_i539.AppDatabase>()));
    gh.lazySingleton<_i981.InstalledExtensionRepository>(
      () => _i753.InstalledExtensionRepositoryImpl(db: gh<_i539.AppDatabase>()),
      registerFor: {
        _localAdapter,
        _remoteAdapter,
      },
    );
    gh.lazySingleton<_i981.InstalledExtensionRepository>(
      () => _i1056.MockInstalledExtensionRepositoryImpl(),
      registerFor: {_mockData},
    );
    await gh.lazySingletonAsync<_i315.ExtensionInstallService>(
      () => _i863.MockExtensionInstallServiceImpl.create(),
      registerFor: {_mockData},
      preResolve: true,
    );
    gh.lazySingleton<_i623.ExtensionRepoRepository>(
      () => _i178.MockExtensionRepoRepositoryImpl(),
      registerFor: {_mockData},
    );
    gh.lazySingleton<_i1017.ClientChannel>(
      () => appProvider.local,
      registerFor: {_localAdapter},
    );
    await gh.lazySingletonAsync<_i315.ExtensionInstallService>(
      () => _i1036.ExtensionInstallServiceImpl.create(),
      registerFor: {
        _localAdapter,
        _remoteAdapter,
      },
      preResolve: true,
    );
    gh.lazySingleton<_i682.CollectionRepository>(
      () => _i548.CollectionRepositoryImpl(db: gh<_i539.AppDatabase>()),
      registerFor: {
        _localAdapter,
        _remoteAdapter,
      },
    );
    gh.lazySingleton<_i581.GetExtensionRepo>(() =>
        _i581.GetExtensionRepo(repo: gh<_i623.ExtensionRepoRepository>()));
    gh.lazySingleton<_i616.GetThread>(() => _i616.GetThread(
          apiService: gh<_i892.ExtensionApiService>(),
          installedExtensionRepository:
              gh<_i981.InstalledExtensionRepository>(),
        ));
    gh.lazySingleton<_i492.ListRegardingPosts>(() => _i492.ListRegardingPosts(
          apiService: gh<_i892.ExtensionApiService>(),
          installedExtensionRepository:
              gh<_i981.InstalledExtensionRepository>(),
        ));
    gh.lazySingleton<_i517.UninstallExtension>(() => _i517.UninstallExtension(
        installService: gh<_i103.ExtensionInstallService>()));
    gh.lazySingleton<_i521.BookmarkRepository>(
        () => _i495.BookmarkRepositoryImpl());
    gh.lazySingleton<_i623.ExtensionRepoRepository>(
      () => _i374.ExtensionRepoRepositoryImpl(db: gh<_i539.AppDatabase>()),
      registerFor: {
        _localAdapter,
        _remoteAdapter,
      },
    );
    gh.lazySingleton<_i1049.ListBookmarks>(
        () => _i1049.ListBookmarks(repo: gh<_i521.BookmarkRepository>()));
    gh.lazySingleton<_i623.ExtensionRepoApiService>(
      () => _i999.ExtensionRepoApiServiceImpl(dio: gh<_i361.Dio>()),
      registerFor: {
        _localAdapter,
        _remoteAdapter,
      },
    );
    gh.lazySingleton<_i25.ListExtensionRepo>(() => _i25.ListExtensionRepo(
        repository: gh<_i525.ExtensionRepoRepository>()));
    gh.lazySingleton<_i1062.DeleteExtensionRepo>(() =>
        _i1062.DeleteExtensionRepo(
            repository: gh<_i525.ExtensionRepoRepository>()));
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
    gh.factory<_i994.ThreadDetailCubit>(() => _i994.ThreadDetailCubit(
          getThread: gh<_i616.GetThread>(),
          listRegardingPosts: gh<_i492.ListRegardingPosts>(),
        ));
    gh.lazySingleton<_i351.ListInstalledExtensions>(
        () => _i351.ListInstalledExtensions(
              apiService: gh<_i892.ExtensionApiService>(),
              extensionRepo: gh<_i981.InstalledExtensionRepository>(),
            ));
    gh.lazySingleton<_i783.InstallExtension>(() => _i783.InstallExtension(
          extensionApiService: gh<_i892.ExtensionApiService>(),
          installService: gh<_i103.ExtensionInstallService>(),
          extensionRepository: gh<_i981.InstalledExtensionRepository>(),
        ));
    gh.lazySingleton<_i315.ExtensionApiService>(
      () => _i672.GrpcExtensionApiServiceImpl(
          clientChannel: gh<_i1017.ClientChannel>()),
      registerFor: {
        _localAdapter,
        _remoteAdapter,
      },
    );
    gh.lazySingleton<_i872.GetRemoteExtensionRepo>(() =>
        _i872.GetRemoteExtensionRepo(
            service: gh<_i1021.ExtensionRepoApiService>()));
    gh.lazySingleton<_i460.CreateExtensionRepo>(() => _i460.CreateExtensionRepo(
          repository: gh<_i525.ExtensionRepoRepository>(),
          service: gh<_i1021.ExtensionRepoApiService>(),
        ));
    gh.factory<_i56.Launcher>(
      () => _i56.LocalAdapterLauncher(
        extensionRepository: gh<_i981.InstalledExtensionRepository>(),
        apiService: gh<_i892.ExtensionApiService>(),
      ),
      registerFor: {_localAdapter},
    );
    gh.lazySingleton<_i1017.ClientChannel>(
      () => appProvider.remote(),
      registerFor: {_remoteAdapter},
    );
    gh.lazySingleton<_i643.ListSuggestions>(() => _i643.ListSuggestions(
        suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.lazySingleton<_i650.UpdateSuggestionLatestUsedAt>(() =>
        _i650.UpdateSuggestionLatestUsedAt(
            suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.lazySingleton<_i446.InsertSuggestion>(() => _i446.InsertSuggestion(
        suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.factory<_i56.Launcher>(
      () => _i56.RemoteAdapterLauncher(
          extensionRepository: gh<_i981.InstalledExtensionRepository>()),
      registerFor: {_remoteAdapter},
    );
    gh.lazySingleton<_i915.ListRemoteExtensions>(
        () => _i915.ListRemoteExtensions(
              extensionRepoRepository: gh<_i623.ExtensionRepoRepository>(),
              extensionApiService: gh<_i623.ExtensionRepoApiService>(),
            ));
    gh.lazySingleton<_i791.GetThreadList>(() => _i791.GetThreadList(
          apiService: gh<_i892.ExtensionApiService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    gh.factory<_i660.ThreadListCubit>(() => _i660.ThreadListCubit(
          listThreadList: gh<_i791.GetThreadList>(),
          listExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    gh.factory<_i21.SearchCubit>(() => _i21.SearchCubit(
          listSuggestions: gh<_i643.ListSuggestions>(),
          updateSuggestionLatestUsedAt:
              gh<_i650.UpdateSuggestionLatestUsedAt>(),
          insertSuggestion: gh<_i446.InsertSuggestion>(),
          listThreadList: gh<_i791.GetThreadList>(),
        ));
    gh.factory<_i672.CollectionListBloc>(
        () => _i672.CollectionListBloc(gh<_i682.CollectionRepository>()));
    gh.factory<_i235.CreateCollectionCubit>(
        () => _i235.CreateCollectionCubit(gh<_i682.CollectionRepository>()));
    gh.factory<_i919.BoardsPickerCubit>(
        () => _i919.BoardsPickerCubit(gh<_i351.ListInstalledExtensions>()));
    gh.lazySingleton<_i315.ExtensionPreferencesService>(() =>
        _i29.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.lazySingleton<_i214.ListExtensions>(() => _i214.ListExtensions(
          prefService: gh<_i515.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i915.ListRemoteExtensions>(),
        ));
    gh.factory<_i558.ExtensionCubit>(() => _i558.ExtensionCubit(
          listExtensions: gh<_i315.ListExtensions>(),
          installExtension: gh<_i315.InstallExtension>(),
          uninstallExtension: gh<_i315.UninstallExtension>(),
          extensionRepoApiService: gh<_i623.ExtensionRepoApiService>(),
        ));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
