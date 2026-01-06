import 'package:news_hub/domain/models/models.dart';

enum SidecarConnectionState {
  uninitialized,
  connecting,
  retrying,
  connected,
  failed,
  closed,
}

abstract class SidecarRepository {
  Stream<SidecarConnectionState> watchHealth();
  Future<SidecarConnectionState> getHealthStatus();
  Stream<LogEntry> watchLogs({required LogLevel minLevel});
  Future<SidecarSettings> getSettings();
  Stream<SidecarSettings> watchSettings();
}

class SidecarSettings {
  final LogLevel logLevel;
  final int maxLogEntries;
  final bool autoScroll;

  SidecarSettings({
    required this.logLevel,
    required this.maxLogEntries,
    required this.autoScroll,
  });
}
