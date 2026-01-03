import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/interactor/watch_logs.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/router/router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'sidecar_logs_cubit.freezed.dart';

/// Sidecar 日誌頁面的 State
///
/// 管理日誌列表、搜尋查詢和匯出狀態。
/// 包含 [filteredLogs] getter 用於即時搜尋過濾。
@freezed
class SidecarLogsState with _$SidecarLogsState {
  const SidecarLogsState._();

  const factory SidecarLogsState({
    /// 所有日誌條目（未過濾）
    @Default([]) List<LogEntry> logs,

    /// 搜尋查詢字串
    @Default('') String searchQuery,

    /// 是否正在搜尋模式
    @Default(false) bool isSearching,

    /// 匯出是否成功
    @Default(false) bool exportSuccess,

    /// 匯出的檔案路徑
    String? exportPath,

    /// 錯誤訊息
    String? error,
  }) = _SidecarLogsState;

  /// 根據搜尋查詢過濾的日誌列表
  ///
  /// 搜尋範圍包括：
  /// - 日誌訊息（message）
  /// - Logger 名稱（loggerName）
  ///
  /// 搜尋不區分大小寫。
  List<LogEntry> get filteredLogs {
    if (searchQuery.isEmpty) return logs;

    final lowerQuery = searchQuery.toLowerCase();
    return logs.where((log) {
      return log.message.toLowerCase().contains(lowerQuery) || log.loggerName.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}

/// Sidecar 日誌管理 Cubit
///
/// 負責日誌的監聽、搜尋、清除和匯出功能。
/// 使用 [WatchLogsUseCase] 獲取日誌串流，遵循 DDD 原則。
/// 日誌相關設定（等級、最大條數）從 [SidecarPreferences] 讀取。
///
/// 職責：
/// - 監聽和管理日誌串流
/// - 提供搜尋功能
/// - 清除日誌
/// - 匯出日誌（未來實作）
/// - 管理最大日誌條數限制
@injectable
class SidecarLogsCubit extends Cubit<SidecarLogsState> {
  final WatchLogsUseCase _watchLogs;
  final SidecarPreferences _preferences;

  StreamSubscription<LogEntry>? _logsSubscription;

  SidecarLogsCubit(
    this._watchLogs,
    this._preferences,
  ) : super(const SidecarLogsState());

  /// 開始監聽日誌串流
  ///
  /// 從 Preferences 讀取日誌等級和最大條數設定，
  /// 然後訂閱日誌串流。當新日誌到達時會自動更新狀態。
  Future<void> startWatching() async {
    // 讀取設定
    final logLevelStr = await _preferences.logLevel.get();
    final maxEntries = await _preferences.maxLogEntries.get();

    // 映射字串到 LogLevel enum
    final minLevel = _parseLogLevel(logLevelStr);

    // 取消舊訂閱
    await stopWatching();

    // 訂閱日誌串流
    _logsSubscription = _watchLogs(minLevel: minLevel).listen(
      (logEntry) {
        final updatedLogs = List<LogEntry>.from(state.logs)..add(logEntry);

        // 限制最大條數
        if (updatedLogs.length > maxEntries) {
          updatedLogs.removeAt(0);
        }

        emit(state.copyWith(logs: updatedLogs));
      },
      onError: (error) {
        emit(state.copyWith(
          error: 'Failed to fetch logs: $error',
        ));
      },
    );
  }

  /// 停止監聽日誌串流
  Future<void> stopWatching() async {
    await _logsSubscription?.cancel();
    _logsSubscription = null;
  }

  /// 重新開始監聽（用於設定變更時）
  ///
  /// 停止當前訂閱並使用新設定重新開始。
  Future<void> restartWithNewLevel() async {
    await stopWatching();
    await startWatching();
  }

  /// 清除所有日誌
  void clearLogs() {
    emit(state.copyWith(logs: []));
  }

  /// 設定搜尋查詢
  ///
  /// 更新搜尋查詢後，[filteredLogs] getter 會自動重新計算。
  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  /// 切換搜尋模式
  ///
  /// 如果正在搜尋，則退出搜尋並清空查詢；
  /// 如果未在搜尋，則進入搜尋模式。
  void toggleSearch() {
    emit(state.copyWith(
      isSearching: !state.isSearching,
      searchQuery: state.isSearching ? '' : state.searchQuery,
    ));
  }

  /// 將所有日誌匯出為 JSON 檔案
  ///
  /// 此方法會：
  /// 1. 請求存儲權限（目前僅 Android 需處理，桌面端由路徑選擇決定）
  /// 2. 將日誌列表轉換為 JSON 格式
  /// 3. 儲存到 App 文件目錄下的 sidecar_logs_[timestamp].json
  Future<void> exportLogsToJson() async {
    try {
      // 1. 請求權限 (針對 Android)
      // 注意：iOS 和桌面通常不需要手動請求 storage 權限來寫入 App Documents 目錄
      if (Theme.of(sl<AppRouter>().navigatorKey.currentContext!).platform == TargetPlatform.android) {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          emit(state.copyWith(error: '無法匯出：未獲得存儲權限'));
          return;
        }
      }

      // 2. 轉換為 JSON
      final logsJson = state.logs
          .map((log) => {
                'timestamp': log.timestamp.toIso8601String(),
                'level': log.level.name,
                'logger': log.loggerName,
                'message': log.message,
                'exception': log.exception,
              })
          .toList();

      final jsonString = const JsonEncoder.withIndent('  ').convert(logsJson);

      // 3. 確定儲存路徑
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
      final fileName = 'sidecar_logs_$timestamp.json';
      final file = File('${directory.path}/$fileName');

      // 4. 寫入檔案
      await file.writeAsString(jsonString);

      // 5. 更新狀態
      emit(state.copyWith(
        exportSuccess: true,
        exportPath: file.path,
        error: null,
      ));

      // 重設成功標記（避免下次進頁面重複顯示提示）
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(exportSuccess: false));
    } catch (e) {
      emit(state.copyWith(error: '匯出失敗: $e'));
    }
  }

  /// 將日誌等級字串映射到 LogLevel enum
  LogLevel _parseLogLevel(String levelStr) {
    try {
      return LogLevel.values.byName(levelStr.toLowerCase());
    } catch (e) {
      // 預設返回 INFO
      return LogLevel.info;
    }
  }

  @override
  Future<void> close() {
    _logsSubscription?.cancel();
    return super.close();
  }
}
