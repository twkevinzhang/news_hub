import 'package:news_hub/app/service/preferences/preference.dart';

abstract class ExtensionPreferencesService {
  Preference<Set<String>> enabledLanguages();
  Preference<bool> showNsfwBoard();
}
