# News Hub 重構進度追蹤表 (WORK_PROGRESS.md)

本文件紀錄重構任務的詳細進度，供 AI Agents 跨 Session 銜接使用。

## 📍 目前進度摘要

- **目前階段**: 階段三：核心 BLoC 測試補充 (目標 80%+)
- **最近一筆變更**: 完成階段二：Domain Models 遷移至 Freezed。所有核心 Model 已遷移。
- **目前的 Context**: 已閱讀 `GEMINI.md`, `CODE_QUALITY_REPORT.md`, `REFACTORING_PLAN.md`。

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

### 階段三：核心 BLoC 測試補充 (目標 80%+)

- [ ] `SearchFormCubit`
- [ ] `CollectionThreadListCubit`
- [ ] `CollectionFormCubit`
- [ ] `ExtensionCubit`
- [ ] `CollectionCubit`

## 🛠️ 下一步行動建議

1. 開始 Task 2 - Phase 1：為 `SearchFormCubit` 撰寫單元測試。
2. 確保 BLoC 測試涵蓋 Initial, Loading, Success, Error 各種狀態。

## 📝 備註事項

- 遷移時需注意 `freezed` 的繼承限制（子類別需獨立遷移或使用合成）。
- 遷移 Domain Models 後必須執行 `make build`。
- `widget_test.dart` 的失敗為預設模板計數器測試，與業務邏輯無關。
