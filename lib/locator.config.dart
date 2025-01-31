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
import 'package:news_hub/app/condition/index.dart' as _i280;
import 'package:news_hub/app/extension/index.dart' as _i509;
import 'package:news_hub/app/extension_repo/index.dart' as _i1027;
import 'package:news_hub/app/service/database.dart' as _i1042;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/domain/extension/index.dart' as _i135;
import 'package:news_hub/domain/extension_repo/index.dart' as _i381;
import 'package:news_hub/domain/search_config/index.dart' as _i768;
import 'package:news_hub/locator.dart' as _i56;
import 'package:news_hub/presentation/pages/extensions/index.dart' as _i983;
import 'package:news_hub/presentation/pages/search/index.dart' as _i928;
import 'package:news_hub/presentation/pages/threads/index.dart' as _i62;
import 'package:news_hub/presentation/router.dart' as _i217;
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
    gh.lazySingleton<_i1042.DatabaseService>(() => _i1042.DatabaseService());
    gh.lazySingleton<_i217.AppRouter>(() => _i217.AppRouter());
    await gh.lazySingletonAsync<_i135.ExtensionInstallService>(
      () => _i509.MockExtensionInstallServiceImpl.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i381.ExtensionRepoRepository>(
        () => _i1027.MockExtensionRepoRepositoryImpl());
    gh.lazySingleton<_i135.ExtensionApiService>(
        () => _i509.MockExtensionApiServiceImpl());
    gh.lazySingleton<_i381.ExtensionRepoApiService>(
        () => _i1027.MockExtensionRepoApiServiceImpl());
    gh.lazySingleton<_i135.ListRemoteExtensions>(
        () => _i135.ListRemoteExtensions(
              extensionRepoRepository: gh<_i381.ExtensionRepoRepository>(),
              extensionApiService: gh<_i381.ExtensionRepoApiService>(),
            ));
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
    gh.lazySingleton<_i135.ListInstalledExtensions>(() =>
        _i135.ListInstalledExtensions(
            installService: gh<_i135.ExtensionInstallService>()));
    gh.lazySingleton<_i768.SearchConfigRepository>(() =>
        _i280.SearchConfigRepositoryImpl(
            service: gh<_i1042.DatabaseService>()));
    gh.lazySingleton<_i768.ListSearchConfigs>(() =>
        _i768.ListSearchConfigs(repo: gh<_i768.SearchConfigRepository>()));
    gh.lazySingleton<_i135.ListThreads>(() => _i135.ListThreads(
          apiService: gh<_i135.ExtensionApiService>(),
          listInstalledExtensions: gh<_i135.ListInstalledExtensions>(),
        ));
    gh.lazySingleton<_i135.ExtensionPreferencesService>(() =>
        _i509.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.lazySingleton<_i135.ListExtensions>(() => _i135.ListExtensions(
          prefService: gh<_i135.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i135.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i135.ListRemoteExtensions>(),
        ));
    gh.lazySingleton<_i62.ThreadsCubit>(
        () => _i62.ThreadsCubit(listThreads: gh<_i135.ListThreads>()));
    gh.lazySingleton<_i928.SearchCubit>(() => _i928.SearchCubit(
          listSearchConfigs: gh<_i768.ListSearchConfigs>(),
          listExtensions: gh<_i135.ListInstalledExtensions>(),
        ));
    gh.lazySingleton<_i983.ExtensionsCubit>(() =>
        _i983.ExtensionsCubit(listExtensions: gh<_i135.ListExtensions>()));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
