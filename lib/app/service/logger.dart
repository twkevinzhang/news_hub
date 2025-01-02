import 'package:logger/logger.dart';

final _logService = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(),
  level: Level.all,
);

Logger get log => _logService;

extension Errors on Logger {
  /// Quick drop-in for Stream's onError
  void onError(Object m, StackTrace s) => e(m, stackTrace: s);
}
