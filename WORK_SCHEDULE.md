# News Hub 重構工作排程表

**建立日期**: 2026-01-14
**最後更新**: 2026-01-14
**基準計畫**: REFACTORING_PLAN_V2.md
**當前分支**: feat/ai-sidecar-task
**主分支**: master

---

## 📋 總體進度概覽

| Phase | 任務數 | 已完成 | 進行中 | 待執行 | 預估工時 | 實際工時 |
|-------|--------|--------|--------|--------|----------|----------|
| Phase 1: 架構合規性修復 | 3 | 0 | 1 | 2 | 16-24h | 0.5h |
| Phase 2: BLoC 效能優化 | 8 | 0 | 0 | 8 | 20-28h | 0h |
| Phase 3: Use Case 重構 | 3 | 0 | 0 | 3 | 11-15h | 0h |
| Phase 4: 測試基礎建設 | 4 | 0 | 0 | 4 | 26-37h | 0h |
| Phase 5: Code Quality | 6 | 0 | 0 | 6 | 12-18h | 0h |
| Phase 6: 文件與優化 | 4 | 0 | 0 | 4 | 6-10h | 0h |
| **總計** | **28** | **0** | **1** | **27** | **91-132h** | **0.5h** |

---

## 🎯 當前工作狀態

### 🔄 進行中任務

#### Task 1.1: 重命名 ExtensionPreferencesService → ExtensionSettings

**狀態**: 🟡 部分完成（95%）
**負責人**: Claude Sonnet 4.5
**開始時間**: 2026-01-14
**預估完成**: 2026-01-14

**已完成步驟**:
- ✅ 創建新文件 `lib/domain/extension/services/extension_settings.dart`
- ✅ 更新 `lib/app/extension/preferences/extension_preferences_service_impl.dart` 實現 `ExtensionSettings`
- ✅ 更新 `lib/domain/extension/interactor/list_extensions.dart` 使用 `ExtensionSettings`
- ✅ 刪除舊文件 `lib/domain/extension/services/extension_preferences_service.dart`
- ✅ 運行 `dart run build_runner build --delete-conflicting-outputs`（成功，51 個輸出文件）

**待完成步驟**:
1. ⏸️ 運行 `flutter analyze` 驗證無錯誤
2. ⏸️ 運行驗證腳本確認重構成功
3. ⏸️ 提交變更 (作者: Sonnet 4.5 <noreply@anthropic.com>)

**下一步操作**:
```bash
# Step 1: 驗證無錯誤
flutter analyze

# Step 2: 驗證腳本
test -f lib/domain/extension/services/extension_settings.dart && echo "✅ 新檔案存在" || echo "❌ 新檔案不存在"
test ! -f lib/domain/extension/services/extension_preferences_service.dart && echo "✅ 舊檔案已刪除" || echo "❌ 舊檔案仍存在"
! grep -r "ExtensionPreferencesService" lib/domain --include="*.dart" && echo "✅ 無舊命名殘留" || echo "❌ 仍有舊命名"

# Step 3: Git commit
git add .
git commit --author="Sonnet 4.5 <noreply@anthropic.com>" -m "$(cat <<'EOF'
refactor(domain): rename ExtensionPreferencesService to ExtensionSettings

Rename ExtensionPreferencesService to ExtensionSettings to follow DDD
ubiquitous language principle. "Preferences" is an infrastructure-layer
technical term, while "Settings" is business-oriented.

Changes:
- Created: lib/domain/extension/services/extension_settings.dart
- Updated: lib/app/extension/preferences/extension_preferences_service_impl.dart
- Updated: lib/domain/extension/interactor/list_extensions.dart
- Deleted: lib/domain/extension/services/extension_preferences_service.dart
- Regenerated: dependency injection code via build_runner

Follows: REFACTORING_PLAN_V2.md - Task 1.1

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
EOF
)"
```

---

## 📅 Phase 1: 架構合規性修復 (16-24h)

### ✅ 已完成任務
_無_

### 🔄 進行中任務

#### Task 1.1: 重命名 ExtensionPreferencesService → ExtensionSettings
- **狀態**: 🟡 95% 完成
- **詳見**: 當前工作狀態 → 進行中任務

### 📋 待執行任務

#### Task 1.2: 拆分 models.dart 為獨立檔案（使用 Barrel File 模式）

**優先級**: 🔴 最高
**預估工時**: 6-8 小時
**受影響檔案**: 40+ 個
**詳細規範**: 見 REFACTORING_PLAN_V2.md - Task 1.2

**執行前置條件**:
- ✅ Task 1.1 已完成並提交

**執行步驟摘要**:
1. 閱讀 `lib/domain/models/models.dart` (700+ 行)
2. 按照 Bounded Context 分類創建目錄結構
3. 將每個 model 拆分到獨立文件
4. 創建 barrel file `models.dart` 統一 export
5. 更新所有 import 語句（保持 `import 'package:news_hub/domain/models/models.dart'`）
6. 運行 `dart run build_runner build --delete-conflicting-outputs`
7. 運行 `flutter analyze` 驗證
8. 提交變更（作者: Sonnet 4.5）

**關鍵注意事項**:
- 使用 VSCode 友善的單一檔案結構
- 保持現有 import 路徑不變（透過 barrel file）
- 每個 model 一個文件，清晰的目錄層級

---

#### Task 1.3: 修復 Domain 層外部依賴違規

**優先級**: 🔴 最高
**預估工時**: 8-12 小時
**受影響檔案**: 9 個
**詳細規範**: 見 REFACTORING_PLAN_V2.md - Task 1.3

**執行前置條件**:
- ✅ Task 1.2 已完成並提交

**違規清單**:
1. `rxdart` 依賴 (6 個文件)
2. `dart:async` 依賴 (3 個文件)
3. `package:collection` 依賴 (2 個文件)
4. `flutter/widgets.dart` 依賴 (1 個文件)

**執行步驟摘要**:
1. 移除 RxDart 依賴，使用 Dart 原生 Stream API
2. 確保 `dart:async` 僅用於必要的 Future/Stream
3. 替換 `package:collection` 為 `dartx` 或自實現
4. 移除 `@visibleForTesting` 改用 Dart 原生解決方案
5. 更新所有受影響的 Use Case
6. 運行測試確保邏輯正確
7. 運行 `flutter analyze` 驗證
8. 提交變更（作者: Sonnet 4.5）

---

## 📅 Phase 2: BLoC 效能優化 (20-28h)

**執行前置條件**:
- ✅ Phase 1 所有任務已完成

### 📋 任務清單

#### Task 2.1: 優化 HomeScreen BLoC 重建
- **優先級**: 🔴 最高
- **預估工時**: 3-4 小時
- **目標**: 減少 90%+ 重建次數
- **詳見**: REFACTORING_PLAN_V2.md - Task 2.1

#### Task 2.2: 優化 SidecarLogsScreen 效能
- **優先級**: 🔴 最高
- **預估工時**: 2-3 小時
- **目標**: 維持 60 FPS
- **詳見**: REFACTORING_PLAN_V2.md - Task 2.2

#### Task 2.3: 優化 ThreadDetailScreen context.watch
- **優先級**: 🟡 高
- **預估工時**: 2-3 小時
- **詳見**: REFACTORING_PLAN_V2.md - Task 2.3

#### Task 2.4-2.8: 其他頁面 BLoC 優化
- **優先級**: 🟡 高
- **預估工時**: 13-18 小時
- **詳見**: REFACTORING_PLAN_V2.md - Task 2.4-2.8

---

## 📅 Phase 3: Use Case 重構 (11-15h)

**執行前置條件**:
- ✅ Phase 1 已完成
- 🟡 Phase 2 (Task 2.1-2.3) 建議完成

### 📋 任務清單

#### Task 3.1: 簡化 ListCollectionThreads
- **優先級**: 🟡 高
- **預估工時**: 4-6 小時
- **重點**: 保持 helper 為 public function（YAGNI 原則）
- **詳見**: REFACTORING_PLAN_V2.md - Task 3.1

#### Task 3.2: 簡化 ListExtensions
- **優先級**: 🟢 中
- **預估工時**: 3-4 小時
- **詳見**: REFACTORING_PLAN_V2.md - Task 3.2

#### Task 3.3: 簡化 SearchThreads
- **優先級**: 🟢 中
- **預估工時**: 4-5 小時
- **詳見**: REFACTORING_PLAN_V2.md - Task 3.3

---

## 📅 Phase 4: 測試基礎建設 (26-37h)

**執行前置條件**:
- ✅ Phase 1 已完成
- ✅ Phase 3 已完成

### 📋 任務清單

#### Task 4.1: 建立測試基礎設施
- **優先級**: 🔴 最高
- **預估工時**: 4-6 小時
- **詳見**: REFACTORING_PLAN_V2.md - Task 4.1

#### Task 4.2: Domain Use Case 測試
- **優先級**: 🔴 最高
- **預估工時**: 12-18 小時
- **目標**: 80%+ 覆蓋率
- **詳見**: REFACTORING_PLAN_V2.md - Task 4.2

#### Task 4.3: Presentation Cubit 測試
- **優先級**: 🟡 高
- **預估工時**: 6-8 小時
- **詳見**: REFACTORING_PLAN_V2.md - Task 4.3

#### Task 4.4: Repository 整合測試
- **優先級**: 🟡 高
- **預估工時**: 4-5 小時
- **詳見**: REFACTORING_PLAN_V2.md - Task 4.4

---

## 📅 Phase 5: Code Quality 提升 (12-18h)

**執行前置條件**:
- 🟡 Phase 1-3 建議完成

### 📋 任務清單

#### Task 5.1-5.6: State/Entity Freezed 化、Const Optimization 等
- **優先級**: 🟢 中/低
- **預估工時**: 12-18 小時
- **詳見**: REFACTORING_PLAN_V2.md - Phase 5

---

## 📅 Phase 6: 文件與長期優化 (6-10h)

**執行前置條件**:
- 🟡 Phase 1-4 建議完成

### 📋 任務清單

#### Task 6.1-6.4: 文件更新、CI/CD 整合等
- **優先級**: 🟢 中/低
- **預估工時**: 6-10 小時
- **詳見**: REFACTORING_PLAN_V2.md - Phase 6

---

## 🚀 AI Agent 執行指南

### 接手當前工作

如果你是新接手的 AI Agent，請按以下步驟操作：

#### Step 1: 檢查當前狀態
```bash
# 查看當前分支
git branch

# 查看未提交的變更
git status

# 查看最近的 commit
git log -5 --oneline
```

#### Step 2: 完成進行中的任務

目前 **Task 1.1** 進行到 95%，請執行：

```bash
# 1. 驗證無錯誤
flutter analyze

# 2. 運行驗證腳本
test -f lib/domain/extension/services/extension_settings.dart && echo "✅ 新檔案存在" || echo "❌ 新檔案不存在"
test ! -f lib/domain/extension/services/extension_preferences_service.dart && echo "✅ 舊檔案已刪除" || echo "❌ 舊檔案仍存在"
! grep -r "ExtensionPreferencesService" lib/domain --include="*.dart" && echo "✅ 無舊命名殘留" || echo "❌ 仍有舊命名"

# 3. 提交變更（如果驗證通過）
git add .
git commit --author="Sonnet 4.5 <noreply@anthropic.com>" -m "$(cat <<'EOF'
refactor(domain): rename ExtensionPreferencesService to ExtensionSettings

Rename ExtensionPreferencesService to ExtensionSettings to follow DDD
ubiquitous language principle. "Preferences" is an infrastructure-layer
technical term, while "Settings" is business-oriented.

Changes:
- Created: lib/domain/extension/services/extension_settings.dart
- Updated: lib/app/extension/preferences/extension_preferences_service_impl.dart
- Updated: lib/domain/extension/interactor/list_extensions.dart
- Deleted: lib/domain/extension/services/extension_preferences_service.dart
- Regenerated: dependency injection code via build_runner

Follows: REFACTORING_PLAN_V2.md - Task 1.1

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
EOF
)"
```

#### Step 3: 開始下一個任務

完成 Task 1.1 後，請繼續執行 **Task 1.2: 拆分 models.dart**。

詳細步驟見 `REFACTORING_PLAN_V2.md - Task 1.2`。

### 工作規範

1. **每完成一個 Task 必須**:
   - ✅ 運行 `flutter analyze` 確保 0 error
   - ✅ 運行驗證腳本確認重構成功
   - ✅ 提交 commit（作者: Sonnet 4.5）
   - ✅ 更新本文件的進度

2. **Commit Message 格式**:
   ```
   <type>(<scope>): <subject>

   <body>

   Follows: REFACTORING_PLAN_V2.md - Task X.X

   🤖 Generated with [Claude Code](https://claude.com/claude-code)

   Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
   ```

3. **遇到問題時**:
   - 記錄問題到本文件的「問題追蹤」章節
   - 不要盲目重試，參考 CLAUDE.md 的「AI 診斷與自我審計規範」
   - 必要時中斷並請求人工介入

4. **Token 管理**:
   - 優先使用 Grep/Glob 工具而非 Task agent
   - 避免重複讀取大型文件
   - 使用 `offset` 和 `limit` 參數分段讀取

---

## 📊 問題追蹤

### 🐛 當前問題
_無_

### ⚠️ 風險提示
1. **RxDart 移除複雜度**: Task 1.3 中移除 RxDart 依賴可能影響多個 Stream.combine 邏輯，需仔細測試
2. **models.dart 拆分影響範圍**: Task 1.2 將創建 40+ 個文件，需確保 barrel file 正確性
3. **測試覆蓋率基線**: 目前 Domain 層 0% 覆蓋率，Phase 4 工時可能被低估

---

## 📝 變更歷史

### 2026-01-14
- 初始建立工作排程表
- Task 1.1 進行中（95% 完成）
- 已完成：創建新文件、更新實現、刪除舊文件、運行 build_runner
- 待完成：flutter analyze、驗證、commit

---

## 📚 參考文件

- **REFACTORING_PLAN_V2.md** - 詳細重構計畫（每個 Task 的完整規範）
- **CLAUDE.md** - 專案開發規範（架構設計、效能要求、工作流程）
- **REFACTORING_PLAN.md** - 原始重構計畫（v1.0，已被 v2.0 取代）

---

**最後更新**: 2026-01-14 by Claude Sonnet 4.5
**狀態**: Task 1.1 進行中（等待 flutter analyze 和 commit）
