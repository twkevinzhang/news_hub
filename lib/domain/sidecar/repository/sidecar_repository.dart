import 'package:news_hub/domain/models/models.dart';

/// Sidecar 監控功能的資料存取接口
///
/// 定義 Sidecar 服務的所有資料存取操作，遵循 DDD 的 Repository Pattern。
/// 實作類別位於 Data 層，確保 Domain 層不依賴具體實作。
abstract class SidecarRepository {
  /// 持續監聽 Sidecar 健康狀態
  ///
  /// 返回一個 Stream，持續推送 Sidecar 的健康狀態變更。
  /// 用於即時監控 Sidecar 服務是否正常運作。
  ///
  /// Returns:
  ///   Stream<HealthCheckResult> - 健康狀態串流
  Stream<HealthCheckResult> watchHealth();

  /// 獲取 Sidecar 當前健康狀態
  ///
  /// 執行一次性的健康檢查，返回當前狀態。
  ///
  /// Returns:
  ///   Future<HealthCheckResult> - 當前健康狀態
  Future<HealthCheckResult> getHealthStatus();

  /// 持續監聽 Sidecar 日誌串流
  ///
  /// 返回一個 Stream，持續推送 Sidecar 產生的日誌條目。
  /// 可透過 [minLevel] 參數過濾日誌等級。
  ///
  /// Parameters:
  ///   - minLevel: 最低日誌等級，只返回此等級及以上的日誌
  ///
  /// Returns:
  ///   Stream<LogEntry> - 日誌串流
  Stream<LogEntry> watchLogs({required LogLevel minLevel});
}
