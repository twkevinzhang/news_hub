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
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_hub/app/bookmark/bookmark_repository_impl.dart' as _i495;
import 'package:news_hub/app/collection/board_repository_impl.dart' as _i980;
import 'package:news_hub/app/collection/collection_repository_impl.dart'
    as _i815;
import 'package:news_hub/app/extension/preferences/extension_preferences_service_impl.dart'
    as _i29;
import 'package:news_hub/app/extension/repository/extension_repository_impl.dart'
    as _i657;
import 'package:news_hub/app/extension/repository/repo_repository_impl.dart'
    as _i128;
import 'package:news_hub/app/service/api/api_service.dart' as _i504;
import 'package:news_hub/app/service/api/sidecar_api_impl.dart' as _i75;
import 'package:news_hub/app/service/cache/cache.dart' as _i158;
import 'package:news_hub/app/service/connection/grpc_connection_manager_impl.dart'
    as _i908;
import 'package:news_hub/app/service/connection/interface.dart' as _i976;
import 'package:news_hub/app/service/database/database.dart' as _i539;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart'
    as _i280;
import 'package:news_hub/app/sidecar/repository/sidecar_repository_impl.dart'
    as _i757;
import 'package:news_hub/app/suggestion/repository/suggestion_repository_impl.dart'
    as _i530;
import 'package:news_hub/app/thread/thread_repository_impl.dart' as _i770;
import 'package:news_hub/domain/board/interactor/get_board_sort_options.dart'
    as _i744;
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart'
    as _i1049;
import 'package:news_hub/domain/bookmark/repository.dart' as _i960;
import 'package:news_hub/domain/collection/board_repository.dart' as _i1052;
import 'package:news_hub/domain/collection/interactor/create_collection.dart'
    as _i803;
import 'package:news_hub/domain/collection/interactor/delete_collection.dart'
    as _i606;
import 'package:news_hub/domain/collection/interactor/get_collection.dart'
    as _i585;
import 'package:news_hub/domain/collection/interactor/get_collection_board.dart'
    as _i996;
import 'package:news_hub/domain/collection/interactor/get_collections.dart'
    as _i74;
import 'package:news_hub/domain/collection/interactor/update_collection.dart'
    as _i913;
import 'package:news_hub/domain/collection/interactor/watch_collections.dart'
    as _i486;
import 'package:news_hub/domain/collection/repository.dart' as _i914;
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart'
    as _i266;
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
import 'package:news_hub/domain/extension/repository.dart' as _i198;
import 'package:news_hub/domain/extension/services/extension_preferences_service.dart'
    as _i191;
import 'package:news_hub/domain/repo/interactor/add_repo.dart' as _i1048;
import 'package:news_hub/domain/repo/interactor/list_repos.dart' as _i608;
import 'package:news_hub/domain/repo/interactor/remove_repo.dart' as _i154;
import 'package:news_hub/domain/repo/repository.dart' as _i989;
import 'package:news_hub/domain/sidecar/repository.dart' as _i611;
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart'
    as _i446;
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart'
    as _i643;
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart'
    as _i650;
import 'package:news_hub/domain/suggestion/repository.dart' as _i678;
import 'package:news_hub/domain/thread/interactor/get_original_post.dart'
    as _i161;
import 'package:news_hub/domain/thread/interactor/list_board_threads.dart'
    as _i152;
import 'package:news_hub/domain/thread/interactor/list_collection_threads.dart'
    as _i861;
import 'package:news_hub/domain/thread/interactor/list_comments.dart' as _i414;
import 'package:news_hub/domain/thread/interactor/list_replies.dart' as _i587;
import 'package:news_hub/domain/thread/interactor/search_threads.dart'
    as _i1012;
import 'package:news_hub/domain/thread/repository.dart' as _i1044;
import 'package:news_hub/locator.dart' as _i56;
import 'package:news_hub/presentation/components/forms/collection/bloc/collection_form_cubit.dart'
    as _i545;
import 'package:news_hub/presentation/components/rendering/boards-picker/bloc/boards_picker_cubit.dart'
    as _i274;
import 'package:news_hub/presentation/pages/collection/:collectionId/boards/:boardId/threads/list/bloc/collection_board_thread_list_cubit.dart'
    as _i492;
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/bloc/collection_thread_list_cubit.dart'
    as _i525;
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/search/bloc/search_cubit.dart'
    as _i470;
import 'package:news_hub/presentation/pages/home/home_cubit.dart' as _i936;
import 'package:news_hub/presentation/pages/settings/collections/bloc/collection_cubit.dart'
    as _i31;
import 'package:news_hub/presentation/pages/settings/extensions/bloc/extension_cubit.dart'
    as _i34;
import 'package:news_hub/presentation/pages/settings/extensions/bloc/repo_cubit.dart'
    as _i91;
import 'package:news_hub/presentation/pages/sidecar/logs/sidecar_logs_cubit.dart'
    as _i515;
import 'package:news_hub/presentation/pages/thread/detail/bloc/thread_detail_cubit.dart'
    as _i994;
import 'package:news_hub/presentation/router/router.dart' as _i762;
import 'package:rx_shared_preferences/rx_shared_preferences.dart' as _i579;

const String _sidecar = 'sidecar';
const String _remote = 'remote';

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
    gh.lazySingleton<_i762.AppRouter>(() => _i762.AppRouter());
    gh.lazySingleton<_i960.BookmarkRepository>(
        () => _i495.BookmarkRepositoryImpl());
    gh.lazySingleton<_i504.ApiService>(() => _i75.SidecarApiImpl());
    gh.lazySingleton<_i1049.ListBookmarks>(
        () => _i1049.ListBookmarks(repo: gh<_i960.BookmarkRepository>()));
    gh.lazySingleton<_i678.SuggestionRepository>(
        () => _i530.SuggestionRepositoryImpl(db: gh<_i539.AppDatabase>()));
    gh.lazySingleton<_i914.CollectionRepository>(
        () => _i815.CollectionRepositoryImpl(db: gh<_i539.AppDatabase>()));
    gh.lazySingleton<_i1052.BoardRepository>(() => _i980.BoardRepositoryImpl(
          gh<_i504.ApiService>(),
          gh<_i539.AppDatabase>(),
        ));
    gh.factory<_i996.GetCollectionBoard>(
        () => _i996.GetCollectionBoard(gh<_i1052.BoardRepository>()));
    gh.factory<_i744.GetBoardSortOptions>(
        () => _i744.GetBoardSortOptions(gh<_i1052.BoardRepository>()));
    gh.lazySingleton<_i1044.ThreadRepository>(
        () => _i770.ThreadRepositoryImpl(gh<_i504.ApiService>()));
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
    gh.factory<_i545.CollectionFormCubit>(() => _i545.CollectionFormCubit(
          gh<_i914.CollectionRepository>(),
          gh<_i744.GetBoardSortOptions>(),
        ));
    gh.lazySingleton<_i861.ListCollectionThreads>(
        () => _i861.ListCollectionThreads(
              repository: gh<_i1044.ThreadRepository>(),
              collectionRepository: gh<_i914.CollectionRepository>(),
            ));
    gh.lazySingleton<_i152.ListBoardThreads>(() => _i152.ListBoardThreads(
          repository: gh<_i1044.ThreadRepository>(),
          boardRepository: gh<_i1052.BoardRepository>(),
        ));
    gh.lazySingleton<_i643.ListSuggestions>(() => _i643.ListSuggestions(
        suggestionRepo: gh<_i678.SuggestionRepository>()));
    gh.lazySingleton<_i650.UpdateSuggestionLatestUsedAt>(() =>
        _i650.UpdateSuggestionLatestUsedAt(
            suggestionRepo: gh<_i678.SuggestionRepository>()));
    gh.lazySingleton<_i446.InsertSuggestion>(() => _i446.InsertSuggestion(
        suggestionRepo: gh<_i678.SuggestionRepository>()));
    gh.factory<_i74.GetCollections>(
        () => _i74.GetCollections(gh<_i914.CollectionRepository>()));
    gh.factory<_i486.WatchCollections>(
        () => _i486.WatchCollections(gh<_i914.CollectionRepository>()));
    gh.factory<_i803.CreateCollection>(
        () => _i803.CreateCollection(gh<_i914.CollectionRepository>()));
    gh.factory<_i606.DeleteCollection>(
        () => _i606.DeleteCollection(gh<_i914.CollectionRepository>()));
    gh.factory<_i585.GetCollection>(
        () => _i585.GetCollection(gh<_i914.CollectionRepository>()));
    gh.factory<_i913.UpdateCollection>(
        () => _i913.UpdateCollection(gh<_i914.CollectionRepository>()));
    gh.factory<_i31.CollectionCubit>(
        () => _i31.CollectionCubit(gh<_i914.CollectionRepository>()));
    gh.factory<_i492.CollectionBoardThreadListCubit>(
        () => _i492.CollectionBoardThreadListCubit(
              gh<_i585.GetCollection>(),
              gh<_i996.GetCollectionBoard>(),
              gh<_i152.ListBoardThreads>(),
            ));
    gh.singleton<_i280.SidecarPreferences>(
        () => appProvider.sidecarPreferences(gh<_i365.PreferenceStore>()));
    gh.lazySingleton<_i414.ListComments>(() =>
        _i414.ListComments(threadRepository: gh<_i1044.ThreadRepository>()));
    gh.singleton<_i908.GrpcConnectionManagerImpl>(
        () => _i908.GrpcConnectionManagerImpl(
              gh<_i280.SidecarPreferences>(),
              gh<_i504.ApiService>(),
            ));
    gh.singleton<_i976.SidecarConnectionManager>(() => appProvider
        .sidecarConnectionManager(gh<_i908.GrpcConnectionManagerImpl>()));
    gh.lazySingleton<_i611.SidecarRepository>(() => _i757.SidecarRepositoryImpl(
          gh<_i976.SidecarConnectionManager>(),
          gh<_i280.SidecarPreferences>(),
        ));
    gh.lazySingleton<_i191.ExtensionPreferencesService>(() =>
        _i29.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.factory<_i56.Launcher>(
      () => _i56.SidecarAppLauncher(gh<_i976.SidecarConnectionManager>()),
      registerFor: {_sidecar},
    );
    gh.factory<_i56.Launcher>(
      () => _i56.RemoteAppLauncher(gh<_i976.SidecarConnectionManager>()),
      registerFor: {_remote},
    );
    gh.factory<_i525.CollectionThreadListCubit>(
        () => _i525.CollectionThreadListCubit(
              gh<_i585.GetCollection>(),
              gh<_i861.ListCollectionThreads>(),
            ));
    gh.lazySingleton<_i198.ExtensionRepository>(
        () => _i657.ExtensionRepositoryImpl(
              gh<_i504.ApiService>(),
              gh<_i976.SidecarConnectionManager>(),
            ));
    gh.lazySingleton<_i936.HomeCubit>(() => _i936.HomeCubit(
          gh<_i914.CollectionRepository>(),
          gh<_i611.SidecarRepository>(),
        ));
    gh.lazySingleton<_i989.RepoRepository>(() => _i128.RepoRepositoryImpl(
          gh<_i504.ApiService>(),
          gh<_i976.SidecarConnectionManager>(),
        ));
    gh.factory<_i515.SidecarLogsCubit>(() => _i515.SidecarLogsCubit(
          gh<_i611.SidecarRepository>(),
          gh<_i976.SidecarConnectionManager>(),
        ));
    gh.lazySingleton<_i351.ListInstalledExtensions>(
        () => _i351.ListInstalledExtensions(
              repository: gh<_i198.ExtensionRepository>(),
              boardRepository: gh<_i1052.BoardRepository>(),
            ));
    gh.lazySingleton<_i608.ListRepos>(
        () => _i608.ListRepos(gh<_i989.RepoRepository>()));
    gh.lazySingleton<_i154.RemoveRepo>(
        () => _i154.RemoveRepo(gh<_i989.RepoRepository>()));
    gh.lazySingleton<_i1048.AddRepo>(
        () => _i1048.AddRepo(gh<_i989.RepoRepository>()));
    gh.lazySingleton<_i783.InstallExtension>(() =>
        _i783.InstallExtension(repository: gh<_i198.ExtensionRepository>()));
    gh.lazySingleton<_i517.UninstallExtension>(() =>
        _i517.UninstallExtension(repository: gh<_i198.ExtensionRepository>()));
    gh.lazySingleton<_i266.GetInstalledExtension>(() =>
        _i266.GetInstalledExtension(
            repository: gh<_i198.ExtensionRepository>()));
    gh.lazySingleton<_i915.ListRemoteExtensions>(() =>
        _i915.ListRemoteExtensions(
            repository: gh<_i198.ExtensionRepository>()));
    gh.lazySingleton<_i1012.SearchThreads>(() => _i1012.SearchThreads(
          repository: gh<_i1044.ThreadRepository>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    gh.factory<_i274.BoardsPickerCubit>(
        () => _i274.BoardsPickerCubit(gh<_i351.ListInstalledExtensions>()));
    gh.lazySingleton<_i161.GetOriginalPost>(() => _i161.GetOriginalPost(
          threadRepository: gh<_i1044.ThreadRepository>(),
          boardRepository: gh<_i1052.BoardRepository>(),
          installedRepository: gh<_i266.GetInstalledExtension>(),
        ));
    gh.lazySingleton<_i587.ListReplies>(() => _i587.ListReplies(
          threadRepository: gh<_i1044.ThreadRepository>(),
          boardRepository: gh<_i1052.BoardRepository>(),
          installedRepository: gh<_i266.GetInstalledExtension>(),
        ));
    gh.factory<_i994.ThreadDetailCubit>(() => _i994.ThreadDetailCubit(
          getOriginalPost: gh<_i161.GetOriginalPost>(),
          listReplies: gh<_i587.ListReplies>(),
          listComments: gh<_i414.ListComments>(),
        ));
    gh.lazySingleton<_i214.ListExtensions>(() => _i214.ListExtensions(
          prefService: gh<_i191.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i915.ListRemoteExtensions>(),
        ));
    gh.factory<_i91.RepoCubit>(() => _i91.RepoCubit(
          listRepos: gh<_i608.ListRepos>(),
          addRepo: gh<_i1048.AddRepo>(),
          removeRepo: gh<_i154.RemoveRepo>(),
        ));
    gh.factory<_i470.SearchCubit>(() => _i470.SearchCubit(
          listSuggestions: gh<_i643.ListSuggestions>(),
          updateSuggestionLatestUsedAt:
              gh<_i650.UpdateSuggestionLatestUsedAt>(),
          insertSuggestion: gh<_i446.InsertSuggestion>(),
          listThreadList: gh<_i1012.SearchThreads>(),
        ));
    gh.factory<_i34.ExtensionCubit>(() => _i34.ExtensionCubit(
          listExtensions: gh<_i214.ListExtensions>(),
          installExtension: gh<_i783.InstallExtension>(),
          uninstallExtension: gh<_i517.UninstallExtension>(),
        ));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
