import 'package:news_hub/domain/preferences/preference.dart';
import 'package:news_hub/domain/preferences/store.dart';

class ExtensionPreferences {
  ExtensionPreferences({
    required PreferenceStore store,
  })  : _store = store;

  final PreferenceStore _store;

  Preference<Set<String>> enabledLanguages() {
    return _store.getStringList('source_languages', defaultValue: {'en'}); // Replace with actual default languages
  }

  Preference<Set<String>> disabledSources() {
    return _store.getStringList('hidden_catalogues', defaultValue: {});
  }

  Preference<Set<String>> pinnedSources() {
    return _store.getStringList('pinned_catalogues', defaultValue: {});
  }

  Preference<int> lastUsedSource() {
    return _store.getInt(Preference.appStateKey('last_catalogue_source'), defaultValue: -1);
  }

  Preference<bool> showNsfwSource() {
    return _store.getBoolean('show_nsfw_source', defaultValue: true);
  }
}
