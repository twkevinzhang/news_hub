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
import 'package:news_hub/app/condition/repository_impl.dart' as _i393;
import 'package:news_hub/app/extension/api_service_impl.dart' as _i588;
import 'package:news_hub/app/extension/install_service_impl.dart' as _i324;
import 'package:news_hub/app/extension/mock_api_service_impl.dart' as _i223;
import 'package:news_hub/app/extension/mock_install_service_impl.dart' as _i642;
import 'package:news_hub/app/extension/preferences_service_impl.dart' as _i677;
import 'package:news_hub/app/extension_repo/api_service_impl.dart' as _i115;
import 'package:news_hub/app/extension_repo/mock_api_service_impl.dart'
    as _i594;
import 'package:news_hub/app/extension_repo/mock_repository_impl.dart' as _i145;
import 'package:news_hub/app/extension_repo/repository_impl.dart' as _i730;
import 'package:news_hub/app/service/database.dart' as _i1042;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/domain/extension/api_service.dart' as _i211;
import 'package:news_hub/domain/extension/extension.dart' as _i135;
import 'package:news_hub/domain/extension/install_service.dart' as _i953;
import 'package:news_hub/domain/extension/interactor/list_extensions.dart'
    as _i214;
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart'
    as _i351;
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart'
    as _i915;
import 'package:news_hub/domain/extension/interactor/list_threads.dart' as _i73;
import 'package:news_hub/domain/extension/preferences_service.dart' as _i739;
import 'package:news_hub/domain/extension_repo/api_service.dart' as _i692;
import 'package:news_hub/domain/extension_repo/extension_repo.dart' as _i381;
import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart'
    as _i460;
import 'package:news_hub/domain/extension_repo/interactor/get_extension_repo.dart'
    as _i581;
import 'package:news_hub/domain/extension_repo/interactor/get_remote_extension_repo.dart'
    as _i872;
import 'package:news_hub/domain/extension_repo/interactor/list_extension_repos.dart'
    as _i25;
import 'package:news_hub/domain/extension_repo/repository.dart' as _i1033;
import 'package:news_hub/domain/search_config/search_config.dart' as _i768;
import 'package:news_hub/domain/search_config/interactor/list_search_configs.dart'
    as _i433;
import 'package:news_hub/domain/search_config/repository.dart' as _i1027;
import 'package:news_hub/locator.dart' as _i56;
import 'package:news_hub/presentation/pages/add_extension_repo/bloc/add_extension_repo_cubit.dart'
    as _i229;
import 'package:news_hub/presentation/pages/extension_repos/bloc/extension_repos_cubit.dart'
    as _i235;
import 'package:news_hub/presentation/pages/extensions/bloc/extensions_cubit.dart' as _i830;
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart' as _i320;
import 'package:news_hub/presentation/pages/threads/bloc/threads_cubit.dart' as _i218;
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
    gh.lazySingleton<_i1042.DatabaseService>(() => _i1042.DatabaseService());
    gh.lazySingleton<_i762.AppRouter>(() => _i762.AppRouter());
    await gh.lazySingletonAsync<_i135.ExtensionInstallService>(
      () => _i324.ExtensionInstallServiceImpl.create(),
      registerFor: {_dev},
      preResolve: true,
    );
    gh.lazySingleton<_i135.ExtensionApiService>(
      () => _i223.MockExtensionApiServiceImpl(),
      registerFor: {_test},
    );
    await gh.lazySingletonAsync<_i135.ExtensionInstallService>(
      () => _i642.MockExtensionInstallServiceImpl.create(),
      registerFor: {_test},
      preResolve: true,
    );
    gh.lazySingleton<_i381.ExtensionRepoRepository>(
      () => _i145.MockExtensionRepoRepositoryImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i351.ListInstalledExtensions>(() =>
        _i351.ListInstalledExtensions(
            installService: gh<_i953.ExtensionInstallService>()));
    gh.lazySingleton<_i381.ExtensionRepoApiService>(
      () => _i594.MockExtensionRepoApiServiceImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i915.ListRemoteExtensions>(
        () => _i915.ListRemoteExtensions(
              extensionRepoRepository: gh<_i381.ExtensionRepoRepository>(),
              extensionApiService: gh<_i381.ExtensionRepoApiService>(),
            ));
    gh.lazySingleton<_i381.ExtensionRepoApiService>(
      () => _i115.ExtensionRepoApiServiceImpl(dio: gh<_i361.Dio>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i73.ListThreads>(() => _i73.ListThreads(
          apiService: gh<_i211.ExtensionApiService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
        ));
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
    gh.lazySingleton<_i768.SearchConfigRepository>(() =>
        _i393.SearchConfigRepositoryImpl(
            service: gh<_i1042.DatabaseService>()));
    gh.lazySingleton<_i135.ExtensionApiService>(
      () => _i588.ExtensionApiServiceImpl(dio: gh<_i361.Dio>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i381.ExtensionRepoRepository>(
      () => _i730.ExtensionRepoRepositoryImpl(
          service: gh<_i1042.DatabaseService>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i872.GetRemoteExtensionRepo>(() =>
        _i872.GetRemoteExtensionRepo(
            service: gh<_i692.ExtensionRepoApiService>()));
    gh.lazySingleton<_i25.ListExtensionRepo>(() => _i25.ListExtensionRepo(
        repository: gh<_i1033.ExtensionRepoRepository>()));
    gh.lazySingleton<_i460.CreateExtensionRepo>(() => _i460.CreateExtensionRepo(
          repository: gh<_i1033.ExtensionRepoRepository>(),
          service: gh<_i692.ExtensionRepoApiService>(),
        ));
    gh.lazySingleton<_i581.GetExtensionRepo>(() =>
        _i581.GetExtensionRepo(repo: gh<_i381.ExtensionRepoRepository>()));
    gh.lazySingleton<_i218.ThreadsCubit>(
        () => _i218.ThreadsCubit(listThreads: gh<_i135.ListThreads>()));
    gh.lazySingleton<_i433.ListSearchConfigs>(() =>
        _i433.ListSearchConfigs(repo: gh<_i1027.SearchConfigRepository>()));
    gh.lazySingleton<_i229.AddExtensionRepoCubit>(
        () => _i229.AddExtensionRepoCubit(
              getExtensionRepo: gh<_i581.GetExtensionRepo>(),
              getRemoteExtensionRepo: gh<_i872.GetRemoteExtensionRepo>(),
              createExtensionRepo: gh<_i460.CreateExtensionRepo>(),
            ));
    gh.lazySingleton<_i135.ExtensionPreferencesService>(() =>
        _i677.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.lazySingleton<_i235.ExtensionReposCubit>(() => _i235.ExtensionReposCubit(
          createExtensionRepo: gh<_i460.CreateExtensionRepo>(),
          listExtensionRepo: gh<_i25.ListExtensionRepo>(),
        ));
    gh.lazySingleton<_i320.SearchCubit>(() => _i320.SearchCubit(
          listSearchConfigs: gh<_i768.ListSearchConfigs>(),
          listExtensions: gh<_i135.ListInstalledExtensions>(),
        ));
    gh.lazySingleton<_i214.ListExtensions>(() => _i214.ListExtensions(
          prefService: gh<_i739.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i351.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i915.ListRemoteExtensions>(),
        ));
    gh.lazySingleton<_i830.ExtensionsCubit>(() => _i830.ExtensionsCubit(
          listExtensions: gh<_i135.ListExtensions>(),
          extensionInstallService: gh<_i135.ExtensionInstallService>(),
          extensionRepoApiService: gh<_i692.ExtensionRepoApiService>(),
        ));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
