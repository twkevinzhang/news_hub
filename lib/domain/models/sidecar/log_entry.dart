import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';

enum LogLevel { debug, info, warn, error, critical }

extension LogLevelEx on String {
  LogLevel toLogLevel() {
    try {
      return LogLevel.values.byName(toLowerCase());
    } catch (e) {
      return LogLevel.info;
    }
  }
}

@freezed
class LogEntry with _$LogEntry {
  const factory LogEntry({
    required DateTime timestamp,
    required LogLevel level,
    required String loggerName,
    required String message,
    required String exception,
  }) = _LogEntry;
}
