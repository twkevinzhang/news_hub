# News Hub 重構計劃 v2.0 (AI Agents 專用)

**文件版本**: 2.0
**建立日期**: 2026-01-16
**上一版本完成度**: 100% (包含 Domain Models Freezed 遷移、所有 Cubit 測試覆蓋)
**適用對象**: AI Development Agents

---

## 📋 總覽

鑒於 `REFACTORING_PLAN.md` v1.0 的任務已全數完成，本計劃 (v2.0) 旨在解決剩餘的程式碼品質缺口，特別是 **Domain Layer Use Cases 測試覆蓋率** 以及 **效能基準測試**。

### 🎯 v2.0 重構目標

| 目標項目              | 當前狀態                     | 目標狀態              | 優先級 |
| --------------------- | ---------------------------- | --------------------- | ------ |
| Domain Use Cases 測試 | ~60% 覆蓋 (缺 15+ Use Cases) | 100% 覆蓋             | 🔴 高  |
| 效能基準測試          | 無自動化監測                 | 建立 Rebuild 監控測試 | 🟡 中  |

---

## 🗺️ 任務總覽

### 階段一：Domain Layer 完整測試 (高優先級)

- **Task 7**: 補齊 Collection 與 Repo 相關 Use Cases 測試
- **Task 8**: 補齊 Extension 與 Suggestion 相關 Use Cases 測試
- **Task 9**: 補齊 Thread 相關 Use Cases 測試 (含 `ListCollectionThreads`)

### 階段二：效能監控 (中優先級)

- **Task 10**: 建立 Widget Rebuild 效能監控測試

---

## 📝 詳細任務規格

### Task 7: Collection & Repo Use Cases 測試

**目標**: 為以下 Use Cases 建立單元測試 (`test/domain/...`)。

**Scope**:

1. `watch_collections.dart`
2. `create_collection.dart`
3. `delete_collection.dart`
4. `update_collection.dart`
5. `add_repo.dart`
6. `remove_repo.dart`

**驗收標準**:

- 每個檔案對應一個 `_test.dart`
- Mock Repository 依賴
- 測試成功與失敗情境

---

### Task 8: Extension & Suggestion Use Cases 測試

**目標**: 為擴充功能與搜尋建議相關互動器建立測試。

**Scope**:

1. `install_extension.dart`
2. `uninstall_extension.dart`
3. `list_remote_extensions.dart`
4. `list_suggestions.dart`
5. `insert_suggestion.dart`
6. `delete_suggestion.dart`
7. `delete_all_suggestions.dart`
8. `update_suggestion_latest_used_at.dart`

---

### Task 9: Thread Use Cases 測試 (核心)

**目標**: 確保核心閱讀功能的邏輯正確性，特別是複雜的聚合邏輯。

**Scope**:

1. **`list_collection_threads.dart`** (非常重要，聚合多個 Board 的邏輯)
2. `search_threads.dart`

**特別注意**: `ListCollectionThreads` 涉及 Stream 合併與並行處理，測試需驗證 Stream 的發送順序與並發行為。

---

### Task 10: 效能基準測試

**目標**: 建立機制防止未來開發造成不必要的 Rebuilds。

**實作建議**:

- 使用 `flutter_test` 配合 `addTearDown` 檢查 rebuild 次數。
- 針對 `Home`, `ThreadList`, `ThreadDetail` 三大熱點頁面建立基準。
