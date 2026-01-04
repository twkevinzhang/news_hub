import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

@injectable
class WatchLogsUseCase {
  final SidecarRepository _repository;

  WatchLogsUseCase(this._repository);

  Stream<LogEntry> call({LogLevel minLevel = LogLevel.info}) {
    return _repository.watchLogs(minLevel: minLevel);
  }
}
