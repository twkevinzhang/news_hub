import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

/// Sidecar Repository 的實作類別
///
/// 實作 [SidecarRepository] 接口，使用 [ApiService] 作為底層資料來源。
/// 此類別位於 Data 層，負責將 Domain 層的抽象需求轉換為具體的 API 呼叫。
///
/// 依賴注入：
/// - 註冊為 [SidecarRepository] 的 LazySingleton
/// - 注入 [ApiService] 進行實際的 gRPC 通訊
@LazySingleton(as: SidecarRepository)
class SidecarRepositoryImpl implements SidecarRepository {
  final ApiService _apiService;

  SidecarRepositoryImpl(this._apiService);

  @override
  Stream<HealthCheckResult> watchHealth() {
    return _apiService.watchHealth();
  }

  @override
  Future<HealthCheckResult> getHealthStatus() {
    return _apiService.healthCheck();
  }

  @override
  Stream<LogEntry> watchLogs({required LogLevel minLevel}) {
    return _apiService.watchLogs(minLevel: minLevel);
  }
}
