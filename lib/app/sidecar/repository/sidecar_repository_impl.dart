import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';
import 'package:news_hub/domain/sidecar/service/sidecar_connection_manager.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: SidecarRepository)
class SidecarRepositoryImpl implements SidecarRepository {
  final SidecarConnectionManager _connectionManager;
  final SidecarPreferences _preferences;

  SidecarRepositoryImpl(
    this._connectionManager,
    this._preferences,
  );

  @override
  Stream<SidecarConnectionState> watchHealth() {
    return _connectionManager.stateStream.startWith(_connectionManager.state).distinct();
  }

  @override
  Future<SidecarConnectionState> getHealthStatus() async {
    await _ensureConnected();
    final state = _connectionManager.state;
    return state;
  }

  @override
  Stream<LogEntry> watchLogs({required LogLevel minLevel}) {
    return _connectionManager.logsStream.where((entry) => entry.level.index >= minLevel.index);
  }

  @override
  Future<SidecarSettings> getSettings() async {
    return SidecarSettings(
      logLevel: (await _preferences.logLevel.get()).toLogLevel(),
      maxLogEntries: await _preferences.maxLogEntries.get(),
      autoScroll: await _preferences.autoScroll.get(),
    );
  }

  @override
  Stream<SidecarSettings> watchSettings() {
    return CombineLatestStream.combine3(
      _preferences.logLevel.changes(),
      _preferences.maxLogEntries.changes(),
      _preferences.autoScroll.changes(),
      (String logLevel, int maxLogEntries, bool autoScroll) {
        return SidecarSettings(
          logLevel: logLevel.toLogLevel(),
          maxLogEntries: maxLogEntries,
          autoScroll: autoScroll,
        );
      },
    );
  }

  Future<void> _ensureConnected() async {
    await _connectionManager.waitUntilConnected();
  }
}
