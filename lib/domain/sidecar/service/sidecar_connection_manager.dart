import 'package:news_hub/domain/models/models.dart';

enum SidecarConnectionState {
  uninitialized,
  connecting,
  retrying,
  connected,
  failed,
  closed,
}

abstract class SidecarConnectionManager {
  Future<void> initialize({
    bool autoReconnect = true,
    required String host,
    required int port,
  });
  Future<void> reconnect();
  Future<void> waitUntilConnected();
  Future<void> dispose();
  Stream<SidecarConnectionState> get stateStream;
  Stream<LogEntry> get logsStream;
  SidecarConnectionState get state;
}
