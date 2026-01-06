import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';

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
