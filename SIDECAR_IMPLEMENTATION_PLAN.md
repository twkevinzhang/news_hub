# Sidecar 監控功能實作計劃

> 作者：Claude Sonnet 4.5
> 日期：2026-01-03
> 專案：news_hub
> 架構原則：遵循 DDD、Clean Architecture、BLoC Pattern

---

## 📊 專案現況總結

### ✅ 已完成部分

1. **Backend (Python Sidecar)**
   - ✅ Proto 定義完整（HealthCheck, WatchHealth, WatchLogs）
   - ✅ LoggingService 與 HealthCheckService 實作完成
   - ✅ gRPC Service 整合完成

2. **Frontend (Flutter) - 基礎實現**
   - ✅ Domain Models: `HealthCheckResult`, `LogEntry`, `LogLevel`
   - ✅ Infrastructure: `SidecarApiImpl` 完整實現
   - ✅ Presentation: `SidecarCubit` 基本狀態管理
   - ✅ UI: `SidecarLogsScreen` 基礎版本（即時日誌、彩色顯示、清除功能）
   - ✅ Router: Sidecar 路由已配置
   - ✅ Integration: HomeScreen、NavigationDrawer 中的狀態顯示

### ⚠️ 架構問題

1. **違反 DDD 原則**
   - `SidecarCubit` 直接依賴 `ApiService`（應透過 Repository 和 Use Cases）
   - 缺少 Domain 層的 `SidecarRepository` 接口
   - 缺少 Use Cases 封裝業務邏輯

2. **缺失功能**
   - 無 Preferences 管理（日誌等級、最大條數）
   - 無 SidecarManageScreen（設定頁面）
   - 無搜尋功能
   - 無匯出功能
   - Settings Screen 無 Sidecar 入口

---

## 🎯 實作目標

### 核心需求

1. **Settings Integration**
   - Settings Screen 新增 "Sidecar" Tile
   - 點擊導航至 `SidecarManageScreen`

2. **SidecarManageScreen**（設定頁面）
   - 日誌等級選擇（DEBUG/INFO/WARN/ERROR/CRITICAL）
   - 最大日誌條數設定
   - 設定變更立即生效

3. **SidecarLogsScreen Enhancement**（日誌頁面增強）
   - 搜尋功能（浮動按鈕，搜尋當前顯示的日誌）
   - 匯出功能（儲存全部未過濾日誌為 JSON 檔案）
   - 自動滾動開關（在畫面中）

4. **Architecture Refactoring**（架構重構）
   - 遵循 DDD 原則
   - 建立 SidecarRepository
   - 建立 Use Cases
   - 重構 SidecarCubit

---

## 📋 實作計劃（分 4 個 Phase）

### Phase 1: 架構重構（DDD 改造）

> 目標：將現有代碼重構為符合 DDD 的架構

#### 1.1 Domain 層建立

**檔案結構**：
```
lib/domain/sidecar/
├── models/                          # 已存在於 domain/models/models.dart
│   ├── health_check_result.dart     # 移動並獨立
│   ├── log_entry.dart               # 移動並獨立
│   └── serving_status.dart          # 移動並獨立
├── repository/
│   └── sidecar_repository.dart      # 新建：Repository 接口
└── interactor/                      # Use Cases
    ├── watch_health.dart            # 新建
    ├── get_health_status.dart       # 新建
    ├── watch_logs.dart              # 新建
    ├── clear_logs.dart              # 新建
    └── export_logs.dart             # 新建（未來用）
```

**任務清單**：
- [ ] 1.1.1 在 `lib/domain/sidecar/repository/` 建立 `sidecar_repository.dart`
  ```dart
  abstract class SidecarRepository {
    Stream<HealthCheckResult> watchHealth();
    Future<HealthCheckResult> getHealthStatus();
    Stream<LogEntry> watchLogs({required LogLevel minLevel});
  }
  ```

- [ ] 1.1.2 建立 Use Case: `WatchHealthUseCase`
  ```dart
  @injectable
  class WatchHealthUseCase {
    final SidecarRepository _repository;

    WatchHealthUseCase(this._repository);

    Stream<HealthCheckResult> call() {
      return _repository.watchHealth();
    }
  }
  ```

- [ ] 1.1.3 建立 Use Case: `GetHealthStatusUseCase`
- [ ] 1.1.4 建立 Use Case: `WatchLogsUseCase`
  ```dart
  @injectable
  class WatchLogsUseCase {
    final SidecarRepository _repository;

    WatchLogsUseCase(this._repository);

    Stream<LogEntry> call({required LogLevel minLevel}) {
      return _repository.watchLogs(minLevel: minLevel);
    }
  }
  ```

- [ ] 1.1.5 建立 Use Case: `ClearLogsUseCase`（純 Cubit 邏輯，可能不需要）

#### 1.2 Data 層實作

**檔案結構**：
```
lib/app/sidecar/
├── repository/
│   └── sidecar_repository_impl.dart # 新建：Repository 實作
└── preferences/
    └── sidecar_preferences.dart     # 新建：Sidecar 相關設定
```

**任務清單**：
- [ ] 1.2.1 建立 `SidecarRepositoryImpl`
  ```dart
  @LazySingleton(as: SidecarRepository)
  class SidecarRepositoryImpl implements SidecarRepository {
    final ApiService _apiService;

    SidecarRepositoryImpl(this._apiService);

    @override
    Stream<HealthCheckResult> watchHealth() {
      return _apiService.watchHealth();
    }

    @override
    Future<HealthCheckResult> getHealthStatus() {
      return _apiService.healthCheck();
    }

    @override
    Stream<LogEntry> watchLogs({required LogLevel minLevel}) {
      return _apiService.watchLogs(minLevel: minLevel);
    }
  }
  ```

- [ ] 1.2.2 建立 `SidecarPreferences`
  ```dart
  class SidecarPreferences {
    final PreferenceStore _store;

    late final Preference<String> logLevel;      // DEBUG, INFO, WARN, ERROR, CRITICAL
    late final Preference<int> maxLogEntries;    // 預設 1000
    late final Preference<bool> autoScroll;      // 預設 true

    SidecarPreferences(this._store) {
      logLevel = StringPrimitive(
        store: _store,
        key: 'sidecar.log_level',
        defaultValue: 'INFO',
      );

      maxLogEntries = IntPrimitive(
        store: _store,
        key: 'sidecar.max_log_entries',
        defaultValue: 1000,
      );

      autoScroll = BooleanPrimitive(
        store: _store,
        key: 'sidecar.auto_scroll',
        defaultValue: true,
      );
    }
  }
  ```

- [ ] 1.2.3 在 `locator.dart` 註冊 `SidecarPreferences`
  ```dart
  @module
  abstract class AppProvider {
    // ...

    @singleton
    SidecarPreferences sidecarPreferences(PreferenceStore store) {
      return SidecarPreferences(store);
    }
  }
  ```

#### 1.3 Presentation 層重構

**任務清單**：
- [ ] 1.3.1 重構 `SidecarCubit` 使用 Use Cases
  ```dart
  @injectable
  class SidecarCubit extends Cubit<SidecarState> {
    final WatchHealthUseCase _watchHealth;
    final WatchLogsUseCase _watchLogs;
    final SidecarPreferences _preferences;

    SidecarCubit(
      this._watchHealth,
      this._watchLogs,
      this._preferences,
    ) : super(const SidecarState(status: SidecarStatus.starting));

    // ...
  }
  ```

- [ ] 1.3.2 更新 `SidecarState` 移除 `logs` 和 `autoScroll`（移到單獨的 LogsCubit）
  ```dart
  @freezed
  class SidecarState with _$SidecarState {
    const factory SidecarState({
      required SidecarStatus status,
      String? message,
    }) = _SidecarState;
  }
  ```

- [ ] 1.3.3 建立新的 `SidecarLogsCubit` 管理日誌狀態
  ```dart
  @injectable
  class SidecarLogsCubit extends Cubit<SidecarLogsState> {
    final WatchLogsUseCase _watchLogs;
    final SidecarPreferences _preferences;

    SidecarLogsCubit(
      this._watchLogs,
      this._preferences,
    ) : super(const SidecarLogsState());

    void startWatching() async {
      final minLevel = await _preferences.logLevel.get();
      final maxEntries = await _preferences.maxLogEntries.get();

      _subscription = _watchLogs(
        minLevel: LogLevel.values.byName(minLevel.toLowerCase()),
      ).listen((logEntry) {
        final updatedLogs = List<LogEntry>.from(state.logs)..add(logEntry);

        if (updatedLogs.length > maxEntries) {
          updatedLogs.removeAt(0);
        }

        emit(state.copyWith(logs: updatedLogs));
      });
    }
  }
  ```

- [ ] 1.3.4 建立 `SidecarLogsState`
  ```dart
  @freezed
  class SidecarLogsState with _$SidecarLogsState {
    const factory SidecarLogsState({
      @Default([]) List<LogEntry> logs,
      @Default('') String searchQuery,
      @Default(false) bool isSearching,
    }) = _SidecarLogsState;

    List<LogEntry> get filteredLogs {
      if (searchQuery.isEmpty) return logs;
      return logs.where((log) =>
        log.message.toLowerCase().contains(searchQuery.toLowerCase()) ||
        log.loggerName.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }
  }
  ```

- [ ] 1.3.5 執行 `dart run build_runner build --delete-conflicting-outputs`
- [ ] 1.3.6 **Commit**: `refactor(sidecar): migrate to DDD architecture with Repository and Use Cases`

---

### Phase 2: Settings & Preferences Implementation

> 目標：實作 SidecarManageScreen 和 Settings 整合

#### 2.1 Router 配置

**任務清單**：
- [ ] 2.1.1 在 `lib/presentation/router/router.dart` 加入路由
  ```dart
  AutoRoute(path: '/sidecar/manage', page: SidecarManageRoute.page),
  ```

- [ ] 2.1.2 執行 `dart run build_runner build --delete-conflicting-outputs`

#### 2.2 SidecarManageScreen 實作

**檔案位置**：`lib/presentation/pages/sidecar/view/sidecar_manage_screen.dart`

**UI 需求**：
1. AppBar: 標題 "Sidecar 設定"
2. 日誌等級選擇（DropdownButton）
3. 最大日誌條數設定（Slider 或 TextField）

**任務清單**：
- [ ] 2.2.1 建立 `SidecarManageScreen`
  ```dart
  @RoutePage()
  class SidecarManageScreen extends StatelessWidget {
    const SidecarManageScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sidecar 設定')),
        body: ListView(
          children: [
            _LogLevelSetting(),
            _MaxLogEntriesSetting(),
          ],
        ),
      );
    }
  }
  ```

- [ ] 2.2.2 實作 `_LogLevelSetting` Widget
  ```dart
  class _LogLevelSetting extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final preferences = sl<SidecarPreferences>();

      return ListTile(
        title: const Text('日誌等級'),
        subtitle: FutureBuilder<String>(
          future: preferences.logLevel.get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox();

            return DropdownButton<String>(
              value: snapshot.data,
              items: ['DEBUG', 'INFO', 'WARN', 'ERROR', 'CRITICAL']
                  .map((level) => DropdownMenuItem(
                        value: level,
                        child: Text(level),
                      ))
                  .toList(),
              onChanged: (newLevel) async {
                if (newLevel != null) {
                  await preferences.logLevel.set(newLevel);
                  // 觸發立即生效
                  sl<SidecarLogsCubit>().restartWithNewLevel();
                }
              },
            );
          },
        ),
      );
    }
  }
  ```

- [ ] 2.2.3 實作 `_MaxLogEntriesSetting` Widget
  ```dart
  class _MaxLogEntriesSetting extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final preferences = sl<SidecarPreferences>();

      return ListTile(
        title: const Text('最大日誌條數'),
        subtitle: FutureBuilder<int>(
          future: preferences.maxLogEntries.get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox();

            return Slider(
              value: snapshot.data!.toDouble(),
              min: 100,
              max: 5000,
              divisions: 49,
              label: '${snapshot.data}',
              onChanged: (value) async {
                await preferences.maxLogEntries.set(value.toInt());
              },
            );
          },
        ),
      );
    }
  }
  ```

- [ ] 2.2.4 在 `SidecarLogsCubit` 加入 `restartWithNewLevel()` 方法
  ```dart
  void restartWithNewLevel() async {
    await stopWatching();
    await startWatching();
  }
  ```

#### 2.3 Settings Screen 整合

**檔案位置**：`lib/presentation/pages/settings/view/settings_screen.dart`

**任務清單**：
- [ ] 2.3.1 在 Settings Screen 加入 "Sidecar" Tile
  ```dart
  ListTile(
    leading: const Icon(Icons.monitor_heart),
    title: const Text('Sidecar 設定'),
    subtitle: const Text('管理 Sidecar 服務的日誌和監控設定'),
    onTap: () {
      context.router.push(const SidecarManageRoute());
    },
  ),
  ```

- [ ] 2.3.2 **Commit**: `feat(sidecar): add SidecarManageScreen with log level and max entries settings`

---

### Phase 3: SidecarLogsScreen Enhancement

> 目標：增強日誌頁面功能（搜尋、匯出、自動滾動）

#### 3.1 UI 布局調整

**任務清單**：
- [ ] 3.1.1 將自動滾動開關從 AppBar actions 移到頁面底部（BottomAppBar 或浮動按鈕旁）
- [ ] 3.1.2 在 AppBar actions 保留「清除」按鈕
- [ ] 3.1.3 設計浮動按鈕布局：
  - 主要 FAB：搜尋（點擊展開搜尋框）
  - 次要 FAB：匯出

#### 3.2 搜尋功能

**需求**：
- 浮動按鈕觸發
- 搜尋當前顯示的日誌（已過濾的）
- 搜尋範圍：message + loggerName

**任務清單**：
- [ ] 3.2.1 在 `SidecarLogsState` 加入搜尋相關狀態（已在 Phase 1.3.4 完成）
- [ ] 3.2.2 在 `SidecarLogsCubit` 加入搜尋方法
  ```dart
  void setSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void toggleSearch() {
    emit(state.copyWith(
      isSearching: !state.isSearching,
      searchQuery: state.isSearching ? '' : state.searchQuery,
    ));
  }
  ```

- [ ] 3.2.3 在 `SidecarLogsScreen` 實作搜尋 UI
  ```dart
  // FloatingActionButton
  FloatingActionButton(
    onPressed: () => context.read<SidecarLogsCubit>().toggleSearch(),
    child: const Icon(Icons.search),
  ),

  // AppBar 中的搜尋框
  BlocBuilder<SidecarLogsCubit, SidecarLogsState>(
    builder: (context, state) {
      if (!state.isSearching) return const SizedBox();

      return TextField(
        autofocus: true,
        decoration: const InputDecoration(
          hintText: '搜尋日誌...',
          border: InputBorder.none,
        ),
        onChanged: (query) {
          context.read<SidecarLogsCubit>().setSearchQuery(query);
        },
      );
    },
  ),
  ```

- [ ] 3.2.4 更新 ListView.builder 使用 `state.filteredLogs`

#### 3.3 匯出功能

**需求**：
- 匯出全部未過濾的日誌
- JSON 格式
- 儲存到檔案

**任務清單**：
- [ ] 3.3.1 加入依賴 `path_provider` 和 `permission_handler`
  ```yaml
  dependencies:
    path_provider: ^2.1.1
    permission_handler: ^11.0.1
  ```

- [ ] 3.3.2 在 `SidecarLogsCubit` 加入匯出方法
  ```dart
  Future<void> exportLogsToJson() async {
    try {
      // 請求存儲權限
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        emit(state.copyWith(error: '需要存儲權限'));
        return;
      }

      // 轉換為 JSON
      final logsJson = state.logs.map((log) => {
        'timestamp': log.timestamp.toIso8601String(),
        'level': log.level.name,
        'logger': log.loggerName,
        'message': log.message,
        'exception': log.exception,
      }).toList();

      final jsonString = jsonEncode(logsJson);

      // 儲存檔案
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-');
      final file = File('${directory.path}/sidecar_logs_$timestamp.json');
      await file.writeAsString(jsonString);

      emit(state.copyWith(
        exportSuccess: true,
        exportPath: file.path,
      ));
    } catch (e) {
      emit(state.copyWith(error: '匯出失敗: $e'));
    }
  }
  ```

- [ ] 3.3.3 更新 `SidecarLogsState` 加入匯出狀態
  ```dart
  @freezed
  class SidecarLogsState with _$SidecarLogsState {
    const factory SidecarLogsState({
      @Default([]) List<LogEntry> logs,
      @Default('') String searchQuery,
      @Default(false) bool isSearching,
      @Default(false) bool exportSuccess,
      String? exportPath,
      String? error,
    }) = _SidecarLogsState;
  }
  ```

- [ ] 3.3.4 在 UI 加入匯出按鈕和結果顯示
  ```dart
  FloatingActionButton(
    onPressed: () {
      context.read<SidecarLogsCubit>().exportLogsToJson();
    },
    child: const Icon(Icons.download),
  ),

  // BlocListener 顯示匯出結果
  BlocListener<SidecarLogsCubit, SidecarLogsState>(
    listener: (context, state) {
      if (state.exportSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('已匯出至 ${state.exportPath}')),
        );
      }
      if (state.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error!)),
        );
      }
    },
    child: /* ... */,
  ),
  ```

#### 3.4 自動滾動開關移至畫面中

**任務清單**：
- [ ] 3.4.1 從 `SidecarState` 移除 `autoScroll`（已在 Phase 1.3.2 完成）
- [ ] 3.4.2 在 `SidecarPreferences` 中管理 `autoScroll`（已在 Phase 1.2.2 完成）
- [ ] 3.4.3 在頁面底部加入自動滾動開關（SwitchListTile）
  ```dart
  Positioned(
    bottom: 16,
    left: 16,
    child: Card(
      child: SwitchListTile(
        title: const Text('自動滾動'),
        value: autoScroll,
        onChanged: (value) async {
          await sl<SidecarPreferences>().autoScroll.set(value);
          setState(() {}); // 或使用 StreamBuilder
        },
      ),
    ),
  ),
  ```

- [ ] 3.4.4 **Commit**: `feat(sidecar): add search, export and auto-scroll toggle to logs screen`

---

### Phase 4: 測試、優化與文檔

> 目標：確保代碼品質、效能和可維護性

#### 4.1 單元測試

**任務清單**：
- [ ] 4.1.1 測試 `SidecarRepository`
- [ ] 4.1.2 測試所有 Use Cases
- [ ] 4.1.3 測試 `SidecarCubit`
- [ ] 4.1.4 測試 `SidecarLogsCubit`
- [ ] 4.1.5 測試 `SidecarPreferences`
- [ ] 4.1.6 執行 `flutter test --coverage`
- [ ] 4.1.7 確保測試覆蓋率 > 80%

#### 4.2 Widget 測試

**任務清單**：
- [ ] 4.2.1 測試 `SidecarLogsScreen`
- [ ] 4.2.2 測試 `SidecarManageScreen`
- [ ] 4.2.3 測試搜尋功能
- [ ] 4.2.4 測試匯出功能

#### 4.3 代碼品質檢查

**任務清單**：
- [ ] 4.3.1 執行 `flutter analyze`，確保 0 error, 0 critical warning
- [ ] 4.3.2 執行 `flutter format .`
- [ ] 4.3.3 檢查所有 public API 是否有 Dart Doc 註解
- [ ] 4.3.4 檢查是否符合 Clean Code 原則
  - [ ] 方法長度 < 20 行
  - [ ] 參數數量 <= 3
  - [ ] 命名清晰自解釋
  - [ ] 使用 Guard Clause

#### 4.4 效能優化

**任務清單**：
- [ ] 4.4.1 使用 Flutter DevTools 檢查 BLoC 重建次數
- [ ] 4.4.2 優化 `filteredLogs` getter（考慮使用 memoization）
- [ ] 4.4.3 檢查是否有記憶體洩漏（Stream 訂閱未取消）
- [ ] 4.4.4 確保動畫流暢 60 FPS

#### 4.5 文檔撰寫

**任務清單**：
- [ ] 4.5.1 更新 README.md（加入 Sidecar 監控功能說明）
- [ ] 4.5.2 撰寫 API 文檔（使用 `dartdoc`）
- [ ] 4.5.3 更新 AGENTS.md（記錄實作經驗和最佳實踐）
- [ ] 4.5.4 **Final Commit**: `docs(sidecar): update documentation and add API docs`

---

## 🎯 完成檢查清單

在宣告專案完成前，逐項確認：

### ✅ 功能完整性
- [ ] Settings Screen 有 Sidecar 入口
- [ ] SidecarManageScreen 可設定日誌等級
- [ ] SidecarManageScreen 可設定最大日誌條數
- [ ] 設定變更立即生效
- [ ] SidecarLogsScreen 有搜尋功能
- [ ] SidecarLogsScreen 可匯出 JSON
- [ ] SidecarLogsScreen 有自動滾動開關
- [ ] 彩色日誌正確顯示

### ✅ 架構規範
- [ ] 遵循 DDD 分層架構
- [ ] Domain 層不依賴外層
- [ ] 使用 Repository Pattern
- [ ] 使用 Use Cases 封裝業務邏輯
- [ ] 依賴注入正確配置

### ✅ 代碼品質
- [ ] `flutter analyze` 0 error, 0 critical warning
- [ ] 測試覆蓋率 > 80%
- [ ] 所有 public API 有文檔註解
- [ ] 符合 Clean Code 原則
- [ ] 符合 AGENTS.md 規範

### ✅ 效能與 UX
- [ ] BLoC 重建次數優化 > 80%
- [ ] 動畫流暢 60 FPS
- [ ] 無視覺閃爍
- [ ] 無記憶體洩漏
- [ ] 狀態正確保持

### ✅ 版本控制
- [ ] 每個 Phase 完成後有 commit
- [ ] Commit message 清楚描述變更
- [ ] 使用正確的 author（twkevinzhang）

---

## 📌 注意事項

1. **立即生效機制**：日誌等級變更後，需重新訂閱 `watchLogs` stream
2. **匯出功能**：需處理 Android 11+ 的 Scoped Storage 權限
3. **搜尋效能**：日誌量大時考慮 debounce 搜尋輸入
4. **測試隔離**：Use Cases 和 Repository 使用 Mock 測試
5. **依賴注入**：每次修改後執行 `dart run build_runner build`

---

## 📅 預估時程

| Phase | 預估時間 | 重點 |
|-------|---------|------|
| Phase 1 | 2-3 小時 | 架構重構，最關鍵 |
| Phase 2 | 1-2 小時 | Settings 整合 |
| Phase 3 | 2-3 小時 | UI 增強功能 |
| Phase 4 | 2-3 小時 | 測試與優化 |
| **總計** | **7-11 小時** | |

---

## 🔗 相關文件

- [AGENTS.md](./AGENTS.md) - 開發規範
- [README.md](./README.md) - 專案說明
- [Proto Definition](./news_hub_protos/sidecar_api.proto) - gRPC API 定義

---

_本計劃由 Claude Sonnet 4.5 生成，遵循 DDD、Clean Architecture 和 AGENTS.md 規範_
