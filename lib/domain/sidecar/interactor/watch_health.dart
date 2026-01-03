import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

/// 監聽 Sidecar 健康狀態的用例
///
/// 封裝持續監聽 Sidecar 健康狀態的業務邏輯。
/// 返回一個 Stream，當 Sidecar 狀態變更時會推送新的健康檢查結果。
///
/// 使用範例：
/// ```dart
/// final watchHealth = sl<WatchHealthUseCase>();
/// watchHealth().listen((result) {
///   print('Sidecar status: ${result.status}');
/// });
/// ```
@injectable
class WatchHealthUseCase {
  final SidecarRepository _repository;

  WatchHealthUseCase(this._repository);

  /// 執行用例，開始監聽健康狀態
  ///
  /// Returns:
  ///   Stream<HealthCheckResult> - 健康狀態變更的串流
  Stream<HealthCheckResult> call() {
    return _repository.watchHealth();
  }
}
