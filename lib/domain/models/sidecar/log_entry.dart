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

class LogEntry {
  final DateTime timestamp;
  final LogLevel level;
  final String loggerName;
  final String message;
  final String exception;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.loggerName,
    required this.message,
    required this.exception,
  });
}
