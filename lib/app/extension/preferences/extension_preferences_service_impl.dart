import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/app/service/preferences/store.dart';
import 'package:news_hub/domain/extension/extension_preferences_service.dart';

@LazySingleton(as: ExtensionPreferencesService)
class ExtensionPreferencesServiceImpl implements ExtensionPreferencesService {
  ExtensionPreferencesServiceImpl({
    required PreferenceStore store,
  }) : _store = store;

  final PreferenceStore _store;

  @override
  Preference<Set<String>> enabledLanguages() {
    return _store.getStringList('extension_languages',
        defaultValue: {'en'}); // Replace with actual default languages
  }

  @override
  Preference<bool> showNsfwBoard() {
    return _store.getBoolean('show_nsfw_board', defaultValue: true);
  }
}
