import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

/// 獲取 Sidecar 當前健康狀態的用例
///
/// 封裝一次性獲取 Sidecar 健康狀態的業務邏輯。
/// 與 [WatchHealthUseCase] 不同，此用例只返回當前狀態，不持續監聽。
///
/// 使用範例：
/// ```dart
/// final getHealthStatus = sl<GetHealthStatusUseCase>();
/// final result = await getHealthStatus();
/// if (result.status == ServingStatus.serving) {
///   print('Sidecar is online');
/// }
/// ```
@injectable
class GetHealthStatusUseCase {
  final SidecarRepository _repository;

  GetHealthStatusUseCase(this._repository);

  /// 執行用例，獲取當前健康狀態
  ///
  /// Returns:
  ///   Future<HealthCheckResult> - 當前的健康檢查結果
  Future<HealthCheckResult> call() {
    return _repository.getHealthStatus();
  }
}
