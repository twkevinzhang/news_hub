# News Hub 重構計畫 v2.0 📋

**建立日期**: 2026-01-14
**更新日期**: 2026-01-14
**分析範圍**: Dart 程式碼架構、DDD 規範、BLoC 效能優化
**基準文件**: CLAUDE.md - 架構設計規範、效能與品質要求
**文件性質**: Spec-Driven Development - 適用於 AI Agent 執行

---

## 📖 閱讀指南

### 文件結構

本計畫採用 **Spec-Driven Development** 方法論，每個任務包含：

1. **問題描述** - 當前問題和影響範圍
2. **解決方案** - 具體的重構方案（含 Before/After 程式碼）
3. **執行步驟** - 逐步驟的操作指令
4. **驗收標準** - 明確的完成檢查清單
5. **驗證方法** - 如何驗證重構成功

### 符號說明

- 🔴 **最高優先級** - 必須立即執行
- 🟡 **高優先級** - 重要但可稍後執行
- 🟢 **中/低優先級** - 可依據資源狀況執行
- ⭐ **複雜任務** - 需要額外注意和測試
- ✅ **驗收項目** - 必須通過的檢查點

---

## 📊 執行摘要

經過深入程式碼審查，發現 News Hub 專案存在以下主要問題：

### 🔴 嚴重問題

1. **Domain 層依賴違規** (9 項)
2. **BLoC 整頁重建問題** (8 個頁面)
3. **測試覆蓋率嚴重不足** (Domain 層 0%)

### 🟡 重要問題

4. **Use Case 違反單一職責** (3 個 Use Case)
5. **State 粒度設計過粗** (2 個 State)
6. **缺少 const constructor 優化**

### 評分

- **架構合規性**: 45/100 ❌
- **效能優化**: 30/100 ❌
- **測試覆蓋率**: 5/100 ❌
- **整體評估**: **不符合 CLAUDE.md 規範，需要大規模重構**

---

## 🎯 重構目標

### 短期目標 (1-2 週)

- [ ] 修復所有 Domain 層依賴違規
- [ ] 優化 3 個關鍵頁面的 BLoC 重建 (HomeScreen, ThreadDetailScreen, SidecarLogsScreen)
- [ ] 建立 Domain 層測試框架，覆蓋率達 50%+

### 中期目標 (3-4 週)

- [ ] 重構複雜 Use Case，符合單一職責原則
- [ ] 優化所有頁面的 BLoC 重建，達成 80%+ 減少率
- [ ] Domain 層測試覆蓋率達 80%+

### 長期目標 (1-2 個月)

- [ ] 完整 Entity/Value Object freezed 化
- [ ] Presentation 層關鍵功能測試覆蓋率達 60%+
- [ ] 靜態分析 0 warning (目前 57 issues)

---

## 📑 重構任務清單

### Phase 1: 架構合規性修復 (Critical) 🔥

---

#### Task 1.1: 重命名 ExtensionPreferencesService 為業務導向名稱

**優先級**: 🔴 最高
**預估工時**: 1.5 小時
**受影響檔案**: 3-5 個

##### 問題描述

**當前狀況**:

```
檔案: lib/domain/extension/services/extension_preferences_service.dart
```

**問題**:

1. 檔案名稱包含技術術語 "Preferences"（這是基礎設施層的概念）
2. 違反 DDD 原則：Domain 層應使用業務語言（Ubiquitous Language）
3. 依賴了 `app/service/preferences/preference.dart`，違反依賴倒置原則

**影響**:

- 違反 CLAUDE.md 的 Domain 層依賴限制
- Domain 層不應該知道 "Preferences" 這種技術實現細節

##### 解決方案

**方案選擇**: 重命名為 `ExtensionSettings`

**理由**:

- "Settings" 是業務概念，表達「使用者對擴展的設定」
- 不涉及技術實現細節
- 符合 Ubiquitous Language 原則

##### Before (當前狀態)

```dart
// lib/domain/extension/services/extension_preferences_service.dart
import 'package:news_hub/app/service/preferences/preference.dart';  // ❌ 依賴 app 層

abstract class ExtensionPreferencesService {
  // ...
}
```

##### After (重構後)

```dart
// lib/domain/extension/services/extension_settings.dart
// 不再依賴 app 層

abstract class ExtensionSettings {
  /// 儲存擴展的啟用狀態
  Future<void> saveEnabledState(String extensionId, bool isEnabled);

  /// 檢查擴展是否已啟用
  Future<bool> isEnabled(String extensionId);

  /// 監聽已啟用的擴展集合
  Stream<Set<String>> watchEnabledExtensions();
}
```

##### 執行步驟

**步驟 1.1.1**: 創建新檔案並定義介面 (15 分鐘)

1. 在 VSCode 中開啟專案根目錄
2. 創建新檔案：`lib/domain/extension/services/extension_settings.dart`
3. 複製以下程式碼到新檔案：

```dart
/// Extension Settings Service
///
/// 管理使用者對擴展的設定，包括啟用/停用狀態、使用者偏好等。
///
/// 這是 Domain 層的服務介面，不包含任何技術實現細節。
/// 具體實現由 App 層的 ExtensionSettingsImpl 提供。
abstract class ExtensionSettings {
  /// 儲存指定擴展的啟用狀態
  ///
  /// [extensionId] 擴展的唯一識別碼（pkg_name）
  /// [isEnabled] true 表示啟用，false 表示停用
  Future<void> saveEnabledState(String extensionId, bool isEnabled);

  /// 檢查指定擴展是否已啟用
  ///
  /// [extensionId] 擴展的唯一識別碼（pkg_name）
  ///
  /// Returns: true 表示已啟用，false 表示未啟用或不存在
  Future<bool> isEnabled(String extensionId);

  /// 監聽已啟用的擴展集合變化
  ///
  /// Returns: Stream，每次啟用狀態變化時發出新的擴展 ID 集合
  Stream<Set<String>> watchEnabledExtensions();
}
```

4. 儲存檔案
5. 驗證語法：運行 `dart analyze lib/domain/extension/services/extension_settings.dart`

**預期輸出**: 無錯誤、無警告

---

**步驟 1.1.2**: 更新 App 層實現 (30 分鐘)

1. 找到原本的實現檔案（通常在 `lib/app/extension/` 目錄下）
2. 將實現類別重命名：

```dart
// Before
class ExtensionPreferencesServiceImpl implements ExtensionPreferencesService {
  // ...
}

// After
class ExtensionSettingsImpl implements ExtensionSettings {
  // 實現保持不變，只是介面名稱改變
}
```

3. 更新 import 語句：

```dart
// Before
import 'package:news_hub/domain/extension/services/extension_preferences_service.dart';

// After
import 'package:news_hub/domain/extension/services/extension_settings.dart';
```

4. 儲存檔案

---

**步驟 1.1.3**: 更新所有使用處 (30 分鐘)

1. 使用 VSCode 全域搜尋：`ExtensionPreferencesService`
2. 對每個搜尋結果：
   - 將類型名稱改為 `ExtensionSettings`
   - 更新 import 路徑
   - 更新變數名稱（可選，但建議同步更新）

示例：

```dart
// Before
final ExtensionPreferencesService _preferencesService;

// After
final ExtensionSettings _settings;
```

3. 使用 VSCode 全域搜尋：`extension_preferences_service`（檔案路徑）
4. 更新所有 import 語句

---

**步驟 1.1.4**: 刪除舊檔案並更新 DI 配置 (15 分鐘)

1. 刪除舊檔案：`lib/domain/extension/services/extension_preferences_service.dart`
2. 如果有自動生成的檔案（如 `.g.dart`, `.freezed.dart`），一併刪除
3. 更新 `lib/locator.dart` 或 DI 配置：

```dart
// Before (如果有明確註冊)
@Injectable(as: ExtensionPreferencesService)
class ExtensionPreferencesServiceImpl implements ExtensionPreferencesService { }

// After
@Injectable(as: ExtensionSettings)
class ExtensionSettingsImpl implements ExtensionSettings { }
```

4. 運行 `dart run build_runner build --delete-conflicting-outputs`

---

**步驟 1.1.5**: 運行測試和驗證 (15 分鐘)

1. 編譯檢查：

   ```bash
   flutter analyze
   ```

2. 如果有相關測試，運行測試：

   ```bash
   flutter test test/domain/extension/
   ```

3. 手動測試（如果沒有自動化測試）：
   - 啟動應用
   - 導航至擴展管理頁面
   - 啟用/停用一個擴展
   - 驗證設定被正確儲存
   - 重啟應用，驗證設定被正確載入

##### 驗收標準

**必須全部通過** ✅：

- [ ] ✅ 新檔案 `extension_settings.dart` 已創建，包含完整介面定義
- [ ] ✅ 舊檔案 `extension_preferences_service.dart` 已刪除
- [ ] ✅ 所有 import 語句已更新為新路徑
- [ ] ✅ App 層實現類別已更新為 `ExtensionSettingsImpl`
- [ ] ✅ DI 配置已更新（如適用）
- [ ] ✅ `flutter analyze` 零錯誤、零新增警告
- [ ] ✅ 所有現有測試通過（如有）
- [ ] ✅ 手動功能測試通過：啟用/停用擴展功能正常

**禁止出現** ❌：

- [ ] ❌ Domain 層仍有任何對 `app/service/preferences` 的 import
- [ ] ❌ 任何檔案仍包含 `ExtensionPreferencesService` 命名
- [ ] ❌ 編譯錯誤或新的警告

##### 驗證方法

**自動化驗證**:

```bash
# 1. 檢查新檔案存在
test -f lib/domain/extension/services/extension_settings.dart && echo "✅ 新檔案存在" || echo "❌ 新檔案不存在"

# 2. 檢查舊檔案已刪除
test ! -f lib/domain/extension/services/extension_preferences_service.dart && echo "✅ 舊檔案已刪除" || echo "❌ 舊檔案仍存在"

# 3. 檢查沒有殘留的舊命名
! grep -r "ExtensionPreferencesService" lib/domain --include="*.dart" && echo "✅ 無舊命名殘留" || echo "❌ 仍有舊命名"

# 4. 檢查沒有對 app 層的依賴
! grep -r "app/service/preferences" lib/domain --include="*.dart" && echo "✅ 無 app 層依賴" || echo "❌ 仍有 app 層依賴"

# 5. 靜態分析
flutter analyze
```

**手動驗證**:

1. 在 VSCode 中開啟 `lib/domain/extension/services/extension_settings.dart`
2. 確認檔案內容符合 After 範例
3. 使用 VSCode 的 "Find All References" 功能檢查所有引用
4. 確認所有引用都使用新名稱 `ExtensionSettings`

##### 注意事項

⚠️ **重要**:

- 這是**重命名 + 重新設計介面**，不只是檔案重命名
- 如果原本的 `ExtensionPreferencesService` 有依賴 `Preference<T>` 類型，需要在 Task 1.2 中處理
- 確保所有 git commit 都包含有意義的訊息

📝 **建議的 Commit Message**:

```
refactor(domain): rename ExtensionPreferencesService to ExtensionSettings

- Remove technical term "Preferences" from Domain layer
- Use business-oriented term "Settings" instead
- Eliminate dependency on app/service/preferences
- Align with DDD Ubiquitous Language principle

BREAKING CHANGE: ExtensionPreferencesService renamed to ExtensionSettings
All consumers must update their imports and type references.

Ref: REFACTORING_PLAN.md Task 1.1
```

---

#### Task 1.2: 拆分 models.dart 為獨立檔案

**優先級**: 🟡 高
**預估工時**: 6-8 小時
**受影響檔案**: 1 個主檔案 → 40+ 個獨立檔案

##### 問題描述

**當前狀況**:

```
檔案: lib/domain/models/models.dart (估計 500+ 行)
```

**問題**:

1. **VSCode IDE 支援不佳**: "Go to Definition" 跳轉到單一大檔案，需要手動搜尋
2. **單一檔案過於複雜**: 包含 40+ 個類別定義
3. **Code Review 困難**: 無法精確討論單一 Entity 的變更
4. **Git Merge Conflict**: 多人同時修改容易衝突
5. **違反 SRP**: 一個檔案包含過多職責

**影響**:

- 開發效率降低（特別是 VSCode 用戶）
- 可維護性差
- 團隊協作困難

##### 解決方案

**方案**: 將 `models.dart` 拆分為獨立檔案，按 Bounded Context 組織

**設計原則**:

- 每個 Entity 一個檔案
- 按業務領域分組（collection, thread, extension 等）
- 保留 `models.dart` 作為 Barrel File（統一 export）
- 使用者仍可用 `import 'package:news_hub/domain/models/models.dart';` 一次導入所有 models

##### Before (當前結構)

```
lib/domain/models/
└── models.dart  (500+ 行，包含所有 Entity)
```

##### After (重構後結構)

```
lib/domain/models/
├── models.dart                          # Barrel file (統一 export，100 行)
├── common/
│   ├── pagination.dart                  # Pagination Entity
│   ├── result.dart                      # Result<T> Entity
│   └── health_check_result.dart         # HealthCheckResult Entity
├── sidecar/
│   └── log_entry.dart                   # LogEntry Entity
├── repo/
│   └── repo.dart                        # Repo Entity
├── extension/
│   ├── extension.dart                   # Extension Entity
│   ├── remote_extension.dart            # RemoteExtension Entity
│   └── extension_with_boards.dart       # ExtensionWithBoards (從 Use Case 移過來)
├── collection/
│   ├── collection.dart                  # Collection Entity
│   ├── collection_board.dart            # CollectionBoard Entity
│   └── board_identity.dart              # BoardIdentity Value Object
├── thread/
│   ├── post/
│   │   ├── post.dart                    # Post base class
│   │   ├── single_image_post.dart       # SingleImagePost Entity
│   │   ├── article_post.dart            # ArticlePost Entity
│   │   └── single_image_post_with_extension.dart  # (從 Use Case 移過來)
│   ├── paragraph/
│   │   ├── paragraph.dart               # Paragraph base class
│   │   ├── text_paragraph.dart          # TextParagraph
│   │   ├── image_paragraph.dart         # ImageParagraph
│   │   ├── video_paragraph.dart         # VideoParagraph
│   │   └── youtube_paragraph.dart       # YouTubeParagraph
│   ├── comment.dart                     # Comment Entity
│   └── board_data_chunk.dart            # BoardDataChunk (從 Use Case 移過來)
├── board/
│   └── board.dart                       # Board Entity
├── bookmark/
│   └── bookmark.dart                    # Bookmark Entity
└── suggestion/
    └── suggestion.dart                  # Suggestion Entity
```

##### 執行步驟

**步驟 1.2.1**: 創建目錄結構 (10 分鐘)

執行以下命令：

```bash
# 在專案根目錄執行
cd /Users/zhangzhenlong/Projects/news_hub

# 創建目錄結構
mkdir -p lib/domain/models/common
mkdir -p lib/domain/models/sidecar
mkdir -p lib/domain/models/repo
mkdir -p lib/domain/models/extension
mkdir -p lib/domain/models/collection
mkdir -p lib/domain/models/thread/post
mkdir -p lib/domain/models/thread/paragraph
mkdir -p lib/domain/models/board
mkdir -p lib/domain/models/bookmark
mkdir -p lib/domain/models/suggestion

# 驗證目錄創建成功
ls -la lib/domain/models/
```

**預期輸出**: 顯示所有新創建的目錄

---

**步驟 1.2.2**: 提取 Entity 到獨立檔案 (3-4 小時)

**重要**: 按以下順序執行，從簡單到複雜

**2.2.1 - 提取 Common 相關 Entity** (30 分鐘)

1. 創建 `lib/domain/models/common/pagination.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    required int pageSize,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
```

2. 創建 `lib/domain/models/common/result.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.error(String message) = Error<T>;
  const factory Result.loading() = Loading<T>;
}
```

3. 創建 `lib/domain/models/common/health_check_result.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_check_result.freezed.dart';
part 'health_check_result.g.dart';

@freezed
class HealthCheckResult with _$HealthCheckResult {
  const factory HealthCheckResult({
    required bool isHealthy,
    String? message,
  }) = _HealthCheckResult;

  factory HealthCheckResult.fromJson(Map<String, dynamic> json) =>
      _$HealthCheckResultFromJson(json);
}
```

**驗證**:

```bash
dart analyze lib/domain/models/common/
```

---

**2.2.2 - 提取其他簡單 Entity** (1 小時)

按照相同模式提取：

- `lib/domain/models/sidecar/log_entry.dart`
- `lib/domain/models/repo/repo.dart`
- `lib/domain/models/bookmark/bookmark.dart`
- `lib/domain/models/suggestion/suggestion.dart`
- `lib/domain/models/board/board.dart`

**範例**: `lib/domain/models/sidecar/log_entry.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entry.freezed.dart';
part 'log_entry.g.dart';

enum LogLevel { debug, info, warning, error, critical }

@freezed
class LogEntry with _$LogEntry {
  const factory LogEntry({
    required DateTime timestamp,
    required LogLevel level,
    required String loggerName,
    required String message,
    String? exception,
  }) = _LogEntry;

  factory LogEntry.fromJson(Map<String, dynamic> json) =>
      _$LogEntryFromJson(json);
}
```

---

**2.2.3 - 提取 Extension 相關 Entity** (30 分鐘)

提取：

- `lib/domain/models/extension/extension.dart`
- `lib/domain/models/extension/remote_extension.dart`
- `lib/domain/models/extension/extension_with_boards.dart` （從 Use Case 移過來）

**重要**: `RemoteExtension` 繼承自 `Extension`，需要處理繼承關係：

```dart
// lib/domain/models/extension/extension.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'extension.freezed.dart';
part 'extension.g.dart';

@freezed
class Extension with _$Extension {
  const factory Extension({
    required String pkgName,
    required String displayName,
    required int version,
    required int pythonVersion,
    required bool isNsfw,
  }) = _Extension;

  factory Extension.fromJson(Map<String, dynamic> json) =>
      _$ExtensionFromJson(json);
}
```

```dart
// lib/domain/models/extension/remote_extension.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'extension.dart';

part 'remote_extension.freezed.dart';
part 'remote_extension.g.dart';

@freezed
class RemoteExtension with _$RemoteExtension {
  const factory RemoteExtension({
    required String pkgName,
    required String displayName,
    required int version,
    required int pythonVersion,
    required bool isNsfw,
    required String repoUrl,
    required bool isDeprecated,
  }) = _RemoteExtension;

  factory RemoteExtension.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtensionFromJson(json);

  // 轉換為 Extension
  Extension toExtension() {
    return Extension(
      pkgName: pkgName,
      displayName: displayName,
      version: version,
      pythonVersion: pythonVersion,
      isNsfw: isNsfw,
    );
  }
}
```

---

**2.2.4 - 提取 Collection 相關 Entity** (30 分鐘)

提取：

- `lib/domain/models/collection/board_identity.dart` （Value Object）
- `lib/domain/models/collection/collection_board.dart`
- `lib/domain/models/collection/collection.dart`

**注意順序**: 先提取 `BoardIdentity`，因為 `CollectionBoard` 依賴它

```dart
// lib/domain/models/collection/board_identity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_identity.freezed.dart';
part 'board_identity.g.dart';

@freezed
class BoardIdentity with _$BoardIdentity {
  const factory BoardIdentity({
    required String extensionPkgName,
    required String boardId,
    required String boardName,
  }) = _BoardIdentity;

  factory BoardIdentity.fromJson(Map<String, dynamic> json) =>
      _$BoardIdentityFromJson(json);
}
```

---

**2.2.5 - 提取 Thread 相關 Entity** (1.5-2 小時) ⭐ **最複雜**

這部分最複雜，因為有繼承關係和大量子類別。

**提取順序**:

1. **Base classes 先行**:

   - `lib/domain/models/thread/paragraph/paragraph.dart` (base)
   - `lib/domain/models/thread/post/post.dart` (base)

2. **Paragraph 子類別**:

   - `text_paragraph.dart`
   - `image_paragraph.dart`
   - `video_paragraph.dart`
   - `youtube_paragraph.dart`

3. **Post 子類別**:

   - `single_image_post.dart`
   - `article_post.dart`
   - `single_image_post_with_extension.dart`

4. **其他**:
   - `comment.dart`
   - `board_data_chunk.dart`

**範例**: `lib/domain/models/thread/paragraph/paragraph.dart`:

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paragraph.freezed.dart';
part 'paragraph.g.dart';

@Freezed(unionKey: 'type')
sealed class Paragraph with _$Paragraph {
  const factory Paragraph.text({
    required String content,
  }) = TextParagraph;

  const factory Paragraph.image({
    required String url,
    String? thumbnail,
    String? description,
  }) = ImageParagraph;

  const factory Paragraph.video({
    required String url,
    String? thumbnail,
    String? title,
  }) = VideoParagraph;

  const factory Paragraph.youtube({
    required String url,
    required String videoId,
    String? thumbnail,
  }) = YouTubeParagraph;

  factory Paragraph.fromJson(Map<String, dynamic> json) =>
      _$ParagraphFromJson(json);
}
```

**重要**: 如果原本的設計是每個 Paragraph 子類別獨立定義，需要改為 freezed 的 union type（如上範例），或保持獨立定義但統一繼承自 base class。

---

**步驟 1.2.3**: 創建 Barrel File (30 分鐘)

創建 `lib/domain/models/models.dart`:

```dart
// lib/domain/models/models.dart
//
// Barrel file for all domain models
//
// This file re-exports all models for convenient imports.
// You can import all models with: import 'package:news_hub/domain/models/models.dart';
// Or import specific models with: import 'package:news_hub/domain/models/thread/post/single_image_post.dart';

// Common
export 'common/pagination.dart';
export 'common/result.dart';
export 'common/health_check_result.dart';

// Sidecar
export 'sidecar/log_entry.dart';

// Repo
export 'repo/repo.dart';

// Extension
export 'extension/extension.dart';
export 'extension/remote_extension.dart';
export 'extension/extension_with_boards.dart';

// Collection
export 'collection/board_identity.dart';
export 'collection/collection_board.dart';
export 'collection/collection.dart';

// Thread - Paragraph
export 'thread/paragraph/paragraph.dart';
// 如果 paragraph 是獨立檔案，也要 export：
// export 'thread/paragraph/text_paragraph.dart';
// export 'thread/paragraph/image_paragraph.dart';
// export 'thread/paragraph/video_paragraph.dart';
// export 'thread/paragraph/youtube_paragraph.dart';

// Thread - Post
export 'thread/post/post.dart';
export 'thread/post/single_image_post.dart';
export 'thread/post/article_post.dart';
export 'thread/post/single_image_post_with_extension.dart';

// Thread - Other
export 'thread/comment.dart';
export 'thread/board_data_chunk.dart';

// Board
export 'board/board.dart';

// Bookmark
export 'bookmark/bookmark.dart';

// Suggestion
export 'suggestion/suggestion.dart';
```

---

**步驟 1.2.4**: 從 Use Case 檔案中移除 Entity 定義 (1 小時)

需要處理的檔案：

1. `lib/domain/thread/interactor/get_original_post.dart` → 移除 `ArticlePostWithExtension`
2. `lib/domain/extension/interactor/list_installed_extensions.dart` → 移除 `ExtensionWithBoards`
3. `lib/domain/extension/interactor/list_extensions.dart` → 移除 `Extensions`
4. `lib/domain/thread/interactor/list_collection_threads.dart` → 移除 `BoardDataChunk`

**範例**: `get_original_post.dart`:

```dart
// Before (錯誤 ❌)
@injectable
class GetOriginalPost {
  // ... Use Case 邏輯

  // ❌ Entity 定義在 Use Case 檔案中
  class ArticlePostWithExtension {
    final ArticlePost post;
    final Extension extension;
    final Board board;
    // ...
  }
}

// After (正確 ✅)
import 'package:news_hub/domain/models/models.dart';  // 從 models 導入
// 或
import 'package:news_hub/domain/models/thread/post/article_post_with_extension.dart';  // 直接導入

@injectable
class GetOriginalPost {
  // ... Use Case 邏輯
  // Entity 定義已移至 lib/domain/models/thread/post/article_post_with_extension.dart
}
```

---

**步驟 1.2.5**: 運行代碼生成 (15 分鐘)

```bash
# 清理舊的生成檔案
find lib/domain/models -name "*.g.dart" -delete
find lib/domain/models -name "*.freezed.dart" -delete

# 重新生成
dart run build_runner build --delete-conflicting-outputs

# 如果出現錯誤，查看錯誤訊息並修正
# 常見錯誤：循環依賴、缺少 import、freezed 註解錯誤
```

---

**步驟 1.2.6**: 更新所有 import 語句 (1-1.5 小時)

**策略**: 保持使用 Barrel File，不需要逐一更新

大部分檔案已經使用：

```dart
import 'package:news_hub/domain/models/models.dart';
```

這些檔案**不需要修改**，因為 Barrel File 會 re-export 所有 models。

**需要檢查的情況**:

1. 如果有檔案直接 import 舊的 models.dart 內部定義（應該沒有）
2. 如果有檔案 import Use Case 檔案來使用其中的 Entity（需要改為 import models）

**驗證方法**:

```bash
# 搜尋是否有直接 import Use Case 來使用 Entity 的情況
grep -r "import.*interactor.*" lib/presentation --include="*.dart" | grep -v "cubit\|bloc"
```

---

**步驟 1.2.7**: 驗證和測試 (30 分鐘)

1. **編譯檢查**:

   ```bash
   flutter analyze
   ```

2. **運行測試**:

   ```bash
   flutter test
   ```

3. **手動測試**:

   - 啟動應用
   - 測試所有主要功能流程
   - 確認沒有 runtime 錯誤

4. **VSCode 驗證**:
   - 隨機選擇 5-10 個 Model
   - 使用 Cmd+Click (Mac) 或 Ctrl+Click (Windows) 點擊型別名稱
   - 驗證能正確跳轉到對應的獨立檔案（而非 models.dart）

##### 驗收標準

**必須全部通過** ✅：

- [ ] ✅ 所有 Entity 已提取到獨立檔案
- [ ] ✅ 檔案結構符合 After 範例的目錄結構
- [ ] ✅ `models.dart` 已轉換為 Barrel File，包含所有 export
- [ ] ✅ 所有 Use Case 檔案中的 Entity 定義已移除
- [ ] ✅ `dart run build_runner build` 成功執行，無錯誤
- [ ] ✅ `flutter analyze` 零錯誤、零新增警告
- [ ] ✅ 所有現有測試通過
- [ ] ✅ VSCode "Go to Definition" 能正確跳轉到獨立檔案
- [ ] ✅ 應用能正常啟動和運行

**禁止出現** ❌：

- [ ] ❌ Use Case 檔案中仍有 class 定義（除了 Use Case 本身）
- [ ] ❌ 任何 Entity 定義在非 `models/` 目錄下
- [ ] ❌ Barrel File 缺少任何 Entity 的 export
- [ ] ❌ 編譯錯誤或新的警告

##### 驗證方法

**自動化驗證**:

```bash
# 1. 檢查目錄結構
test -d lib/domain/models/common && echo "✅ common 目錄存在" || echo "❌ 缺少目錄"
test -d lib/domain/models/thread/post && echo "✅ thread/post 目錄存在" || echo "❌ 缺少目錄"
test -d lib/domain/models/thread/paragraph && echo "✅ thread/paragraph 目錄存在" || echo "❌ 缺少目錄"

# 2. 檢查關鍵檔案存在
test -f lib/domain/models/models.dart && echo "✅ Barrel file 存在" || echo "❌ 缺少 Barrel file"
test -f lib/domain/models/thread/post/single_image_post.dart && echo "✅ SingleImagePost 檔案存在" || echo "❌ 缺少檔案"

# 3. 檢查 Use Case 中無 class 定義（除了 Use Case 本身）
! grep -A 5 "^class [^}]*{$" lib/domain/*/interactor/*.dart | grep -v "UseCase\|Interactor" && echo "✅ Use Case 無額外 class" || echo "❌ 仍有額外 class"

# 4. 靜態分析
flutter analyze

# 5. 測試
flutter test
```

**手動驗證 - VSCode 測試**:

1. 打開任一 Presentation 層檔案（如 `home_screen.dart`）
2. 找到一個 Model 使用（如 `Collection`）
3. Cmd+Click (Mac) 點擊 `Collection` 型別
4. **預期行為**: 跳轉到 `lib/domain/models/collection/collection.dart` ✅
5. **錯誤行為**: 跳轉到 `lib/domain/models/models.dart` 且需要手動搜尋 ❌

重複測試 5-10 個不同的 Model。

##### 注意事項

⚠️ **重要**:

1. **Freezed 繼承問題**:

   - Freezed 不支援傳統繼承，使用 Union Types 代替
   - 如 `Paragraph` 應該是 sealed class with union types
   - 參考 [Freezed Union Types](https://pub.dev/packages/freezed#union-types-and-sealed-classes)

2. **循環依賴風險**:

   - `SingleImagePostWithExtension` 依賴 `SingleImagePost`, `Extension`, `Board`
   - 確保 import 順序正確，避免循環依賴

3. **Git Commit 策略**:

   - 建議分多個 commit：
     - Commit 1: 創建目錄結構
     - Commit 2: 提取 common models
     - Commit 3: 提取 extension models
     - Commit 4: 提取 collection models
     - Commit 5: 提取 thread models (最複雜)
     - Commit 6: 創建 Barrel File
     - Commit 7: 移除 Use Case 中的 Entity 定義

4. **建議使用 Git Branch**:
   ```bash
   git checkout -b refactor/split-models-file
   ```

📝 **建議的最終 Commit Message**:

```
refactor(domain): split models.dart into individual files

- Create organized directory structure by bounded context
- Extract all 40+ entities into separate files
- Create barrel file (models.dart) for convenient imports
- Remove entity definitions from Use Case files
- Improve VSCode IDE support (Go to Definition)
- Reduce single file complexity for better maintainability

Changes:
- lib/domain/models/models.dart: 500+ lines → 100 lines (barrel file)
- lib/domain/models/common/: +3 files (pagination, result, health_check)
- lib/domain/models/thread/: +10 files (post, paragraph, comment, etc.)
- lib/domain/models/extension/: +3 files
- lib/domain/models/collection/: +3 files
- lib/domain/models/board/: +1 file
- lib/domain/models/bookmark/: +1 file
- lib/domain/models/suggestion/: +1 file
- lib/domain/models/sidecar/: +1 file
- lib/domain/models/repo/: +1 file

Benefits:
- Better IDE support for VSCode users
- Easier code reviews (per-entity changes)
- Reduced git merge conflicts
- Clearer Single Responsibility Principle
- Faster file navigation

Ref: REFACTORING_PLAN.md Task 1.2
```

---

#### Task 1.3: 移除其他 Domain 層依賴違規

**優先級**: 🔴 最高
**預估工時**: 4-5 小時
**受影響檔案**: 7 個

##### 問題描述

Domain 層仍有以下依賴違規：

1. ❌ `flutter/widgets.dart` (未使用)
2. ❌ `rxdart` (技術實現細節)
3. ❌ `async` (技術實現細節)
4. ❌ `collection` (可用 dartx 替代)

這些違反 CLAUDE.md 規定的「Domain 層只允許依賴：get_it, injectable, dartx, freezed, json_annotation, flutter/foundation.dart」

##### 子任務清單

**Task 1.3.1**: 移除未使用的 flutter/widgets import (5 分鐘)

**Task 1.3.2**: 移除 RxDart 依賴 (2-3 小時) ⭐

**Task 1.3.3**: 移除 async 套件依賴 (1-2 小時)

**Task 1.3.4**: 移除 collection 套件依賴 (30 分鐘)

---

##### Task 1.3.1: 移除 flutter/widgets import

**檔案**: `lib/domain/repo/interactor/add_repo.dart`

**Before**:

```dart
import 'package:flutter/widgets.dart';  // ❌ 未使用
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/repo/repository.dart';

@injectable
class AddRepo {
  // ...
}
```

**After**:

```dart
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/repo/repository.dart';

@injectable
class AddRepo {
  // ...
}
```

**執行步驟**:

1. 開啟 `lib/domain/repo/interactor/add_repo.dart`
2. 刪除 Line 2: `import 'package:flutter/widgets.dart';`
3. 儲存檔案
4. 運行 `flutter analyze lib/domain/repo/interactor/add_repo.dart`

**驗收標準**:

- [ ] ✅ 檔案中無 `flutter/widgets` import
- [ ] ✅ `flutter analyze` 無警告

---

##### Task 1.3.2: 移除 RxDart 依賴 ⭐

**優先級**: 🔴 最高（最複雜）
**檔案**: `lib/domain/extension/interactor/list_extensions.dart`

**問題分析**:

當前使用 `CombineLatestStream.combine3` 來合併三個 Stream：

```dart
import 'package:rxdart/rxdart.dart';  // ❌ 不允許的依賴

Stream<Extensions> call(String? keywords) {
  return CombineLatestStream.combine3(
    _installedExtensionRepository.watchList(),
    _remoteExtensionRepository.watchList(),
    _repoRepository.watchList(),
    (List<Extension> installed,
     List<RemoteExtension> remote,
     List<Repo> repos) {
      // 分類邏輯...
      return Extensions(...);
    },
  );
}
```

**解決方案選項**:

**選項 A: 使用 Dart 原生 StreamZip** (推薦)

```dart
import 'package:async/async.dart';  // Dart 官方維護的套件

Stream<Extensions> call(String? keywords) {
  return StreamZip([
    _installedExtensionRepository.watchList(),
    _remoteExtensionRepository.watchList(),
    _repoRepository.watchList(),
  ]).map((values) {
    final installed = values[0] as List<Extension>;
    final remote = values[1] as List<RemoteExtension>;
    final repos = values[2] as List<Repo>;

    // 分類邏輯...
    return Extensions(...);
  });
}
```

**問題**: `async` 套件也不在允許清單中！

**選項 B: 手動實現 combineLatest** (推薦 ✅)

```dart
Stream<Extensions> call(String? keywords) {
  // 使用 Dart 原生 Stream API 手動合併
  late StreamSubscription<List<Extension>> installedSub;
  late StreamSubscription<List<RemoteExtension>> remoteSub;
  late StreamSubscription<List<Repo>> reposSub;

  List<Extension>? latestInstalled;
  List<RemoteExtension>? latestRemote;
  List<Repo>? latestRepos;

  final controller = StreamController<Extensions>();

  void tryEmit() {
    if (latestInstalled != null &&
        latestRemote != null &&
        latestRepos != null) {
      final result = _classify(
        latestInstalled!,
        latestRemote!,
        latestRepos!,
        keywords,
      );
      controller.add(result);
    }
  }

  installedSub = _installedExtensionRepository.watchList().listen((data) {
    latestInstalled = data;
    tryEmit();
  });

  remoteSub = _remoteExtensionRepository.watchList().listen((data) {
    latestRemote = data;
    tryEmit();
  });

  reposSub = _repoRepository.watchList().listen((data) {
    latestRepos = data;
    tryEmit();
  });

  controller.onCancel = () {
    installedSub.cancel();
    remoteSub.cancel();
    reposSub.cancel();
  };

  return controller.stream;
}

// 提取分類邏輯為獨立方法
Extensions _classify(
  List<Extension> installed,
  List<RemoteExtension> remote,
  List<Repo> repos,
  String? keywords,
) {
  // 原本的分類邏輯
  // ...
}
```

**選項 C: 創建通用的 CombineLatest Helper** (進階)

在 `lib/domain/common/` 創建通用工具：

```dart
// lib/domain/common/stream_utils.dart

/// 合併多個 Stream 的最新值
///
/// 當任一 Stream 發出新值時，如果所有 Stream 都至少發出過一次值，
/// 則調用 combiner 函數並發出結果。
Stream<R> combineLatest3<A, B, C, R>(
  Stream<A> streamA,
  Stream<B> streamB,
  Stream<C> streamC,
  R Function(A, B, C) combiner,
) {
  late StreamSubscription<A> subA;
  late StreamSubscription<B> subB;
  late StreamSubscription<C> subC;

  A? latestA;
  B? latestB;
  C? latestC;

  bool hasA = false;
  bool hasB = false;
  bool hasC = false;

  final controller = StreamController<R>();

  void tryEmit() {
    if (hasA && hasB && hasC) {
      final result = combiner(latestA as A, latestB as B, latestC as C);
      controller.add(result);
    }
  }

  subA = streamA.listen((data) {
    latestA = data;
    hasA = true;
    tryEmit();
  });

  subB = streamB.listen((data) {
    latestB = data;
    hasB = true;
    tryEmit();
  });

  subC = streamC.listen((data) {
    latestC = data;
    hasC = true;
    tryEmit();
  });

  controller.onCancel = () {
    subA.cancel();
    subB.cancel();
    subC.cancel();
  };

  return controller.stream;
}
```

使用：

```dart
import 'package:news_hub/domain/common/stream_utils.dart';

Stream<Extensions> call(String? keywords) {
  return combineLatest3(
    _installedExtensionRepository.watchList(),
    _remoteExtensionRepository.watchList(),
    _repoRepository.watchList(),
    (installed, remote, repos) => _classify(installed, remote, repos, keywords),
  );
}
```

**建議**: 使用 **選項 C**，優點：

- ✅ 符合 DDD（Domain 層的通用工具）
- ✅ 可重用（其他 Use Case 也可能需要）
- ✅ 易於測試
- ✅ 無外部依賴

**執行步驟**:

1. 創建 `lib/domain/common/stream_utils.dart`，實現 `combineLatest3`
2. 編寫單元測試 `test/domain/common/stream_utils_test.dart`
3. 更新 `list_extensions.dart` 使用新工具
4. 移除 `import 'package:rxdart/rxdart.dart';`
5. 更新 `pubspec.yaml`，移除 `rxdart` 依賴（如果其他地方也不使用）
6. 運行測試驗證

**驗收標準**:

- [ ] ✅ `stream_utils.dart` 已創建並包含 `combineLatest3`
- [ ] ✅ `list_extensions.dart` 已更新使用新工具
- [ ] ✅ 無 `rxdart` import
- [ ] ✅ 單元測試通過
- [ ] ✅ 功能測試：Extension 列表正常顯示和更新

---

##### Task 1.3.3: 移除 async 套件依賴

**檔案**: `lib/domain/thread/interactor/list_collection_threads.dart`

**問題**: 使用 `StreamGroup` 合併多個 Stream

**Before**:

```dart
import 'package:async/async.dart';  // ❌ 不允許

final group = StreamGroup<BoardDataChunk>();
for (final board in boards) {
  group.add(_fetchThreadsForBoard(board));
}
return group.stream;
```

**After** (選項 1 - 推薦):

```dart
// 使用 Dart 原生 Stream.fromFutures + asyncExpand

Stream<BoardDataChunk> call(String collectionId) async* {
  final collection = await _collectionRepository.get(collectionId);
  final boardDataList = await prepareBoardData(collection);

  // 方法 1: 循序處理（簡單）
  for (final boardData in boardDataList) {
    yield* _fetchThreadsForBoard(boardData);
  }

  // 方法 2: 並行處理（進階，如需要）
  // final streams = boardDataList.map(_fetchThreadsForBoard).toList();
  // for (final stream in streams) {
  //   yield* stream;
  // }
}
```

**After** (選項 2 - 如需真正的並行合併):

創建 `lib/domain/common/stream_utils.dart` 中添加：

```dart
/// 合併多個 Stream 為單一 Stream
Stream<T> mergeStreams<T>(List<Stream<T>> streams) async* {
  final subscriptions = <StreamSubscription<T>>[];
  final controller = StreamController<T>();

  for (final stream in streams) {
    subscriptions.add(stream.listen(
      controller.add,
      onError: controller.addError,
    ));
  }

  yield* controller.stream;

  // 清理
  for (final sub in subscriptions) {
    await sub.cancel();
  }
}
```

使用：

```dart
import 'package:news_hub/domain/common/stream_utils.dart';

Stream<BoardDataChunk> call(String collectionId) async* {
  final collection = await _collectionRepository.get(collectionId);
  final boardDataList = await prepareBoardData(collection);

  final streams = boardDataList
      .map((board) => _fetchThreadsForBoard(board))
      .toList();

  yield* mergeStreams(streams);
}
```

**建議**:

- 如果順序不重要且需要並行，使用**選項 2**
- 如果順序重要或簡單即可，使用**選項 1**

**執行步驟**:

1. 決定使用選項 1 或 2
2. 更新 `list_collection_threads.dart`
3. 移除 `import 'package:async/async.dart';`
4. 測試功能正常

**驗收標準**:

- [ ] ✅ 無 `async` 套件 import
- [ ] ✅ 功能測試：Collection 貼文列表正常載入
- [ ] ✅ 效能測試：多看板並行載入速度未降低

---

##### Task 1.3.4: 移除 collection 套件依賴

**檔案**: `lib/domain/thread/interactor/list_collection_threads.dart`

**問題**: 使用 `firstWhereOrNull`

**Before**:

```dart
import 'package:collection/collection.dart';  // ❌ 不允許

final board = boards.firstWhereOrNull((b) => b.id == boardId);
```

**After** (選項 1 - 使用 dartx):

```dart
import 'package:dartx/dartx.dart';  // ✅ 允許

final board = boards.firstOrNullWhere((b) => b.id == boardId);
```

**After** (選項 2 - 手動實現):

```dart
// 無額外 import

Board? findBoard(List<Board> boards, String boardId) {
  try {
    return boards.firstWhere((b) => b.id == boardId);
  } catch (e) {
    return null;
  }
}

// 使用
final board = findBoard(boards, boardId);
```

**建議**: 使用**選項 1**（dartx 是允許的依賴）

**執行步驟**:

1. 確保 `pubspec.yaml` 包含 `dartx`（應該已有）
2. 更新 import: `collection/collection.dart` → `dartx/dartx.dart`
3. 更新方法名: `firstWhereOrNull` → `firstOrNullWhere`
4. 測試功能正常

**驗收標準**:

- [ ] ✅ 無 `collection/collection.dart` import
- [ ] ✅ 使用 `dartx` 或手動實現
- [ ] ✅ 功能正常

---

##### 整體驗收標準 (Task 1.3)

- [ ] ✅ Domain 層無 `flutter/widgets` import
- [ ] ✅ Domain 層無 `rxdart` import
- [ ] ✅ Domain 層無 `async` 套件 import
- [ ] ✅ Domain 層無 `collection` 套件 import
- [ ] ✅ 所有功能測試通過
- [ ] ✅ `flutter analyze lib/domain` 無警告

---

### Phase 2: BLoC 效能優化

**執行前置條件**:

- ✅ Phase 1 所有任務已完成

---

#### Task 2.1: 優化 HomeScreen BLoC 重建

**優先級**: 🔴 最高
**預估工時**: 3-4 小時
**受影響檔案**: `lib/presentation/pages/home/home_screen.dart`

**目標**: 減少 90%+ 重建次數

**問題**:

- `HomeScreen` 使用頂層 `BlocBuilder` 監聽 `HomeCubit`
- 當 `AppTopBar` 標題改變時，整個 `Scaffold` (包含 `Drawer`, `Router`) 都會重建
- 導致 `Drawer` 動畫卡頓，路由切換不流暢

**解決方案**:

1. 移除 `HomeScreen` 頂層 `BlocBuilder`
2. 將 `AppTopBar` 包裹在 `BlocSelector` 中，只監聽 `state.title`
3. 確保 `Drawer` 內部自行管理狀態監聽

**驗收標準**:

- [ ] ✅ 移除頂層 `BlocBuilder`
- [ ] ✅ 標題變更時，只重建 `AppTopBar`
- [ ] ✅ `Drawer` 展開/收起時無掉幀 (`60 FPS`)

---

#### Task 2.2: 優化 SidecarLogsScreen 效能

**優先級**: 🔴 最高
**預估工時**: 2-3 小時
**受影響檔案**: `lib/presentation/pages/sidecar_logs/sidecar_logs_screen.dart`

**目標**: 維持 60 FPS

**問題**:

- 日誌列表可能包含數千條記錄
- 如果使用 `ListView` 未開啟 `itemExtent` 或未優化 `build`，滾動會卡頓

**解決方案**:

1. 使用 `ListView.builder` 搭配 `itemExtent` (如果高度固定)
2. 確保 Log Item 是 `const` widget
3. 避免在 build 方法中進行複雜的字串處理或日期格式化（移至 ViewModel 或預處理）

---

#### Task 2.3: 優化 ThreadDetailScreen context.watch

**優先級**: 🟡 高
**預估工時**: 2-3 小時

**問題**:

- `ThreadDetailScreen` 可能過度使用 `context.watch<ThreadDetailCubit>()`
- 導致任何細微狀態變更（如載入進度）都觸發整個頁面重建

**解決方案**:

- 使用 `BlocSelector` 或細粒度的 `BlocBuilder`

---

#### Task 2.4-2.8: 其他頁面 BLoC 優化

(保留給後續詳細規劃)

---

### Phase 3: Use Case 重構 (Refactoring)

**說明**: 本階段目標是將 Use Case 拆分為符合單一職責原則 (SRP) 的類別，並清除技術債。

---

#### Task 3.1: 簡化 ListCollectionThreads Use Case

**優先級**: 🟡 高
**預估工時**: 3-4 小時
**受影響檔案**: 1 個

##### 問題描述

**當前狀況**:

```
檔案: lib/domain/thread/interactor/list_collection_threads.dart
行數: 126 行
```

**問題**:

1. **違反單一職責原則**: 同時負責 5 個職責

   - 獲取 Collection 資料
   - 準備看板資料（Extension + Board 組合）
   - 並行請求協調
   - Stream 合併
   - 錯誤處理和資料轉換

2. **包含內部類別定義**: `BoardDataChunk` 應移至 models（在 Task 1.2 已處理）

3. **創建臨時對象**: 填充空值的 `tempBoard` 和 `tempExtension`

4. **複雜的 Stream 控制邏輯**: 使用 `StreamGroup`, `unawaited` 等

**目標**:

- ✅ 符合單一職責原則
- ✅ 減少行數至 < 80 行
- ✅ 提高可讀性和可測試性
- ✅ 遵循 YAGNI 原則（不過度設計）

---

#### Task 3.2: 簡化 ListExtensions Use Case

**優先級**: � 中
**預估工時**: 3-4 小時
**受影響檔案**: 1 個

**目標**:

- 移除 RxDart 依賴 (Task 1.3 已完成)
- 提取輔助邏輯為 public functions
- 保持單一職責

---

#### Task 3.3: 簡化 SearchThreads Use Case

**優先級**: � 中
**預估工時**: 3-4 小時
**受影響檔案**: 1 個

**目標**:

- 簡化並行搜尋邏輯
- 提取輔助方法

##### 解決方案

**原則**:

- 保持輔助邏輯為 **public functions** 在同一檔案
- 只有在確實需要重用時才提取為獨立 Use Case
- 添加清晰註釋說明可能的重構路徑

**重構策略**:

1. 將 `BoardDataChunk` 移至 models（Task 1.2 已完成）
2. 提取輔助方法為 public functions
3. 移除臨時對象創建，使用真實資料
4. 簡化 Stream 控制邏輯

##### Before (當前狀態 - 簡化版)

```dart
// lib/domain/thread/interactor/list_collection_threads.dart (126 行)

@injectable
class ListCollectionThreads {
  Stream<BoardDataChunk> call(String collectionId) async* {
    // 1. 獲取 Collection
    final collection = await _collectionRepository.get(collectionId);

    // 2. 準備看板資料（複雜邏輯）
    final boardDataList = <BoardData>[];
    for (final b in collection.boards) {
      final extension = await _extensionRepository.get(b.identity.extensionPkgName);
      boardDataList.add(BoardData(extension: extension, board: b));
    }

    // 3. 並行請求 + Stream 合併（使用 StreamGroup）
    final group = StreamGroup<BoardDataChunk>();
    for (final boardData in boardDataList) {
      group.add(_fetchAndEnrich(boardData));  // 複雜的內部方法
    }

    yield* group.stream;
  }

  Stream<BoardDataChunk> _fetchAndEnrich(BoardData boardData) async* {
    // 獲取 + 組裝邏輯（30+ 行）
    // ...

    // 創建臨時對象
    final tempBoard = Board(
      extensionPkgName: boardData.board.identity.extensionPkgName,
      id: boardData.board.identity.boardId,
      name: boardData.board.identity.boardName,
      icon: '',  // ❌ 空值
      largeWelcomeImage: '',  // ❌ 空值
      url: '',  // ❌ 空值
      sortOptions: {},  // ❌ 空值
      selectedSort: boardData.board.selectedSort,
      collectionId: boardData.board.collectionId,
    );

    // ...
  }

  // 內部類別定義（❌ 應移至 models）
  class BoardDataChunk {
    final CollectionBoard board;
    final List<SingleImagePostWithExtension> threads;
    final bool isLoading;
    final String? error;
  }
}
```

##### After (重構後)

```dart
// lib/domain/thread/interactor/list_collection_threads.dart (~70 行)

import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/board/repository.dart';
import 'package:news_hub/domain/thread/repository.dart';

/// 獲取 Collection 中所有看板的貼文列表
///
/// 此 Use Case 負責協調多個看板的貼文獲取流程，
/// 並將結果以 Stream 的形式逐個發送。
@injectable
class ListCollectionThreads {
  final CollectionRepository _collectionRepository;
  final ThreadRepository _threadRepository;
  final ExtensionRepository _extensionRepository;
  final BoardRepository _boardRepository;

  ListCollectionThreads(
    this._collectionRepository,
    this._threadRepository,
    this._extensionRepository,
    this._boardRepository,
  );

  /// 主要公開方法：獲取指定 Collection 的所有貼文
  ///
  /// [collectionId] Collection 的唯一識別碼
  ///
  /// Returns: Stream<BoardDataChunk>，每個看板完成載入時發出一個 chunk
  Stream<BoardDataChunk> call(String collectionId) async* {
    final collection = await _collectionRepository.get(collectionId);
    final boardDataList = await prepareBoardData(collection);

    // 順序處理每個看板（簡單且穩定）
    for (final boardData in boardDataList) {
      yield* _fetchThreadsForBoard(boardData);
    }

    // 進階：如需並行處理，可使用 mergeStreams (lib/domain/common/stream_utils.dart)
    // final streams = boardDataList.map(_fetchThreadsForBoard).toList();
    // yield* mergeStreams(streams);
  }

  /// 準備看板資料：將 CollectionBoard 轉換為包含完整 Extension 資訊的 BoardData
  ///
  /// 此方法為公開方法，因為：
  /// 1. 需要被單元測試
  /// 2. 未來其他 Use Case 可能需要相同邏輯（屆時可提取為獨立 Use Case）
  ///
  /// [collection] 要處理的 Collection
  ///
  /// Returns: 包含 Extension 資訊的 BoardData 列表
  @visibleForTesting
  Future<List<BoardData>> prepareBoardData(Collection collection) async {
    final results = <BoardData>[];

    for (final board in collection.boards) {
      final extension = await _extensionRepository.get(
        board.identity.extensionPkgName,
      );

      results.add(BoardData(
        extension: extension,
        board: board,
      ));
    }

    return results;
  }

  /// 獲取單一看板的貼文並組裝完整資料
  ///
  /// [boardData] 包含 Extension 和 Board 資訊的資料對象
  ///
  /// Returns: Stream<BoardDataChunk>，發出該看板的貼文資料
  Stream<BoardDataChunk> _fetchThreadsForBoard(BoardData boardData) async* {
    // 發出載入中狀態
    yield BoardDataChunk(
      board: boardData.board,
      threads: [],
      isLoading: true,
    );

    try {
      final threads = await _threadRepository.listThreads(
        extensionPkgName: boardData.extension.pkgName,
        boardId: boardData.board.identity.boardId,
        sort: boardData.board.selectedSort,
      );

      // 組裝貼文資料
      final enrichedThreads = threads
          .whereType<SingleImagePost>()
          .map((post) => enrichPostWithExtension(post, boardData))
          .toList();

      yield BoardDataChunk(
        board: boardData.board,
        threads: enrichedThreads,
        isLoading: false,
      );
    } catch (e) {
      yield BoardDataChunk(
        board: boardData.board,
        threads: [],
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// 組裝貼文資料：為 Post 附加 Extension 和 Board 資訊
  ///
  /// 此方法為公開方法，因為：
  /// 1. 需要被單元測試
  /// 2. 邏輯清晰，便於維護
  ///
  /// [post] 原始貼文資料
  /// [boardData] 包含 Extension 和 Board 的資料對象
  ///
  /// Returns: 包含完整資訊的貼文對象
  @visibleForTesting
  SingleImagePostWithExtension enrichPostWithExtension(
    SingleImagePost post,
    BoardData boardData,
  ) {
    return SingleImagePostWithExtension(
      post: post,
      board: _createMinimalBoard(boardData),
      extension: boardData.extension,
    );
  }

  /// 創建最小化的 Board 對象（只包含必要資訊）
  ///
  /// 避免創建填充空值的臨時對象，使用 minimal DTO 代替
  Board _createMinimalBoard(BoardData boardData) {
    return Board(
      extensionPkgName: boardData.extension.pkgName,
      id: boardData.board.identity.boardId,
      name: boardData.board.identity.boardName,
      icon: '',  // 暫時保留空值（如需完整資料，使用 _boardRepository.getBoard）
      largeWelcomeImage: '',
      url: '',
      sortOptions: const {},
      selectedSort: boardData.board.selectedSort,
      collectionId: boardData.board.collectionId,
    );
  }
}

/// 輔助資料類別：組合 Extension 和 CollectionBoard 資訊
///
/// 用於在 Use Case 內部傳遞資料，避免多次查詢相同資料
class BoardData {
  final Extension extension;
  final CollectionBoard board;

  const BoardData({
    required this.extension,
    required this.board,
  });
}
```

##### 關鍵改進點

1. ✅ **單一職責**: 主方法 `call()` 只負責協調流程
2. ✅ **公開輔助方法**: 使用 `@visibleForTesting` 標記，可測試但不鼓勵外部使用
3. ✅ **清晰的文件註釋**: 說明方法用途和未來重構路徑
4. ✅ **移除 StreamGroup**: 改用簡單的 for 循環（順序處理）
5. ✅ **提供進階選項**: 註釋中說明如何改為並行處理
6. ✅ **減少臨時對象**: 改用 `_createMinimalBoard`（仍有空值，但更清晰）
7. ✅ **行數減少**: 從 126 行 → ~70 行

##### 執行步驟

**步驟 3.1.1**: 備份和創建分支 (5 分鐘)

```bash
# 創建備份
cp lib/domain/thread/interactor/list_collection_threads.dart \
   lib/domain/thread/interactor/list_collection_threads.dart.backup

# 創建 git 分支
git checkout -b refactor/simplify-list-collection-threads
```

---

**步驟 3.1.2**: 提取 prepareBoardData 方法 (30 分鐘)

1. 在 `list_collection_threads.dart` 中添加新方法：

```dart
@visibleForTesting
Future<List<BoardData>> prepareBoardData(Collection collection) async {
  // 實現如 After 範例
}
```

2. 更新 `call()` 方法使用新方法：

```dart
Stream<BoardDataChunk> call(String collectionId) async* {
  final collection = await _collectionRepository.get(collectionId);
  final boardDataList = await prepareBoardData(collection);  // ← 使用新方法

  // 原有邏輯...
}
```

3. 編寫測試驗證功能一致

---

**步驟 3.1.3**: 提取 enrichPostWithExtension 方法 (20 分鐘)

1. 添加新方法（如 After 範例）
2. 更新使用處
3. 測試

---

**步驟 3.1.4**: 簡化 Stream 控制邏輯 (1 小時)

1. 移除 `StreamGroup` 相關程式碼
2. 改用簡單的 `for` 循環（如 After 範例）
3. 測試功能和效能

---

**步驟 3.1.5**: 創建 BoardData 輔助類別 (15 分鐘)

1. 在檔案底部添加 `BoardData` 類別定義
2. 更新所有使用處

---

**步驟 3.1.6**: 添加文件註釋 (30 分鐘)

1. 為每個 public 方法添加詳細註釋（如 After 範例）
2. 說明方法用途、參數、返回值
3. 說明未來重構路徑

---

**步驟 3.1.7**: 驗證和測試 (1 小時)

1. **單元測試** (如果存在):

   ```bash
   flutter test test/domain/thread/interactor/list_collection_threads_test.dart
   ```

2. **整合測試** (建議新增):

   - 測試單一看板
   - 測試多看板
   - 測試錯誤處理

3. **手動功能測試**:

   - 啟動應用
   - 導航至 Collection 貼文列表頁面
   - 驗證：
     - [ ] 貼文正常載入
     - [ ] 多看板資料正確顯示
     - [ ] 錯誤處理正常
     - [ ] 效能未降低

4. **效能測試**:
   - 使用 Flutter DevTools Performance
   - 記錄重構前後的載入時間
   - 確保無明顯效能降低

---

##### 驗收標準

**必須全部通過** ✅：

- [ ] ✅ `prepareBoardData` 方法已提取為 public function
- [ ] ✅ `enrichPostWithExtension` 方法已提取為 public function
- [ ] ✅ `BoardData` 輔助類別已創建
- [ ] ✅ `StreamGroup` 已移除，改用簡單循環
- [ ] ✅ 所有 public 方法都有詳細文件註釋
- [ ] ✅ 檔案行數 < 80 行
- [ ] ✅ `flutter analyze` 無新增警告
- [ ] ✅ 所有測試通過（如有）
- [ ] ✅ 功能測試：Collection 貼文列表正常載入
- [ ] ✅ 效能測試：載入時間未明顯增加

**禁止出現** ❌：

- [ ] ❌ 仍使用 `StreamGroup`（除非註釋說明）
- [ ] ❌ 仍有臨時對象填充空值（除非使用 `_createMinimalBoard`）
- [ ] ❌ 仍有內部類別定義（`BoardDataChunk` 應在 models）
- [ ] ❌ public 方法缺少文件註釋
- [ ] ❌ 效能明顯降低（載入時間增加 > 20%）

##### 驗證方法

**自動化驗證**:

```bash
# 1. 檢查行數
wc -l lib/domain/thread/interactor/list_collection_threads.dart
# 預期：< 80 行（不含空行和註釋）

# 2. 檢查無 StreamGroup 使用
! grep -q "StreamGroup" lib/domain/thread/interactor/list_collection_threads.dart && \
  echo "✅ 無 StreamGroup" || echo "❌ 仍使用 StreamGroup"

# 3. 檢查無內部類別定義（除了 BoardData）
! grep -q "class BoardDataChunk" lib/domain/thread/interactor/list_collection_threads.dart && \
  echo "✅ BoardDataChunk 已移至 models" || echo "❌ 仍有內部類別"

# 4. 靜態分析
flutter analyze lib/domain/thread/interactor/list_collection_threads.dart

# 5. 測試
flutter test test/domain/thread/interactor/
```

**手動驗證**:

1. Code Review:

   - 閱讀重構後的程式碼
   - 確認邏輯清晰易懂
   - 確認文件註釋完整

2. 功能驗證:

   - 開啟應用
   - 測試 Collection 貼文列表功能
   - 驗證多看板資料正確

3. 效能驗證:
   - 使用 Flutter DevTools Performance
   - 對比重構前後的效能數據

##### 注意事項

⚠️ **重要**:

1. **測試優先**: 如果還沒有單元測試，先編寫測試再重構
2. **小步重構**: 不要一次修改太多，每個步驟都要測試
3. **保持功能一致**: 重構不改變行為，只改變結構
4. **效能監控**: 從並行改為順序處理可能影響效能，需監控

⚠️ **臨時對象問題**:

當前方案仍有 `_createMinimalBoard` 填充空值。如需徹底解決：

**選項 A**: 獲取真實 Board 資料

```dart
// 在 prepareBoardData 中
final realBoard = await _boardRepository.getBoard(
  boardId: board.identity.boardId,
  collectionId: collection.id,
);
```

**選項 B**: 創建 MinimalBoard DTO

```dart
@freezed
class MinimalBoard with _$MinimalBoard {
  const factory MinimalBoard({
    required String extensionPkgName,
    required String id,
    required String name,
    required String selectedSort,
    required String collectionId,
  }) = _MinimalBoard;
}
```

**建議**: 當前保持 `_createMinimalBoard`，未來如有需求再優化

📝 **建議的 Commit Message**:

```
refactor(domain): simplify ListCollectionThreads Use Case

Simplify ListCollectionThreads by extracting helper methods as public
functions within the same file, following YAGNI principle.

Changes:
- Extract prepareBoardData as public @visibleForTesting method
- Extract enrichPostWithExtension as public @visibleForTesting method  - Remove StreamGroup dependency, use simple for-loop instead
- Create BoardData helper class for internal data passing
- Add comprehensive documentation for all public methods
- Reduce file complexity: 126 lines → ~70 lines

Benefits:
- Better testability (public helper methods)
- Improved readability (clear separation of concerns)
- No over-engineering (keep helpers in same file until reuse needed)
- Easier maintenance (well-documented code)

Note: Helper methods marked as @visibleForTesting to indicate they are
public for testing purposes only. If other Use Cases need these methods
in the future, they can be extracted to separate Use Cases.

Ref: REFACTORING_PLAN.md Task 3.1
```

---

## 🎯 總結與建議

### 更新重點

1. **Task 1.1** - 明確使用業務語言（ExtensionSettings）替代技術術語（Preferences）
2. **Task 1.2** - 詳細的檔案拆分步驟，符合 VSCode 使用者需求
3. **Task 3.1** - 遵循 YAGNI 原則，保持輔助方法為 public functions，不過度設計

### Spec-Driven Development 要素

✅ 每個任務包含：

- 問題描述（Why）
- 解決方案（What）
- Before/After 程式碼範例
- 逐步執行步驟（How）
- 明確驗收標準
- 自動化驗證腳本

### 給 AI Agent 執行者的提示

1. **嚴格遵循步驟順序** - 不要跳步
2. **每個步驟都要驗證** - 不要假設成功
3. **遇到錯誤立即停止** - 回報問題，不要猜測
4. **保持 git commit 頻繁** - 每個子任務一個 commit
5. **測試優先** - 重構前先確保有測試覆蓋

### 下一步

完整的 REFACTORING_PLAN_V2.md 已創建，包含：

- Phase 1: 架構合規性修復（詳細）
- Phase 2: BLoC 效能優化（待補充）
- Phase 3: Use Case 重構（部分完成）
- Phase 4: 測試覆蓋率（待補充）

建議按順序執行 Phase 1 的所有任務，確保架構基礎穩固後再進行後續階段。

---

**文件版本**: 2.0
**最後更新**: 2026-01-14
**維護者**: Sonnet 4.5 (AI Code Analyst)
**審核狀態**: 已整合用戶反饋，待執行驗證
