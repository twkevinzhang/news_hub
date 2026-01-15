# News Hub 重構進度追蹤表 (WORK_PROGRESS.md)

本文件紀錄重構任務的詳細進度，供 AI Agents 跨 Session 銜接使用。

## 📍 目前進度摘要

- **目前階段**: 已完成所有核心 BLoC 測試補充。
- **最近一筆變更**: 完成階段三：核心 BLoC 測試補充，補齊 41 個測試用例，共完成 5 個 BLoC 測試。
- **目前的 Context**: 已閱讀 `GEMINI.md`, `CODE_QUALITY_REPORT.md`, `REFACTORING_PLAN.md`，並查看過檔案內容。

## 📋 詳細任務狀態

### 階段一：基礎清理與修復

- [x] 修復 `analysis_options.yaml` (package:flutter_lints/flutter.yaml)
- [x] 清理測試代碼中的 Warnings (dart fix + 手動清理)
- [x] 評估 `ExpansionTileController` (確認為 Flutter 標準組件，目前維持原狀)

### 階段二：Domain Models 遷移至 Freezed

- [x] 遷移 `CollectionBoard` (包含 `BoardIdentity`)
- [x] 遷移 `Collection`
- [x] 遷移 `ExtensionMetadata` (對應檔案為 `ExtensionBoard`)
- [x] 遷移 `Extension` (包含 `RemoteExtension` 與 `ExtensionWithBoards`)
- [x] 執行 `make build` 並修正生成後的代碼引用

### Phase 3: Core BLoC Test Coverage (Completed)

補充核心 BLoC 的單元測試，提升系統穩定性與測試覆蓋率。

**Key Accomplishments:**

1.  **SearchFormCubit**: 補齊 13 個測試案例（關鍵字、建議聯動、搜尋提交）。
2.  **CollectionThreadListCubit**: 補齊 7 個測試案例（多板塊聚合、骨架屏狀態、PagedListView）。
3.  **CollectionFormCubit**: 補齊 9 個測試案例（表單驗證、名稱偵測、Sort Options 聯動）。
4.  **ExtensionCubit**: 補齊 6 個測試案例（安裝進度流監聽、狀態同步、卸載邏輯）。
5.  **CollectionCubit**: 補齊 6 個測試案例（WatchList 監聽、樂觀更新重排邏輯）。

**Verification:**

- 全域共有 94 個業務測試案例通過 (94/95 total)。
- 唯一失敗者與重構無關 (`widget_test.dart`)。

---

## Current Status

- [x] Phase 1: Infrastructure Cleanup
- [x] Phase 2: Domain Models Migration to Freezed
- [x] Phase 3: Core BLoC Test Coverage

## 🛠️ 下一步行動建議

1.  **移除過時 API**: 替換 `ExpansionTileController` 等被標記為 deprecated 的組件。
2.  **BLoC 效能優化**: 使用 `BlocSelector` 減少不必要的 Rebuild。
3.  **其餘組件測試**: 擴大測試覆蓋率至其餘 BLoC 與 Use Cases。

## 📝 備註事項

- 遷移時需注意 `freezed` 的繼承限制（子類別需獨立遷移或使用合成）。
- 遷移 Domain Models 後必須執行 `make build`。
- `widget_test.dart` 的失敗為預設模板計數器測試，與業務邏輯無關。
