import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

/// 監聽 Sidecar 日誌串流的用例
///
/// 封裝持續監聽 Sidecar 日誌的業務邏輯。
/// 返回一個 Stream，當 Sidecar 產生新日誌時會推送。
/// 支援透過最低日誌等級進行過濾。
///
/// 使用範例：
/// ```dart
/// final watchLogs = sl<WatchLogsUseCase>();
/// watchLogs(minLevel: LogLevel.info).listen((logEntry) {
///   print('[${logEntry.level}] ${logEntry.message}');
/// });
/// ```
@injectable
class WatchLogsUseCase {
  final SidecarRepository _repository;

  WatchLogsUseCase(this._repository);

  /// 執行用例，開始監聽日誌串流
  ///
  /// Parameters:
  ///   - minLevel: 最低日誌等級，預設為 INFO
  ///
  /// Returns:
  ///   Stream<LogEntry> - 日誌條目的串流
  Stream<LogEntry> call({LogLevel minLevel = LogLevel.info}) {
    return _repository.watchLogs(minLevel: minLevel);
  }
}
