# Sidecar 監控功能實作進度

> 更新時間：2026-01-03
> 狀態：Phase 1, 2, 3 已完成 ✅，進入 Phase 4 測試優化階段 🏗️

---

## 📊 總體進度

- [x] Phase 1: 架構重構（DDD 改造） - 11/11 ✅
- [x] Phase 2: Settings & Preferences - 9/9 ✅
- [x] Phase 3: SidecarLogsScreen Enhancement - 16/16 ✅
- [ ] Phase 4: 測試、優化與文檔 - 0/18

**總計**: 36/64 任務完成 (56%)

---

## Phase 1: 架構重構（DDD 改造） ✅

### 1.1 Domain 層建立 (5/5) ✅

- [x] 1.1.1 建立 `SidecarRepository` 接口

  - 檔案: `lib/domain/sidecar/repository/sidecar_repository.dart`
  - 內容: 定義 `watchHealth()`, `getHealthStatus()`, `watchLogs()` 方法

- [x] 1.1.2 建立 `WatchHealthUseCase`

  - 檔案: `lib/domain/sidecar/interactor/watch_health.dart`
  - 內容: 封裝 `repository.watchHealth()` 呼叫

- [x] 1.1.3 建立 `GetHealthStatusUseCase`

  - 檔案: `lib/domain/sidecar/interactor/get_health_status.dart`
  - 內容: 封裝 `repository.getHealthStatus()` 呼叫

- [x] 1.1.4 建立 `WatchLogsUseCase`

  - 檔案: `lib/domain/sidecar/interactor/watch_logs.dart`
  - 內容: 封裝 `repository.watchLogs()` 呼叫，支援 minLevel 參數

- [x] 1.1.5 ~~建立 `ClearLogsUseCase`~~（不需要，在 Cubit 層處理）

### 1.2 Data 層實作 (3/3) ✅

- [x] 1.2.1 建立 `SidecarRepositoryImpl`

  - 檔案: `lib/app/sidecar/repository/sidecar_repository_impl.dart`
  - 內容: 實作 `SidecarRepository`，使用 `ApiService`
  - 註冊: `@LazySingleton(as: SidecarRepository)`

- [x] 1.2.2 建立 `SidecarPreferences`

  - 檔案: `lib/app/sidecar/preferences/sidecar_preferences.dart`
  - 內容: 定義 `logLevel`, `maxLogEntries`, `autoScroll` preferences

- [x] 1.2.3 在 `locator.dart` 註冊 `SidecarPreferences`
  - 檔案: `lib/locator.dart`
  - 內容: 在 `AppProvider` 中加入 `@singleton SidecarPreferences`

### 1.3 Presentation 層重構 (6/6) ✅

- [x] 1.3.1 重構 `SidecarCubit` 使用 Use Cases

  - 檔案: `lib/presentation/pages/sidecar/bloc/sidecar_cubit.dart`
  - 變更: 注入 `WatchHealthUseCase` 替代 `ApiService`

- [x] 1.3.2 更新 `SidecarState` 移除 logs 和 autoScroll

  - 檔案: `lib/presentation/pages/sidecar/bloc/sidecar_cubit.dart`
  - 變更: 只保留 `status` 和 `message`

- [x] 1.3.3 建立 `SidecarLogsCubit`

  - 檔案: `lib/presentation/pages/sidecar/bloc/sidecar_logs_cubit.dart`
  - 內容: 管理日誌狀態，注入 `WatchLogsUseCase` 和 `SidecarPreferences`

- [x] 1.3.4 建立 `SidecarLogsState`

  - 檔案: `lib/presentation/pages/sidecar/bloc/sidecar_logs_cubit.dart`
  - 內容: 定義 `logs`, `searchQuery`, `isSearching`, `filteredLogs` getter

- [x] 1.3.5 執行 build_runner

  - 命令: `dart run build_runner build --delete-conflicting-outputs`
  - 結果: 成功生成 freezed 和 injectable 代碼

- [x] 1.3.6 **Commit**
  - Message: `refactor(sidecar): migrate to DDD architecture with Repository and Use Cases`
  - Author: twkevinzhang
  - Commit: fcc22d3

### 進度: Phase 1 完成度 11/11 (100%) ✅

---

## Phase 2: Settings & Preferences Implementation ✅

### 2.1 Router 配置 (2/2) ✅

- [x] 2.1.1 在 router 加入 SidecarManageRoute

  - 檔案: `lib/presentation/router/router.dart`
  - 內容: `AutoRoute(path: '/sidecar/manage', page: SidecarManageRoute.page)`

- [x] 2.1.2 執行 build_runner
  - 命令: `dart run build_runner build --delete-conflicting-outputs`

### 2.2 SidecarManageScreen 實作 (4/4) ✅

- [x] 2.2.1 建立 `SidecarManageScreen`

  - 檔案: `lib/presentation/pages/sidecar/view/sidecar_manage_screen.dart`
  - 內容: 基本 Scaffold 結構

- [x] 2.2.2 實作 `_LogLevelSetting` Widget

  - 內容: DropdownButton 選擇日誌等級（DEBUG/INFO/WARN/ERROR/CRITICAL）
  - 功能: 選擇後儲存到 Preferences 並立即生效

- [x] 2.2.3 實作 `_MaxLogEntriesSetting` Widget

  - 內容: Slider 設定最大日誌條數（100-5000）
  - 功能: 變更後儲存到 Preferences

- [x] 2.2.4 在 `SidecarLogsCubit` 加入 `restartWithNewLevel()` 方法
  - 檔案: `lib/presentation/pages/sidecar/bloc/sidecar_logs_cubit.dart`
  - 內容: 停止並重新開始監聽日誌流

### 2.3 Settings Screen 整合 (2/2) ✅

- [x] 2.3.1 在 Settings Screen 加入 Sidecar Tile

  - 檔案: `lib/presentation/pages/settings/view/settings_screen.dart`
  - 內容: ListTile，點擊導航至 SidecarManageRoute

- [x] 2.3.2 **Commit**
  - Message: `feat(sidecar): add SidecarManageScreen with log level and max entries settings`
  - Author: twkevinzhang

### 進度: Phase 2 完成度 9/9 (100%) ✅

---

## Phase 3: SidecarLogsScreen Enhancement ✅

### 3.1 UI 布局調整 (3/3) ✅

- [x] 3.1.1 移動自動滾動開關至頁面底部

  - 從 AppBar actions 移除

- [x] 3.1.2 AppBar 保留清除按鈕

  - 調整 actions 布局

- [x] 3.1.3 設計浮動按鈕布局
  - 主要 FAB: 搜尋
  - 次役 FAB: 匯出

### 3.2 搜尋功能 (4/4) ✅

- [x] 3.2.1 在 `SidecarLogsState` 加入搜尋狀態

  - 已在 Phase 1.3.4 完成

- [x] 3.2.2 在 `SidecarLogsCubit` 加入搜尋方法

  - `setSearchQuery(String query)`
  - `toggleSearch()`

- [x] 3.2.3 在 `SidecarLogsScreen` 實作搜尋 UI

  - FloatingActionButton 觸發搜尋
  - AppBar 顯示搜尋框（TextField）

- [x] 3.2.4 更新 ListView 使用 `filteredLogs`
  - 顯示過濾後的日誌

### 3.3 匯出功能 (4/4) ✅

- [x] 3.3.1 加入依賴

  - `path_provider: ^2.1.1`
  - `permission_handler: ^11.0.1`

- [x] 3.3.2 在 `SidecarLogsCubit` 加入 `exportLogsToJson()` 方法

  - 請求存儲權限
  - 轉換日誌為 JSON
  - 儲存到檔案

- [x] 3.3.3 更新 `SidecarLogsState` 加入匯出狀態

  - `exportSuccess`, `exportPath`, `error`

- [x] 3.3.4 在 UI 加入匯出按鈕和結果顯示
  - FloatingActionButton
  - BlocListener 顯示 SnackBar

### 3.4 自動滾動開關移至畫面中 (4/4) ✅

- [x] 3.4.1 從 `SidecarState` 移除 `autoScroll`

  - 已在 Phase 1.3.2 完成

- [x] 3.4.2 在 `SidecarPreferences` 管理 `autoScroll`

  - 已在 Phase 1.2.2 完成

- [x] 3.4.3 在頁面底部加入自動滾動開關

  - SwitchListTile 或 Switch

- [x] 3.4.4 **Commit**
  - Message: `feat(sidecar): add search, export and auto-scroll toggle to logs screen`
  - Author: twkevinzhang

### 進度: Phase 3 完成度 16/16 (100%) ✅

---

## Phase 4: 測試、優化與文檔 🏗️

### 4.1 單元測試 (0/7)

- [ ] 4.1.1 測試 `SidecarRepository`

  - 檔案: `test/data/sidecar/repository/sidecar_repository_impl_test.dart`

- [ ] 4.1.2 測試所有 Use Cases

  - `test/domain/sidecar/interactor/`

- [ ] 4.1.3 測試 `SidecarCubit`

  - 檔案: `test/presentation/pages/sidecar/bloc/sidecar_cubit_test.dart`

- [ ] 4.1.4 測試 `SidecarLogsCubit`

  - 檔案: `test/presentation/pages/sidecar/bloc/sidecar_logs_cubit_test.dart`

- [ ] 4.1.5 測試 `SidecarPreferences`

  - 檔案: `test/data/sidecar/preferences/sidecar_preferences_test.dart`

- [ ] 4.1.6 執行測試覆蓋率

  - 命令: `flutter test --coverage`

- [ ] 4.1.7 確保覆蓋率 > 80%
  - 使用 `lcov` 或 IDE 插件查看報告

### 4.2 Widget 測試 (0/4)

- [ ] 4.2.1 測試 `SidecarLogsScreen`

  - 檔案: `test/presentation/pages/sidecar/view/sidecar_logs_screen_test.dart`

- [ ] 4.2.2 測試 `SidecarManageScreen`

  - 檔案: `test/presentation/pages/sidecar/view/sidecar_manage_screen_test.dart`

- [ ] 4.2.3 測試搜尋功能

  - 驗證過濾邏輯

- [ ] 4.2.4 測試匯出功能
  - Mock 檔案系統

### 4.3 代碼品質檢查 (0/4)

- [ ] 4.3.1 執行 flutter analyze

  - 命令: `flutter analyze`
  - 目標: 0 error, 0 critical warning

- [ ] 4.3.2 執行 flutter format

  - 命令: `flutter format .`

- [ ] 4.3.3 檢查 Dart Doc 註解

  - 所有 public API 必須有註解

- [ ] 4.3.4 檢查 Clean Code 原則
  - 方法長度 < 20 行
  - 參數數量 <= 3
  - 命名清晰

### 4.4 效能優化 (0/4)

- [ ] 4.4.1 使用 DevTools 檢查重建次數

  - 工具: Flutter DevTools Performance

- [ ] 4.4.2 優化 `filteredLogs` getter

  - 考慮 memoization

- [ ] 4.4.3 檢查記憶體洩漏

  - 確認所有 Stream 訂閱都在 close() 中取消

- [ ] 4.4.4 確保動畫流暢
  - 目標: 60 FPS

### 4.5 文檔撰寫 (0/4)

- [ ] 4.5.1 更新 README.md

  - 加入 Sidecar 監控功能說明

- [ ] 4.5.2 生成 API 文檔

  - 命令: `dartdoc`

- [ ] 4.5.3 更新 AGENTS.md

  - 記錄實作經驗

- [ ] 4.5.4 **Final Commit**
  - Message: `docs(sidecar): update documentation and add API docs`
  - Author: twkevinzhang

### 進度: Phase 4 完成度 0/18 (0%)

---

## 📈 里程碑

- [x] **Milestone 1**: Phase 1 完成（架構重構） ✅
- [x] **Milestone 2**: Phase 2 完成（Settings 整合） ✅
- [x] **Milestone 3**: Phase 3 完成（UI 增強） ✅
- [ ] **Milestone 4**: Phase 4 完成（測試與優化）
- [ ] **Milestone 5**: 專案完成（所有檢查清單通過）

---

## 🚨 風險與注意事項

1. **Android 權限問題**: 匯出功能在 Android 11+ 需要 Scoped Storage，目前已加入 `permission_handler` 處理
2. **效能瓶頸**: 日誌量大時搜尋可能變慢，已實作 `filteredLogs` getter，未來可考慮進一步優化
3. **依賴更新**: build_runner 可能需要清除快取 `--delete-conflicting-outputs`
4. **測試難度**: Stream 相關邏輯測試較複雜，需要使用 `StreamMatcher` 和 Mock 進行詳細設計

---

## 📝 更新日誌

- **2026-01-03 21:05**: Phase 2 與 Phase 3 實作完成。
  - 完成 `SidecarManageScreen` 設定頁面。
  - 增強 `SidecarLogsScreen` 搜尋、JSON 匯出與詳細視圖功能。
  - 修正了 `SidecarPreferences` 的底層 API 呼叫。
- **2026-01-03 19:15**: Phase 1 重構完成。
  - 建立 Repository 和 Use Cases，遷移 Cubit 職責。
- **2026-01-03 18:30**: 初版規劃完成。

---

_此進度追蹤文件將隨著實作進展持續更新_
