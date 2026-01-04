import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/app/service/preferences/store.dart';

class SidecarPreferences {
  final PreferenceStore _store;

  late final Preference<String> logLevel;
  late final Preference<int> maxLogEntries;
  late final Preference<bool> autoScroll;
  late final Preference<String> host;
  late final Preference<int> port;

  SidecarPreferences(this._store) {
    logLevel = _store.getString('sidecar.log_level', defaultValue: 'INFO');
    maxLogEntries = _store.getInt('sidecar.max_log_entries', defaultValue: 1000);
    autoScroll = _store.getBoolean('sidecar.auto_scroll', defaultValue: true);
    host = _store.getString('sidecar.host', defaultValue: '127.0.0.1');
    port = _store.getInt('sidecar.port', defaultValue: 55001);
  }
}
