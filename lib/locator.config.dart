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
import 'package:news_hub/app/service/api/sidecar_api.dart' as _i979;
import 'package:news_hub/app/service/cache/cache.dart' as _i158;
import 'package:news_hub/app/service/database/database.dart' as _i539;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/app/suggestion/repository/suggestion_repository_impl.dart'
    as _i530;
import 'package:news_hub/domain/bookmark/bookmark_repository.dart' as _i521;
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart'
    as _i1049;
import 'package:news_hub/domain/collection/collection_repository.dart' as _i920;
import 'package:news_hub/domain/extension/extension.dart' as _i315;
import 'package:news_hub/domain/extension/extension_install_service.dart'
    as _i103;
import 'package:news_hub/domain/extension/extension_preferences_service.dart'
    as _i515;
import 'package:news_hub/domain/extension/installed_extension_repository.dart'
    as _i217;
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
    gh.lazySingleton<_i915.ListRemoteExtensions>(
        () => _i915.ListRemoteExtensions());
    gh.lazySingleton<_i762.AppRouter>(() => _i762.AppRouter());
    gh.lazySingleton<_i487.SidecarCubit>(() => _i487.SidecarCubit());
    gh.lazySingleton<_i783.InstallExtension>(() => _i783.InstallExtension(
          installService: gh<_i103.ExtensionInstallService>(),
          extensionRepository: gh<_i217.GetInstalledExtension>(),
        ));
    gh.lazySingleton<_i677.SuggestionRepository>(
        () => _i530.SuggestionRepositoryImpl(db: gh<_i539.AppDatabase>()));
    gh.lazySingleton<_i920.CollectionRepository>(
        () => _i815.CollectionRepositoryImpl(db: gh<_i539.AppDatabase>()));
    gh.lazySingleton<_i517.UninstallExtension>(() => _i517.UninstallExtension(
        installService: gh<_i103.ExtensionInstallService>()));
    gh.lazySingleton<_i521.BookmarkRepository>(
        () => _i495.BookmarkRepositoryImpl());
    gh.factory<_i235.CreateCollectionCubit>(
        () => _i235.CreateCollectionCubit(gh<_i920.CollectionRepository>()));
    gh.lazySingleton<_i1049.ListBookmarks>(
        () => _i1049.ListBookmarks(repo: gh<_i521.BookmarkRepository>()));
    gh.lazySingleton<_i351.ListInstalledExtensions>(
        () => _i351.ListInstalledExtensions(
              apiService: gh<InvalidType>(),
              extensionRepo: gh<_i217.GetInstalledExtension>(),
            ));
    gh.factory<_i919.BoardsPickerCubit>(
        () => _i919.BoardsPickerCubit(gh<_i351.ListInstalledExtensions>()));
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
    gh.lazySingleton<_i616.GetThread>(() => _i616.GetThread(
          apiService: gh<InvalidType>(),
          installedExtensionRepository:
              gh<_i217.GetInstalledExtension>(),
        ));
    gh.lazySingleton<_i492.ListRegardingPosts>(() => _i492.ListRegardingPosts(
          apiService: gh<InvalidType>(),
          installedExtensionRepository:
              gh<_i217.GetInstalledExtension>(),
        ));
    gh.lazySingleton<_i979.SidecarApi>(
        () => _i979.SidecarApi(clientChannel: gh<_i1017.ClientChannel>()));
    gh.lazySingleton<_i643.ListSuggestions>(() => _i643.ListSuggestions(
        suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.lazySingleton<_i650.UpdateSuggestionLatestUsedAt>(() =>
        _i650.UpdateSuggestionLatestUsedAt(
            suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.lazySingleton<_i446.InsertSuggestion>(() => _i446.InsertSuggestion(
        suggestionRepo: gh<_i677.SuggestionRepository>()));
    gh.factory<_i672.CollectionListBloc>(
        () => _i672.CollectionListBloc(gh<_i920.CollectionRepository>()));
    gh.lazySingleton<_i757.ListThreads>(() => _i757.ListThreads(
          apiService: gh<InvalidType>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    gh.lazySingleton<_i315.ExtensionPreferencesService>(() =>
        _i29.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.factory<_i994.ThreadDetailCubit>(() => _i994.ThreadDetailCubit(
          getThread: gh<_i616.GetThread>(),
          listRegardingPosts: gh<_i492.ListRegardingPosts>(),
        ));
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
    gh.lazySingleton<_i214.ListExtensions>(() => _i214.ListExtensions(
          prefService: gh<_i515.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i915.ListRemoteExtensions>(),
        ));
    gh.factory<_i558.ExtensionCubit>(() => _i558.ExtensionCubit(
          listExtensions: gh<_i315.ListExtensions>(),
          installExtension: gh<_i315.InstallExtension>(),
          uninstallExtension: gh<_i315.UninstallExtension>(),
          extensionRepoApiService: gh<InvalidType>(),
        ));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
