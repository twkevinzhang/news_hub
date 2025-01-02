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
import 'package:news_hub/app/extension/index.dart' as _i509;
import 'package:news_hub/app/extension_repo/index.dart' as _i1027;
import 'package:news_hub/app/service/database.dart' as _i1042;
import 'package:news_hub/app/service/preferences/store.dart' as _i365;
import 'package:news_hub/app/service/preferences/store_impl.dart' as _i842;
import 'package:news_hub/domain/extension/index.dart' as _i135;
import 'package:news_hub/domain/extension_repo/index.dart' as _i381;
import 'package:news_hub/locator.dart' as _i56;
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
    await gh.lazySingletonAsync<_i135.ExtensionInstallService>(
      () => _i509.MockExtensionInstallServiceImpl.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i135.ExtensionApiService>(
        () => _i509.MockExtensionApiServiceImpl());
    gh.lazySingleton<_i381.ExtensionRepoApiService>(
        () => _i1027.MockExtensionRepoApiServiceImpl());
    gh.lazySingleton<_i381.ExtensionRepoRepository>(() =>
        _i1027.ExtensionRepoRepositoryImpl(
            service: gh<_i1042.DatabaseService>()));
    gh.lazySingleton<_i365.PreferenceStore>(
        () => _i842.PreferenceStoreImpl(prefs: gh<_i579.SharedPreferences>()));
    gh.lazySingleton<_i135.ListInstalledExtensions>(() =>
        _i135.ListInstalledExtensions(
            installService: gh<_i135.ExtensionInstallService>()));
    gh.lazySingleton<_i135.ListThreads>(() => _i135.ListThreads(
          apiService: gh<_i135.ExtensionApiService>(),
          listInstalledExtensions: gh<_i135.ListInstalledExtensions>(),
        ));
    gh.lazySingleton<_i135.ListRemoteExtensions>(
        () => _i135.ListRemoteExtensions(
              extensionRepoRepository: gh<_i381.ExtensionRepoRepository>(),
              extensionApiService: gh<_i381.ExtensionRepoApiService>(),
            ));
    gh.lazySingleton<_i135.ExtensionPreferencesService>(() =>
        _i509.ExtensionPreferencesServiceImpl(
            store: gh<_i365.PreferenceStore>()));
    gh.lazySingleton<_i135.ListExtensions>(() => _i135.ListExtensions(
          prefService: gh<_i135.ExtensionPreferencesService>(),
          listInstalledExtensions: gh<_i135.ListInstalledExtensions>(),
          listRemoteExtensions: gh<_i135.ListRemoteExtensions>(),
        ));
    return this;
  }
}

class _$AppProvider extends _i56.AppProvider {}
