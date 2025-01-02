import 'package:news_hub/app/service/preferences/preference.dart';

abstract class PreferenceStore {
  Preference<String> getString(String key, {String defaultValue = ''});

  Preference<int> getInt(String key, {int defaultValue = 0});

  Preference<double> getDouble(String key, {double defaultValue = 0.0});

  Preference<bool> getBoolean(String key, {bool defaultValue = false});

  Preference<Set<String>> getStringList(String key, {Set<String> defaultValue = const {}});

  Preference<T> getObject<T>(
      String key,
      T defaultValue,
      String Function(T) serializer,
      T Function(String) deserializer,
      );
}
