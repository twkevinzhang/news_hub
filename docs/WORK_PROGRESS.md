# News Hub 重構進度追蹤表 (WORK_PROGRESS.md)

本文件紀錄重構任務的詳細進度，供 AI Agents 跨 Session 銜接使用。本進度表嚴格對應 [REFACTORING_PLAN.md](./REFACTORING_PLAN.md) 定義之任務。

## 📍 目前進度摘要 (對照 REFACTORING_PLAN.md)

| 任務 (Task) | 描述                         | 狀態       | 備註                                                         |
| :---------- | :--------------------------- | :--------- | :----------------------------------------------------------- |
| **Task 1**  | Domain Models 遷移至 Freezed | **已完成** | 全部遷移完畢                                                 |
| **Task 2**  | 核心 BLoC 測試 (Phase 1)     | **已完成** | 補齊 SearchForm, CollectionThreadList 等 5 個核心 Cubit 測試 |
| **Task 3**  | 移除過時 API                 | **已完成** | 替換 ExpansionTileController 並修復 0 警告                   |
| **Task 4**  | BLoC 效能優化 (Rebuilds)     | **已完成** | 優化 Home, CollectionThreadList, ThreadDetail 三大核心頁面   |
| **Task 5**  | 清理測試程式碼 Warnings      | **已完成** | 全域移除 const 缺失與 void 回傳警告                          |
| **Task 6**  | 補齊其餘 BLoC 測試 (Phase 2) | **已完成** | 包含 SearchResult, BoardsPicker 等剩餘 7 個 BLoC             |
| **Task 7**  | Collection/Repo Use Cases    | **待開始** | v2.0 新增: 補齊 Domain 層測試                                |
| **Task 8**  | Ext/Suggestion Use Cases     | **待開始** | v2.0 新增: 補齊 Domain 層測試                                |
| **Task 9**  | Thread Use Cases             | **待開始** | v2.0 新增: 核心功能測試                                      |
| **Task 10** | 效能基準測試                 | **待開始** | v2.0 新增: 建立 Rebuild 監控                                 |

---

## 📋 詳細任務狀態

### [Task 1] Domain Models 遷移至 Freezed [x]

- [x] `Collection`, `CollectionBoard`, `BoardIdentity`
- [x] `Extension`, `RemoteExtension`, `ExtensionWithBoards`, `ExtensionMetadata`
- [x] `Post`, `ArticlePost`, `SingleImagePost` (繼承重構為 Sealed class)
- [x] `Paragraph` 體系 (Sealed class 遷移)
- [x] `Bookmark`, `Board`, `Suggestion`, `HealthCheckResult`, `LogEntry`

### [Task 2] 核心 BLoC 測試 (Phase 1) [x]

- [x] **SearchFormCubit**: 搜尋建議、集合聯動邏輯測試。
- [x] **CollectionThreadListCubit**: 多板塊分頁聚合、骨架屏狀態測試。
- [x] **CollectionFormCubit**: 表單驗證與名稱偵測測試。
- [x] **ExtensionCubit**: 安裝流與狀態同步測試。
- [x] **CollectionCubit**: 列表監聽與樂觀更新測試。

### [Task 3 & 5] 基礎改進與清理 [x]

- [x] 將 `ExpansionTileController` 遷移至 `ExpansibleController` (符合 Flutter 3.31+)。
- [x] 修正 `analysis_options.yaml` 並達成 **No issues found**。
- [x] 清理 20+ 處測試檔案中的 `const` 與 `void` 警告。

### [Task 4] BLoC 效能優化 (重構核心) [x]

- [x] **HomeScreen**: 使用 `BlocSelector` 隔離 Drawer 狀態，AppBar/Body 不再無謂重建。
- [x] **CollectionThreadListScreen**: 縮小 `ListenableBuilder` 範圍，僅針對搜尋遮罩使用 `BlocSelector`。
- [x] **ThreadDetailScreen**: 對話框重構為 `BlocSelector` 並移除冗餘代碼。

### [Task 6] 補齊其餘 BLoC 測試 (Phase 2) [x]

- [x] **SearchResultCubit**: 搜尋結果分頁、排序與關鍵字測試。
- [x] **BoardsPickerCubit**: 板塊選擇器搜尋與選取邏輯。
- [x] **CollectionBoardThreadListCubit**: 單一板塊列表與狀態。
- [x] **RepoCubit**: Repository 狀態管理。
- [x] **SidecarLogsCubit**: Log 串流與過濾。
- [x] **HomeCubit** & **ThreadDetailCubit**: 檢查並補足測試覆蓋。

---

---

## 📋 v2.0 詳細任務狀態 (Domain Layer & Performance)

### [Task 7] Collection & Repo Use Cases 測試 [x]

- [x] `watch_collections.dart`
- [x] `create_collection.dart`
- [x] `delete_collection.dart`
- [x] `update_collection.dart`
- [x] `add_repo.dart`
- [x] `remove_repo.dart`

### [Task 8] Extension & Suggestion Use Cases 測試 [ ]

- [ ] `install_extension.dart`
- [ ] `uninstall_extension.dart`
- [ ] `list_remote_extensions.dart`
- [ ] `list_suggestions.dart`
- [ ] `insert_suggestion.dart`
- [ ] `delete_suggestion.dart`
- [ ] `delete_all_suggestions.dart`
- [ ] `update_suggestion_latest_used_at.dart`

### [Task 9] Thread Use Cases 測試 (核心) [ ]

- [ ] `list_collection_threads.dart` (重點)
- [ ] `search_threads.dart`

### [Task 10] 效能基準測試 [ ]

- [ ] 建立 Widget Rebuild 監控測試

---

## 🚀 接下來的路徑 (Next Steps)

1. **執行 Task 7**: 補齊 Collection/Repo 相關 Use Cases 的測試。
2. **執行 Task 8**: 補齊 Extension/Suggestion 相關測試。

## 📝 備註 (給下一個 Agent)

- 執行 `make build` 前確保 `freezed` 的繼承關係處理正確。
- 目前 `flutter analyze` 應為乾淨狀態，提交前必須維持此狀態。
- 業務測試全數通過 (已移除無用的 widget_test.dart)。
