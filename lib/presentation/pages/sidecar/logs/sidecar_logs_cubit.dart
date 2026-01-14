import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:news_hub/app/service/connection/interface.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/router/router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'sidecar_logs_cubit.freezed.dart';

@freezed
class SidecarLogsState with _$SidecarLogsState {
  const SidecarLogsState._();

  const factory SidecarLogsState({
    @Default([]) List<LogEntry> logs,
    @Default('') String searchQuery,
    @Default(false) bool isSearching,
    @Default(false) bool exportSuccess,
    @Default(SidecarConnectionState.uninitialized) SidecarConnectionState connectionStatus,
    @Default(true) bool autoScroll,
    String? exportPath,
    String? error,
  }) = _SidecarLogsState;

  List<LogEntry> get filteredLogs {
    if (searchQuery.isEmpty) return logs;

    final lowerQuery = searchQuery.toLowerCase();
    return logs
        .where((log) =>
            log.message.toLowerCase().contains(lowerQuery) ||
            log.loggerName.toLowerCase().contains(lowerQuery))
        .toList();
  }

  bool get isConnected => connectionStatus == SidecarConnectionState.connected;
  bool get isReconnectable => connectionStatus == SidecarConnectionState.failed || connectionStatus == SidecarConnectionState.closed;
}

@injectable
class SidecarLogsCubit extends Cubit<SidecarLogsState> {
  final SidecarRepository _repository;
  final SidecarConnectionManager _connectionManager;

  StreamSubscription<LogEntry>? _logsSubscription;
  StreamSubscription<SidecarConnectionState>? _healthSubscription;
  int _maxEntries = 1000;

  SidecarLogsCubit(
    this._repository,
    this._connectionManager,
  ) : super(const SidecarLogsState());

  Future<void> startWatching() async {
    final settings = await _repository.getSettings();
    _maxEntries = settings.maxLogEntries;

    emit(state.copyWith(autoScroll: settings.autoScroll));

    await _logsSubscription?.cancel();
    await _healthSubscription?.cancel();

    _logsSubscription = _repository.watchLogs(minLevel: settings.logLevel).listen(
      (logEntry) {
        final updatedLogs = _addLogWithLimit(logEntry);
        emit(state.copyWith(logs: updatedLogs));
      },
      onError: (error) {
        emit(state.copyWith(error: 'Failed to fetch logs: $error'));
      },
    );

    _healthSubscription = _repository.watchHealth().listen(
      (status) {
        emit(state.copyWith(connectionStatus: status));
      },
    );
  }

  List<LogEntry> _addLogWithLimit(LogEntry newLog) {
    final updatedLogs = List<LogEntry>.from(state.logs)..add(newLog);
    if (updatedLogs.length > _maxEntries) {
      updatedLogs.removeAt(0);
    }
    return updatedLogs;
  }

  Future<void> stopWatching() async {
    await _logsSubscription?.cancel();
    await _healthSubscription?.cancel();
    _logsSubscription = null;
    _healthSubscription = null;
  }

  Future<void> retryConnection() async {
    await _connectionManager.reconnect();
  }

  void clearLogs() {
    emit(state.copyWith(logs: []));
  }

  void toggleAutoScroll(bool value) {
    emit(state.copyWith(autoScroll: value));
  }

  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void toggleSearch() {
    emit(state.copyWith(
      isSearching: !state.isSearching,
      searchQuery: state.isSearching ? '' : state.searchQuery,
    ));
  }

  Future<void> exportLogsToJson() async {
    try {
      if (Platform.isAndroid) {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          emit(state.copyWith(error: '無法匯出：未獲得存儲權限'));
          return;
        }
      }

      final jsonString = _convertLogsToJson();
      final file = await _saveToFile(jsonString);

      emit(state.copyWith(
        exportSuccess: true,
        exportPath: file.path,
        error: null,
      ));

      await _resetExportSuccessFlag();
    } catch (e) {
      emit(state.copyWith(error: '匯出失敗: $e'));
    }
  }

  String _convertLogsToJson() {
    final logsJson = state.logs
        .map((log) => {
              'timestamp': log.timestamp.toIso8601String(),
              'level': log.level.name,
              'logger': log.loggerName,
              'message': log.message,
              'exception': log.exception,
            })
        .toList();

    return const JsonEncoder.withIndent('  ').convert(logsJson);
  }

  Future<File> _saveToFile(String jsonString) async {
    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    final fileName = 'sidecar_logs_$timestamp.json';
    final file = File('${directory.path}/$fileName');

    await file.writeAsString(jsonString);
    return file;
  }

  Future<void> _resetExportSuccessFlag() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(exportSuccess: false));
  }

  @override
  Future<void> close() {
    _logsSubscription?.cancel();
    _healthSubscription?.cancel();
    return super.close();
  }
}
