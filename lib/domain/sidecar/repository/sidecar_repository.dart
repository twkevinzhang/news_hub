import 'package:news_hub/domain/models/models.dart';

abstract class SidecarRepository {
  Stream<HealthCheckResult> watchHealth();
  Future<HealthCheckResult> getHealthStatus();
  Stream<LogEntry> watchLogs({required LogLevel minLevel});
}
