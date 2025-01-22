part of 'index.dart';

abstract class ExtensionPreferencesService {
  Preference<Set<String>> enabledLanguages();
  Preference<bool> showNsfwBoard();
}
