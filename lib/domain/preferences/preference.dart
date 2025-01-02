abstract class Preference<T> {
  String key();

  Future<T> get();

  Future<void> set(T value);

  bool isSet();

  Future<void> delete();

  Future<T> defaultValue();

  Stream<T> changes();

  static bool isPrivate(String key) {
    return key.startsWith(Preference._privatePrefix);
  }

  static String privateKey(String key) {
    return '${Preference._privatePrefix}$key';
  }

  static bool isAppState(String key) {
    return key.startsWith(Preference._appStatePrefix);
  }

  static String appStateKey(String key) {
    return '${Preference._appStatePrefix}$key';
  }

  static const String _appStatePrefix = '__APP_STATE_';
  static const String _privatePrefix = '__PRIVATE_';
}
