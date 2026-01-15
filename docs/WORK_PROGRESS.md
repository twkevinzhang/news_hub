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
| **Task 6**  | 補齊其餘 BLoC 測試 (Phase 2) | **待開始** | 包含 SearchResult, BoardsPicker 等剩餘 7 個 BLoC             |

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

---

## 🚀 接下來的路徑 (Next Steps)

1. **繼續 Task 1 (高優先級)**: 遷移 `Post` 與 `Paragraph` 體系。這涉及將繼承結構改為 Freezed 的聯集類型 (Sealed classes)，改動量大。
2. **執行 Task 6**: 補齊剩餘 BLoCs 的測試覆蓋。

## 📝 備註 (給下一個 Agent)

- 執行 `make build` 前確保 `freezed` 的繼承關係處理正確。
- 目前 `flutter analyze` 應為乾淨狀態，提交前必須維持此狀態。
- 業務測試 94/95 通過 (1 個 widget_test.dart 失敗屬預期)。
