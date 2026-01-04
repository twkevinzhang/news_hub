import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/app/service/preferences/store.dart';

/// Sidecar 相關的使用者偏好設定
///
/// 管理所有與 Sidecar 監控功能相關的設定，包括：
/// - 日誌等級過濾
/// - 最大日誌條數
/// - 自動滾動開關
///
/// 所有設定都持久化儲存在本地，使用 [PreferenceStore] 作為底層儲存。
class SidecarPreferences {
  final PreferenceStore _store;

  /// 日誌等級設定
  ///
  /// 可選值：'DEBUG', 'INFO', 'WARN', 'ERROR', 'CRITICAL'
  /// 預設值：'INFO'
  late final Preference<String> logLevel;

  /// 最大日誌條數設定
  ///
  /// 限制在記憶體中保留的日誌條數，避免記憶體溢出。
  /// 範圍：100 ~ 5000
  /// 預設值：1000
  late final Preference<int> maxLogEntries;

  /// 自動滾動開關
  ///
  /// 控制日誌頁面是否自動滾動到最新日誌。
  /// 預設值：true
  late final Preference<bool> autoScroll;

  /// Sidecar 伺服器主機位址
  ///
  /// gRPC 伺服器的 IP 位址或主機名稱。
  /// 預設值：'127.0.0.1' (本地)
  late final Preference<String> host;

  /// Sidecar 伺服器埠號
  ///
  /// gRPC 伺服器的埠號。
  /// 預設值：55001
  late final Preference<int> port;

  SidecarPreferences(this._store) {
    logLevel = _store.getString(
      'sidecar.log_level',
      defaultValue: 'INFO',
    );

    maxLogEntries = _store.getInt(
      'sidecar.max_log_entries',
      defaultValue: 1000,
    );

    autoScroll = _store.getBoolean(
      'sidecar.auto_scroll',
      defaultValue: true,
    );

    host = _store.getString(
      'sidecar.host',
      defaultValue: '127.0.0.1',
    );

    port = _store.getInt(
      'sidecar.port',
      defaultValue: 55001,
    );
  }
}
