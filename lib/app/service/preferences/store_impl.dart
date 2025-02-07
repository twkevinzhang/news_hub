import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/preferences/preference_impl.dart';
import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/app/service/preferences/store.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

@LazySingleton(as: PreferenceStore)
class PreferenceStoreImpl implements PreferenceStore {
  final SharedPreferences _prefs;

  PreferenceStoreImpl({
    required SharedPreferences prefs,
  })  : _prefs = prefs;

  @override
  Preference<bool> getBoolean(String key, {bool defaultValue = false}) {
    return BooleanPrimitive(prefs: _prefs, key: key, defaultValue: defaultValue);
  }

  @override
  Preference<double> getDouble(String key, {double defaultValue = 0.0}) {
    return DoublePrimitive(prefs: _prefs, key: key, defaultValue: defaultValue);
  }

  @override
  Preference<int> getInt(String key, {int defaultValue = 0}) {
    return IntPrimitive(prefs: _prefs, key: key, defaultValue: defaultValue);
  }

  @override
  Preference<T> getObject<T>(String key, T defaultValue, String Function(T p1) serializer, T Function(String p1) deserializer) {
    return ObjectPrimitive(prefs: _prefs, key: key, defaultValue: defaultValue, serializer: serializer, deserializer: deserializer);
  }

  @override
  Preference<String> getString(String key, {String defaultValue = ''}) {
    return StringPrimitive(prefs: _prefs, key: key, defaultValue: defaultValue);
  }

  @override
  Preference<Set<String>> getStringList(String key, {Set<String> defaultValue = const {}}) {
    return StringListPrimitive(prefs: _prefs, key: key, defaultValue: defaultValue);
  }

}
