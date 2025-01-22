part of 'index.dart';

@LazySingleton(as: ExtensionPreferencesService)
class ExtensionPreferencesServiceImpl extends ExtensionPreferencesService {
  ExtensionPreferencesServiceImpl({
    required PreferenceStore store,
  })  : _store = store;

  final PreferenceStore _store;

  @override
  Preference<Set<String>> enabledLanguages() {
    return _store.getStringList('extension_languages', defaultValue: {'en'}); // Replace with actual default languages
  }

  @override
  Preference<bool> showNsfwBoard() {
    return _store.getBoolean('show_nsfw_board', defaultValue: true);
  }
}
