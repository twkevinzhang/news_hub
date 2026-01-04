import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/grpc/grpc_connection_manager.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'package:news_hub/domain/models/models.dart';
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
    String? exportPath,
    String? error,
  }) = _SidecarLogsState;

  List<LogEntry> get filteredLogs {
    if (searchQuery.isEmpty) return logs;

    final lowerQuery = searchQuery.toLowerCase();
    return logs.where((log) =>
      log.message.toLowerCase().contains(lowerQuery) ||
      log.loggerName.toLowerCase().contains(lowerQuery)
    ).toList();
  }
}

@injectable
class SidecarLogsCubit extends Cubit<SidecarLogsState> {
  final GrpcConnectionManager _connectionManager;
  final SidecarPreferences _preferences;

  StreamSubscription<LogEntry>? _logsSubscription;
  int _maxEntries = 1000;

  SidecarLogsCubit(
    this._connectionManager,
    this._preferences,
  ) : super(const SidecarLogsState());

  Future<void> startWatching() async {
    _maxEntries = await _preferences.maxLogEntries.get();

    print('[SidecarLogsCubit] Starting to watch logs from manager, maxEntries: $_maxEntries');

    await _logsSubscription?.cancel();

    _logsSubscription = _connectionManager.logsStream.listen(
      (logEntry) {
        print('[SidecarLogsCubit] Received log entry from manager: ${logEntry.level} - ${logEntry.message}');
        final updatedLogs = _addLogWithLimit(logEntry);
        emit(state.copyWith(logs: updatedLogs));
      },
      onError: (error) {
        print('[SidecarLogsCubit] Error receiving logs: $error');
        emit(state.copyWith(error: 'Failed to fetch logs: $error'));
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
    _logsSubscription = null;
  }

  Future<void> restartWithNewLevel() async {
    final logLevelStr = await _preferences.logLevel.get();
    final newLevel = _parseLogLevel(logLevelStr);

    print('[SidecarLogsCubit] Updating log level to: $newLevel');
    _connectionManager.updateLogLevel(newLevel);
  }

  void clearLogs() {
    emit(state.copyWith(logs: []));
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
      if (_needsStoragePermissionOnAndroid()) {
        final granted = await _requestStoragePermission();
        if (!granted) {
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

  bool _needsStoragePermissionOnAndroid() {
    return Theme.of(sl<AppRouter>().navigatorKey.currentContext!).platform == TargetPlatform.android;
  }

  Future<bool> _requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  String _convertLogsToJson() {
    final logsJson = state.logs.map((log) => {
      'timestamp': log.timestamp.toIso8601String(),
      'level': log.level.name,
      'logger': log.loggerName,
      'message': log.message,
      'exception': log.exception,
    }).toList();

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

  LogLevel _parseLogLevel(String levelStr) {
    try {
      return LogLevel.values.byName(levelStr.toLowerCase());
    } catch (e) {
      return LogLevel.info;
    }
  }

  @override
  Future<void> close() {
    _logsSubscription?.cancel();
    return super.close();
  }
}
