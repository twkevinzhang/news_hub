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
import 'package:news_hub/app/extension/api/extension_api_service_impl.dart'
    as _i516;
import 'package:news_hub/app/extension/api/mock_extension_api_service_impl.dart'
    as _i511;
import 'package:news_hub/app/extension/installer/extension_install_service_impl.dart'
    as _i1036;
import 'package:news_hub/app/extension/installer/mock_extension_install_service_impl.dart'
    as _i863;
import 'package:news_hub/app/extension/preferences/extension_preferences_service_impl.dart'
    as _i29;
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
import 'package:news_hub/app/service/database/database.dart' as _i539;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/domain/bookmark/bookmark_repository.dart' as _i521;
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart'
    as _i1049;
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
import 'package:news_hub/domain/extension/interactor/list_thread_infos.dart'
    as _i719;
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
import 'package:news_hub/locator.dart' as _i56;
import 'package:news_hub/presentation/pages/add_extension_repo/bloc/add_extension_repo_cubit.dart'
    as _i229;
import 'package:news_hub/presentation/pages/extension_repos/bloc/extension_repos_cubit.dart'
    as _i235;
import 'package:news_hub/presentation/pages/extensions/bloc/extensions_cubit.dart'
    as _i945;
import 'package:news_hub/presentation/pages/search/bloc/boards_picker_cubit.dart'
    as _i1070;
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart'
    as _i21;
import 'package:news_hub/presentation/pages/thread_infos/bloc/thread_infos_cubit.dart'
    as _i181;
import 'package:news_hub/presentation/router/router.dart' as _i762;
import 'package:rx_shared_preferences/rx_shared_preferences.dart' as _i579;

const String _dev = 'dev';
const String _test = 'test';

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
    gh.lazySingleton<_i539.AppDatabase>(() => _i539.AppDatabase());
    gh.lazySingleton<_i475.ValidExtensionRepoUrl>(
        () => _i475.ValidExtensionRepoUrl());
    gh.lazySingleton<_i762.AppRouter>(() => _i762.AppRouter());
    await gh.lazySingletonAsync<_i315.ExtensionInstallService>(
      () => _i1036.ExtensionInstallServiceImpl.create(),
      registerFor: {_dev},
      preResolve: true,
    );
    gh.lazySingleton<_i623.ExtensionRepoRepository>(
      () => _i374.ExtensionRepoRepositoryImpl(db: gh<_i539.AppDatabase>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i623.ExtensionRepoRepository>(
      () => _i178.MockExtensionRepoRepositoryImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i981.InstalledExtensionRepository>(
      () => _i1056.MockInstalledExtensionRepositoryImpl(),
      registerFor: {_test},
    );
    await gh.lazySingletonAsync<_i315.ExtensionInstallService>(
      () => _i863.MockExtensionInstallServiceImpl.create(),
      registerFor: {_test},
      preResolve: true,
    );
    gh.lazySingleton<_i315.ExtensionApiService>(
      () => _i511.MockExtensionApiServiceImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i581.GetExtensionRepo>(() =>
        _i581.GetExtensionRepo(repo: gh<_i623.ExtensionRepoRepository>()));
    gh.lazySingleton<_i981.InstalledExtensionRepository>(
      () => _i753.InstalledExtensionRepositoryImpl(db: gh<_i539.AppDatabase>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i623.ExtensionRepoApiService>(
      () => _i681.MockExtensionRepoApiServiceImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i517.UninstallExtension>(() => _i517.UninstallExtension(
        installService: gh<_i103.ExtensionInstallService>()));
    gh.lazySingleton<_i521.BookmarkRepository>(
        () => _i495.BookmarkRepositoryImpl());
    gh.lazySingleton<_i1049.ListBookmarks>(
        () => _i1049.ListBookmarks(repo: gh<_i521.BookmarkRepository>()));
    gh.lazySingleton<_i25.ListExtensionRepo>(() => _i25.ListExtensionRepo(
        repository: gh<_i525.ExtensionRepoRepository>()));
    gh.lazySingleton<_i1062.DeleteExtensionRepo>(() =>
        _i1062.DeleteExtensionRepo(
            repository: gh<_i525.ExtensionRepoRepository>()));
    gh.lazySingleton<_i315.ExtensionApiService>(
      () => _i516.ExtensionApiServiceImpl(dio: gh<_i361.Dio>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i623.ExtensionRepoApiService>(
      () => _i999.ExtensionRepoApiServiceImpl(dio: gh<_i361.Dio>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
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
    gh.lazySingleton<_i872.GetRemoteExtensionRepo>(() =>
        _i872.GetRemoteExtensionRepo(
            service: gh<_i1021.ExtensionRepoApiService>()));
    gh.lazySingleton<_i460.CreateExtensionRepo>(() => _i460.CreateExtensionRepo(
          repository: gh<_i525.ExtensionRepoRepository>(),
          service: gh<_i1021.ExtensionRepoApiService>(),
        ));
    gh.factory<_i21.SearchCubit>(() => _i21.SearchCubit(
          listBookmarks: gh<_i1049.ListBookmarks>(),
          listExtensions: gh<_i315.ListInstalledExtensions>(),
        ));
    gh.factory<_i235.ExtensionReposCubit>(() => _i235.ExtensionReposCubit(
          listExtensionRepo: gh<_i25.ListExtensionRepo>(),
          deleteExtensionRepo: gh<_i1062.DeleteExtensionRepo>(),
        ));
    gh.lazySingleton<_i915.ListRemoteExtensions>(
        () => _i915.ListRemoteExtensions(
              extensionRepoRepository: gh<_i623.ExtensionRepoRepository>(),
              extensionApiService: gh<_i623.ExtensionRepoApiService>(),
            ));
    gh.lazySingleton<_i719.ListThreadInfos>(() => _i719.ListThreadInfos(
          apiService: gh<_i892.ExtensionApiService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    gh.factory<_i181.ThreadInfosCubit>(() =>
        _i181.ThreadInfosCubit(listThreadInfos: gh<_i315.ListThreadInfos>()));
    gh.factory<_i229.AddExtensionRepoCubit>(() => _i229.AddExtensionRepoCubit(
          validExtensionRepoUrl: gh<_i475.ValidExtensionRepoUrl>(),
          getExtensionRepo: gh<_i581.GetExtensionRepo>(),
          getRemoteExtensionRepo: gh<_i872.GetRemoteExtensionRepo>(),
          createExtensionRepo: gh<_i460.CreateExtensionRepo>(),
        ));
    gh.factory<_i1070.BoardsPickerCubit>(
        () => _i1070.BoardsPickerCubit(gh<_i351.ListInstalledExtensions>()));
    gh.lazySingleton<_i315.ExtensionPreferencesService>(() =>
        _i29.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.lazySingleton<_i214.ListExtensions>(() => _i214.ListExtensions(
          prefService: gh<_i515.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i915.ListRemoteExtensions>(),
        ));
    gh.factory<_i945.ExtensionsCubit>(() => _i945.ExtensionsCubit(
          listExtensions: gh<_i315.ListExtensions>(),
          installExtension: gh<_i783.InstallExtension>(),
          uninstallExtension: gh<_i315.UninstallExtension>(),
          extensionRepoApiService: gh<_i623.ExtensionRepoApiService>(),
        ));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
