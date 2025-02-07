import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/app/service/logger.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

abstract class PreferenceImpl<T> implements Preference<T> {
  final SharedPreferences _prefs;
  final RxSharedPreferences _rxPrefs;
  final String _key;
  final T _defaultValue;

  PreferenceImpl({
    required prefs,
    required key,
    required defaultValue,
  }) : _prefs = prefs,
        _rxPrefs = RxSharedPreferences(prefs),
        _key = key,
        _defaultValue = defaultValue;

  @override
  Stream<T> changes();

  @override
  Future<T> defaultValue() {
    return Future.value(_defaultValue);
  }

  @override
  Future<void> delete() {
    return _prefs.remove(_key);
  }

  @override
  Future<T> get();

  @override
  bool isSet() {
    return _prefs.containsKey(_key);
  }

  @override
  String key() {
    return _key;
  }

  @override
  Future<void> set(T value);

}

class StringPrimitive extends PreferenceImpl<String> {
  StringPrimitive({
    required super.prefs,
    required super.key,
    required super.defaultValue,
  });

  @override
  Stream<String> changes() {
    return _rxPrefs.getStringStream(_key).map((v) =>v ?? _defaultValue);
  }

  @override
  Future<String> get() {
    return Future.value(_prefs.getString(_key) ?? _defaultValue);
  }

  @override
  Future<void> set(String value) {
    return _prefs.setString(_key, value);
  }
}

class IntPrimitive extends PreferenceImpl<int> {
  IntPrimitive({
    required super.prefs,
    required super.key,
    required super.defaultValue,
  });

  @override
  Stream<int> changes() {
    return _rxPrefs.getIntStream(_key).map((v) => v ?? _defaultValue);
  }

  @override
  Future<int> get() {
    return Future.value(_prefs.getInt(_key) ?? _defaultValue);
  }

  @override
  Future<void> set(int value) {
    return _prefs.setInt(_key, value);
  }
}

class DoublePrimitive extends PreferenceImpl<double> {
  DoublePrimitive({
    required super.prefs,
    required super.key,
    required super.defaultValue,
  });

  @override
  Stream<double> changes() {
    return _rxPrefs.getDoubleStream(_key).map((v) => v ?? _defaultValue);
  }

  @override
  Future<double> get() {
    return Future.value(_prefs.getDouble(_key) ?? _defaultValue);
  }

  @override
  Future<void> set(double value) {
    return _prefs.setDouble(_key, value);
  }
}

class BooleanPrimitive extends PreferenceImpl<bool> {
  BooleanPrimitive({
    required super.prefs,
    required super.key,
    required super.defaultValue,
  });

  @override
  Stream<bool> changes() {
    return _rxPrefs.getBoolStream(_key).map((v) => v ?? _defaultValue);
  }

  @override
  Future<bool> get() {
    return Future.value(_prefs.getBool(_key) ?? _defaultValue);
  }

  @override
  Future<void> set(bool value) {
    return _prefs.setBool(_key, value);
  }
}

class StringListPrimitive extends PreferenceImpl<Set<String>> {
  StringListPrimitive({
    required super.prefs,
    required super.key,
    required super.defaultValue,
  });

  @override
  Stream<Set<String>> changes() {
    return _rxPrefs.getStringListStream(_key).map((v) => v?.toSet() ?? _defaultValue);
  }

  @override
  Future<Set<String>> get() {
    return Future.value(_prefs.getStringList(_key)?.toSet() ?? _defaultValue);
  }

  @override
  Future<void> set(Set<String> value) {
    return _prefs.setStringList(_key, value.toList());
  }
}

class ObjectPrimitive<T> extends PreferenceImpl<T> {
  final String Function(T) _serializer;
  final T Function(String) _deserializer;
  ObjectPrimitive({
    required super.prefs,
    required super.key,
    required super.defaultValue,
    required serializer,
    required deserializer,
  }) : _serializer = serializer,
        _deserializer = deserializer;

  @override
  Stream<T> changes() {
    return _rxPrefs.getStringStream(_key)
        .map((v) => v == null
          ? throw ArgumentError("value should not be null")
          : _deserializer(v))
        .handleError((error) {
          log.e(error);
          return _defaultValue;
        });
  }

  @override
  Future<T> get() {
    final value = _prefs.getString(_key);
    return Future.value(value == null ? _defaultValue : _deserializer(value));
  }

  @override
  Future<void> set(T value) {
    final serialized = _serializer(value);
    return _prefs.setString(_key, serialized);
  }
}
