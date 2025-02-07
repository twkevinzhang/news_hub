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
import 'package:news_hub/app/condition/condition_repository_impl.dart' as _i436;
import 'package:news_hub/app/extension/extension_api_service_impl.dart'
    as _i51;
import 'package:news_hub/app/extension/extension_install_service_impl.dart'
    as _i278;
import 'package:news_hub/app/extension/extension_preferences_service_impl.dart'
    as _i986;
import 'package:news_hub/app/extension/mock_extension_api_service_impl.dart'
    as _i458;
import 'package:news_hub/app/extension/mock_extension_install_service_impl.dart'
    as _i969;
import 'package:news_hub/app/extension_repo/extension_repo_api_service_impl.dart'
    as _i427;
import 'package:news_hub/app/extension_repo/extension_repo_repository_impl.dart'
    as _i21;
import 'package:news_hub/app/extension_repo/mock_extension_repo_api_service_impl.dart'
    as _i405;
import 'package:news_hub/app/extension_repo/mock_extension_repo_repository_impl.dart'
    as _i450;
import 'package:news_hub/app/service/database.dart' as _i1042;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/domain/extension/extension.dart' as _i315;
import 'package:news_hub/domain/extension/extension_api_service.dart' as _i892;
import 'package:news_hub/domain/extension/extension_install_service.dart'
    as _i103;
import 'package:news_hub/domain/extension/extension_preferences_service.dart'
    as _i515;
import 'package:news_hub/domain/extension/interactor/list_extensions.dart'
    as _i214;
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart'
    as _i351;
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart'
    as _i915;
import 'package:news_hub/domain/extension/interactor/list_thread_infos.dart'
    as _i719;
import 'package:news_hub/domain/extension_repo/extension_repo.dart' as _i623;
import 'package:news_hub/domain/extension_repo/extension_repo_api_service.dart'
    as _i1021;
import 'package:news_hub/domain/extension_repo/extension_repo_repository.dart'
    as _i525;
import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart'
    as _i460;
import 'package:news_hub/domain/extension_repo/interactor/get_extension_repo.dart'
    as _i581;
import 'package:news_hub/domain/extension_repo/interactor/get_remote_extension_repo.dart'
    as _i872;
import 'package:news_hub/domain/extension_repo/interactor/list_extension_repos.dart'
    as _i25;
import 'package:news_hub/domain/search_config/interactor/list_search_configs.dart'
    as _i433;
import 'package:news_hub/domain/search_config/search_config.dart' as _i1064;
import 'package:news_hub/domain/search_config/search_config_repository.dart'
    as _i271;
import 'package:news_hub/locator.dart' as _i56;
import 'package:news_hub/presentation/pages/add_extension_repo/bloc/add_extension_repo_cubit.dart'
    as _i229;
import 'package:news_hub/presentation/pages/extension_repos/bloc/extension_repos_cubit.dart'
    as _i235;
import 'package:news_hub/presentation/pages/extensions/bloc/extensions_cubit.dart'
    as _i945;
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart'
    as _i21;
import 'package:news_hub/presentation/pages/thread_infos/bloc/thread_infos_cubit.dart'
    as _i181;
import 'package:news_hub/presentation/router/router.dart' as _i762;
import 'package:rx_shared_preferences/rx_shared_preferences.dart' as _i579;

const String _test = 'test';
const String _dev = 'dev';

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
    gh.lazySingleton<_i1042.DatabaseService>(() => _i1042.DatabaseService());
    gh.lazySingleton<_i762.AppRouter>(() => _i762.AppRouter());
    gh.lazySingleton<_i623.ExtensionRepoRepository>(
      () => _i450.MockExtensionRepoRepositoryImpl(),
      registerFor: {_test},
    );
    await gh.lazySingletonAsync<_i315.ExtensionInstallService>(
      () => _i969.MockExtensionInstallServiceImpl.create(),
      registerFor: {_test},
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i315.ExtensionInstallService>(
      () => _i278.ExtensionInstallServiceImpl.create(),
      registerFor: {_dev},
      preResolve: true,
    );
    gh.lazySingleton<_i623.ExtensionRepoApiService>(
      () => _i405.MockExtensionRepoApiServiceImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i315.ExtensionApiService>(
      () => _i458.MockExtensionApiServiceImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i581.GetExtensionRepo>(() =>
        _i581.GetExtensionRepo(repo: gh<_i623.ExtensionRepoRepository>()));
    gh.lazySingleton<_i351.ListInstalledExtensions>(() =>
        _i351.ListInstalledExtensions(
            installService: gh<_i103.ExtensionInstallService>()));
    gh.lazySingleton<_i1064.SearchConfigRepository>(() =>
        _i436.SearchConfigRepositoryImpl(
            service: gh<_i1042.DatabaseService>()));
    gh.lazySingleton<_i719.ListThreadInfos>(() => _i719.ListThreadInfos(
          apiService: gh<_i892.ExtensionApiService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    gh.lazySingleton<_i25.ListExtensionRepo>(() => _i25.ListExtensionRepo(
        repository: gh<_i525.ExtensionRepoRepository>()));
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
    gh.lazySingleton<_i433.ListSearchConfigs>(() =>
        _i433.ListSearchConfigs(repo: gh<_i271.SearchConfigRepository>()));
    gh.lazySingleton<_i872.GetRemoteExtensionRepo>(() =>
        _i872.GetRemoteExtensionRepo(
            service: gh<_i1021.ExtensionRepoApiService>()));
    gh.lazySingleton<_i460.CreateExtensionRepo>(() => _i460.CreateExtensionRepo(
          repository: gh<_i525.ExtensionRepoRepository>(),
          service: gh<_i1021.ExtensionRepoApiService>(),
        ));
    gh.lazySingleton<_i623.ExtensionRepoRepository>(
      () => _i21.ExtensionRepoRepositoryImpl(
          service: gh<_i1042.DatabaseService>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i315.ExtensionApiService>(
      () => _i51.ExtensionApiServiceImpl(dio: gh<_i361.Dio>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i623.ExtensionRepoApiService>(
      () => _i427.ExtensionRepoApiServiceImpl(dio: gh<_i361.Dio>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i315.ExtensionPreferencesService>(() =>
        _i986.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.lazySingleton<_i235.ExtensionReposCubit>(() => _i235.ExtensionReposCubit(
          createExtensionRepo: gh<_i460.CreateExtensionRepo>(),
          listExtensionRepo: gh<_i25.ListExtensionRepo>(),
        ));
    gh.lazySingleton<_i915.ListRemoteExtensions>(
        () => _i915.ListRemoteExtensions(
              extensionRepoRepository: gh<_i623.ExtensionRepoRepository>(),
              extensionApiService: gh<_i623.ExtensionRepoApiService>(),
            ));
    gh.lazySingleton<_i181.ThreadInfosCubit>(() =>
        _i181.ThreadInfosCubit(listThreadInfos: gh<_i315.ListThreadInfos>()));
    gh.lazySingleton<_i214.ListExtensions>(() => _i214.ListExtensions(
          prefService: gh<_i515.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i915.ListRemoteExtensions>(),
        ));
    gh.lazySingleton<_i21.SearchCubit>(() => _i21.SearchCubit(
          listSearchConfigs: gh<_i1064.ListSearchConfigs>(),
          listExtensions: gh<_i315.ListInstalledExtensions>(),
        ));
    gh.lazySingleton<_i229.AddExtensionRepoCubit>(
        () => _i229.AddExtensionRepoCubit(
              getExtensionRepo: gh<_i581.GetExtensionRepo>(),
              getRemoteExtensionRepo: gh<_i872.GetRemoteExtensionRepo>(),
              createExtensionRepo: gh<_i460.CreateExtensionRepo>(),
            ));
    gh.lazySingleton<_i945.ExtensionsCubit>(() => _i945.ExtensionsCubit(
          listExtensions: gh<_i315.ListExtensions>(),
          extensionInstallService: gh<_i315.ExtensionInstallService>(),
          extensionRepoApiService: gh<_i1021.ExtensionRepoApiService>(),
        ));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
