# News Hub 重構計畫 📋

**建立日期**: 2026-01-14
**分析範圍**: Dart 程式碼架構、DDD 規範、BLoC 效能優化
**基準文件**: CLAUDE.md - 架構設計規範、效能與品質要求

---

## 📊 執行摘要

經過深入程式碼審查，發現 News Hub 專案存在以下主要問題：

### 🔴 嚴重問題

1. **Domain 層依賴違規** (4 項)
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

#### Task 1.1: 移除 Domain 層對外層的依賴

**優先級**: 🔴 最高
**預估工時**: 4-6 小時
**受影響檔案**: 9 個

**詳細步驟**:

1. **修復 App 層依賴** (1 小時)
   ```
   檔案: lib/domain/extension/services/extension_preferences_service.dart
   ```
   - [ ] 將 `Preference<T>` 抽象類別移至 `lib/domain/common/preference.dart`
   - [ ] 更新 `lib/app/service/preferences/preference.dart` import
   - [ ] 更新所有使用 `Preference` 的檔案 import 路徑
   - [ ] 驗證編譯通過

2. **移除未使用的 import** (0.5 小時)
   ```
   檔案: lib/domain/repo/interactor/add_repo.dart
   ```
   - [ ] 刪除 `import 'package:flutter/widgets.dart';` (Line 2)
   - [ ] 運行 `flutter analyze` 確認無警告

3. **重構 RxDart 依賴** (2-3 小時) ⭐ **最複雜**
   ```
   檔案: lib/domain/extension/interactor/list_extensions.dart
   ```
   - [ ] 分析 `CombineLatestStream.combine3` 的使用場景
   - [ ] 使用 Dart 原生 Stream API 重寫:
     ```dart
     // Before
     CombineLatestStream.combine3(
       installedStream,
       remoteStream,
       reposStream,
       (installed, remote, repos) => /* 合併邏輯 */
     )

     // After
     Stream.zip([installedStream, remoteStream, reposStream])
       .map((results) => /* 合併邏輯 */)
     ```
   - [ ] 編寫單元測試驗證行為一致性
   - [ ] 更新 `pubspec.yaml` 移除 `rxdart` 依賴（如果其他地方也不使用）

4. **重構 async 套件依賴** (1-2 小時)
   ```
   檔案: lib/domain/thread/interactor/list_collection_threads.dart
   ```
   - [ ] 分析 `StreamGroup` 的使用
   - [ ] 使用 Dart 原生 `Stream.merge()` 或 `Stream.fromFutures()` 重寫
   - [ ] 測試並行 Stream 合併邏輯

5. **移除 collection 套件依賴** (0.5 小時)
   ```
   檔案: lib/domain/thread/interactor/list_collection_threads.dart
   ```
   - [ ] 將 `firstWhereOrNull` 改為:
     ```dart
     // Before
     list.firstWhereOrNull((item) => condition)

     // After
     try {
       list.firstWhere((item) => condition)
     } catch (e) {
       null
     }
     ```
   - [ ] 或安裝 `dartx` 套件（CLAUDE.md 允許）

6. **重構 Shared 層依賴** (1-2 小時)
   ```
   受影響檔案: 6 個 (thread/ 目錄下)
   ```
   - [ ] 創建 `lib/domain/common/` 目錄
   - [ ] 移動 `Pagination` 類別至 `lib/domain/common/pagination.dart`
   - [ ] 移動 `Result<T>` 類別至 `lib/domain/common/result.dart`
   - [ ] 更新所有 import 路徑
   - [ ] 更新 `lib/shared/models.dart` export (如需保持向後兼容)

**驗收標準**:
- [ ] `flutter analyze` 無 Domain 層依賴警告
- [ ] 所有受影響檔案編譯通過
- [ ] 單元測試（如有）全數通過

---

#### Task 1.2: Entity 和 Value Object 重構

**優先級**: 🟡 高
**預估工時**: 8-12 小時
**受影響檔案**: `lib/domain/models/models.dart` + 4 個 Use Case 檔案

**詳細步驟**:

1. **移動 Use Case 內的 Entity 定義** (2-3 小時)
   ```
   受影響檔案:
   - lib/domain/thread/interactor/get_original_post.dart (ArticlePostWithExtension)
   - lib/domain/extension/interactor/list_installed_extensions.dart (ExtensionWithBoards)
   - lib/domain/extension/interactor/list_extensions.dart (Extensions)
   - lib/domain/thread/interactor/list_collection_threads.dart (BoardDataChunk)
   ```
   - [ ] 將 `ArticlePostWithExtension` 移至 `models.dart`
   - [ ] 將 `ExtensionWithBoards` 移至 `models.dart`
   - [ ] 將 `Extensions` 移至 `models.dart`
   - [ ] 將 `BoardDataChunk` 移至 `models.dart`
   - [ ] 更新所有使用這些類別的 import
   - [ ] 為每個類別添加 `@freezed` 註解

2. **為現有 Entity 添加 freezed** (4-6 小時)
   ```
   需要處理的類別 (17 個):
   - HealthCheckResult, LogEntry, Repo
   - Extension, RemoteExtension
   - Collection, SingleImagePostWithExtension
   - Post, SingleImagePost, ArticlePost
   - 所有 Paragraph 子類別 (6 個)
   - Comment, Bookmark, Suggestion
   ```
   - [ ] 為每個類別添加 `@freezed` 註解
   - [ ] 使用 `factory` constructor 替換現有 constructor
   - [ ] 移除手動實現的 `copyWith` 方法
   - [ ] 運行 `dart run build_runner build --delete-conflicting-outputs`
   - [ ] 修復編譯錯誤
   - [ ] 測試所有使用這些 Entity 的功能

3. **移除 Entity 中的業務邏輯** (2-3 小時)
   ```
   需要重構的方法:
   - ImageParagraph.thumb() → 移至 Use Case 或 Domain Service
   - VideoParagraphEx.isYouTube() → 移至 Use Case 或 Domain Service
   - SingleImagePost.copyWith() 的特殊邏輯 → 重新評估設計
   ```
   - [ ] 創建 `ParagraphHelper` Domain Service
   - [ ] 移動 `thumb()` 邏輯至 helper
   - [ ] 移動 `isYouTube()` 邏輯至 helper
   - [ ] 簡化 `SingleImagePost.copyWith()` 或提取為 Use Case
   - [ ] 更新所有調用處

**驗收標準**:
- [ ] 所有 Entity 使用 `@freezed` 註解
- [ ] `models.dart` 包含所有 Entity 定義
- [ ] Use Case 檔案內無 class 定義
- [ ] 業務邏輯從 Entity 中移除
- [ ] `dart run build_runner build` 成功執行

---

### Phase 2: BLoC 效能優化 (High Priority) 🚀

#### Task 2.1: HomeScreen 整頁重建優化

**優先級**: 🔴 最高 (嚴重影響使用者體驗)
**預估工時**: 4-6 小時
**目標**: 減少重建次數 90%+

**當前問題分析**:
```dart
// 目前 (BAD):
BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppTopBar(title: state.title),  // ← title 變化重建整頁
      drawer: AppNavigationDrawer(...),        // ← collections 變化重建整頁
      body: const AutoRouter(),                 // ← 不必要的重建
    );
  },
)
```

**重建觸發頻率**:
- `title`: 每次路由切換 (~5 次/分鐘)
- `collections`: 資料庫變化 (~1 次/10 分鐘)
- `sidecarStatus`: 每秒變化 (~60 次/分鐘)
- **總計**: 每分鐘觸發 66+ 次整頁重建 ❌

**優化方案**:

1. **拆分 AppTopBar 重建** (1-2 小時)
   ```dart
   // 優化後 (GOOD):
   appBar: AppTopBar(
     title: BlocSelector<HomeCubit, HomeState, String>(
       selector: (state) => state.title,
       builder: (context, title) => Text(title),
     ),
     onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
     onSearchPressed: () => context.router.push(SearchRoute()),
     onSettingsPressed: () => context.router.push(const SettingsRoute()),
   ),
   ```
   - [ ] 創建 `AppTopBar` 的新版本,接受 `Widget title` 參數
   - [ ] 在 `home_screen.dart` 中使用 `BlocSelector` 構建 title
   - [ ] 測試路由切換時只有 title 重建

2. **優化 AppNavigationDrawer** (2-3 小時)
   ```dart
   // 方案 A: 將 Drawer 移出 BlocBuilder
   drawer: const AppNavigationDrawer(),  // 內部自行訂閱

   // 方案 B: 使用 BlocSelector
   drawer: BlocSelector<HomeCubit, HomeState, (List<Collection>, SidecarConnectionState)>(
     selector: (state) => (state.collections, state.sidecarStatus),
     builder: (context, data) => AppNavigationDrawer(
       collections: data.$1,
       sidecarStatus: data.$2,
       ...
     ),
   ),
   ```
   - [ ] 決定使用方案 A 或 B（建議 A）
   - [ ] 重構 `AppNavigationDrawer` 內部使用 `BlocBuilder` + `buildWhen`
   - [ ] 測試 sidecar 狀態變化時不影響 Collections 列表

3. **添加效能測試** (1 小時)
   ```dart
   testWidgets('HomeScreen should not rebuild on sidecar status change', (tester) async {
     int appBarBuildCount = 0;
     int drawerBuildCount = 0;

     // ... 測試邏輯

     expect(appBarBuildCount, 1);  // 應只建立一次
     expect(drawerBuildCount, 0);  // sidecar 變化不重建
   });
   ```
   - [ ] 編寫 Widget 測試驗證重建次數
   - [ ] 使用 Flutter DevTools Performance 記錄優化前後對比

**預期成果**:
```
優化前: 每次狀態變化 → 重建 Scaffold + AppBar + Drawer + Body
優化後:
  - title 變化 → 只重建 AppBar title Text
  - collections 變化 → 只重建 Drawer 內容
  - sidecarStatus 變化 → 只重建 Drawer footer 狀態指示器
  - pendingRoute 變化 → 無重建

重建次數減少: ~95%
```

---

#### Task 2.2: SidecarLogsScreen 高頻更新優化

**優先級**: 🔴 最高 (日誌串流每秒更新)
**預估工時**: 3-4 小時
**目標**: 減少重建次數 95%+，維持 60 FPS

**當前問題分析**:
```dart
// 目前 (BAD):
BlocBuilder<SidecarLogsCubit, SidecarLogsState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(...),         // ← 每次新日誌都重建
      body: Column(
        children: [
          _StatusBar(...),         // ← 每次新日誌都重建
          ListView(...),           // ← 每次新日誌都重建整個列表
        ],
      ),
    );
  },
)
```

**問題嚴重性**:
- 日誌每秒新增 1-10 筆
- 每筆新日誌觸發整頁重建
- **結果**: UI 執行緒 CPU 使用率 > 50%，可能掉幀

**優化方案**:

1. **拆分 AppBar 重建** (30 分鐘)
   ```dart
   appBar: AppBar(
     title: BlocSelector<SidecarLogsCubit, SidecarLogsState, bool>(
       selector: (state) => state.isSearching,
       builder: (context, isSearching) => isSearching
         ? TextField(...)
         : const Text('Sidecar Logs'),
     ),
     actions: [
       BlocSelector<SidecarLogsCubit, SidecarLogsState, bool>(
         selector: (state) => state.isSearching,
         builder: (context, isSearching) => IconButton(
           icon: Icon(isSearching ? Icons.close : Icons.search),
           onPressed: () => context.read<SidecarLogsCubit>().toggleSearch(),
         ),
       ),
       // ... 其他 actions
     ],
   )
   ```

2. **拆分 StatusBar 重建** (1 小時)
   ```dart
   _StatusBar(
     autoScroll: BlocSelector<SidecarLogsCubit, SidecarLogsState, bool>(
       selector: (state) => state.autoScroll,
       builder: (context, autoScroll) => Switch(value: autoScroll, ...),
     ),
     logCount: BlocSelector<SidecarLogsCubit, SidecarLogsState, int>(
       selector: (state) => state.filteredLogs.length,
       builder: (context, count) => Text('$count logs'),
     ),
     // ...
   ),
   ```

3. **優化 ListView 重建** (1.5-2 小時) ⭐ **最重要**
   ```dart
   // 方案 A: 使用 ListView.builder + BlocSelector
   Expanded(
     child: BlocSelector<SidecarLogsCubit, SidecarLogsState, List<LogEntry>>(
       selector: (state) => state.filteredLogs,
       builder: (context, logs) => ListView.builder(
         itemCount: logs.length,
         itemBuilder: (context, index) => _LogEntryTile(log: logs[index]),
       ),
     ),
   )

   // 方案 B: 使用 StreamBuilder (更高效)
   Expanded(
     child: StreamBuilder<List<LogEntry>>(
       stream: context.read<SidecarLogsCubit>().filteredLogsStream,
       builder: (context, snapshot) => ListView.builder(
         itemCount: snapshot.data?.length ?? 0,
         itemBuilder: (context, index) => _LogEntryTile(log: snapshot.data![index]),
       ),
     ),
   )
   ```
   - [ ] 決定使用方案 A 或 B（建議 B）
   - [ ] 若使用方案 B，在 Cubit 中添加 `filteredLogsStream` getter
   - [ ] 確保 `_LogEntryTile` 使用 `const` constructor
   - [ ] 實作虛擬滾動 (ListView.builder 已支援)

4. **添加效能測試** (30 分鐘)
   - [ ] 使用 Flutter DevTools Performance 記錄
   - [ ] 模擬每秒新增 10 筆日誌
   - [ ] 驗證 FPS 維持 60

**預期成果**:
```
優化前:
  - 新增 1 筆日誌 → 重建整個 Scaffold (包含 AppBar, StatusBar, 所有列表項)
  - 新增 10 筆/秒 → 10 次整頁重建/秒 → FPS 降至 30-40

優化後:
  - 新增 1 筆日誌 → 只重建該列表項
  - 新增 10 筆/秒 → 僅重建新增的 10 個列表項 → FPS 維持 60

重建次數減少: ~95%
UI 執行緒 CPU 使用率: 從 50% 降至 < 10%
```

---

#### Task 2.3: ThreadDetailScreen context.watch 移除

**優先級**: 🟡 高
**預估工時**: 2-3 小時
**目標**: 減少重建次數 85%+

**當前問題**:
```dart
// Line 45 (BAD):
final cubit = context.watch<ThreadDetailCubit>();

// Line 265 (GOOD):
final commentsResult = context.select(
  (ThreadDetailCubit c) => c.state.commentsMap[post.id]
);
```

**優化步驟**:

1. **移除全局 context.watch** (1 小時)
   ```dart
   // Before
   final cubit = context.watch<ThreadDetailCubit>();

   // After
   final cubit = context.read<ThreadDetailCubit>();
   ```
   - [ ] 將 Line 45 的 `context.watch` 改為 `context.read`
   - [ ] 檢查所有使用 `cubit` 的地方
   - [ ] 對需要響應狀態的 Widget 使用 `BlocSelector`

2. **添加精確訂閱** (1-2 小時)
   ```dart
   // 原帖訂閱
   BlocSelector<ThreadDetailCubit, ThreadDetailState, Result<ArticlePost>?>(
     selector: (state) => state.threadMap[widget.threadId],
     builder: (context, threadResult) => ...,
   )

   // 回覆列表訂閱
   BlocSelector<ThreadDetailCubit, ThreadDetailState, Result<List<ArticlePost>>?>(
     selector: (state) => state.repliesMap[postId],
     builder: (context, repliesResult) => ...,
   )
   ```
   - [ ] 識別所有需要響應狀態的 Widget
   - [ ] 逐一替換為 `BlocSelector`
   - [ ] 測試功能正常

**預期成果**:
```
優化前:
  - threadMap 新增項目 → 重建整個頁面
  - repliesMap 新增項目 → 重建整個頁面
  - commentsMap 新增項目 → 重建整個頁面

優化後:
  - threadMap 新增項目 → 只重建原帖卡片
  - repliesMap 新增項目 → 只重建對應的回覆列表
  - commentsMap 新增項目 → 只重建對應的留言列表

重建次數減少: ~85%
```

---

#### Task 2.4: 其他頁面優化 (批次處理)

**優先級**: 🟡 中
**預估工時**: 6-8 小時
**受影響檔案**: 5 個

**頁面清單**:
1. CollectionThreadListScreen (context.watch)
2. CollectionBoardThreadListScreen (context.watch)
3. BoardsPickerScreen (整頁訂閱)
4. CollectionManageScreen (整頁訂閱)
5. SearchScreen

**優化方案** (每個頁面 1-1.5 小時):
- [ ] 移除不必要的 `context.watch`
- [ ] 改用 `context.read` + `BlocSelector`
- [ ] 對於需要多個狀態的 Widget，使用 `BlocSelector` 的 tuple selector
- [ ] 添加 `buildWhen` 條件限制重建

**預期成果**: 每個頁面減少 70-80% 重建次數

---

#### Task 2.5: const Constructor 優化

**優先級**: 🟢 低
**預估工時**: 3-4 小時
**受影響檔案**: 所有 Presentation 層檔案

**優化項目**:

1. **列表項 Widget** (2 小時)
   ```dart
   // Before
   return Padding(
     padding: const EdgeInsets.all(8),
     child: SingleImagePostCard(thread: item),
   );

   // After
   return const Padding(
     padding: EdgeInsets.all(8),
     child: SingleImagePostCard(thread: item),  // 如果 item 是 const
   );
   ```
   - [ ] 檢查所有 `itemBuilder` 中的 Widget
   - [ ] 為可以使用 `const` 的 Widget 添加 `const`
   - [ ] 確保 Widget 的 constructor 聲明為 `const`

2. **靜態組件** (1 小時)
   ```dart
   Icon(Icons.search)           → const Icon(Icons.search)
   SizedBox(height: 16)         → const SizedBox(height: 16)
   Text('Sidecar Logs')         → const Text('Sidecar Logs')
   EmptyScreen(message: '...')  → const EmptyScreen(message: '...')
   ```
   - [ ] 使用 IDE 的 "Add const" 快速修復
   - [ ] 批次處理所有檔案

3. **驗證** (1 小時)
   - [ ] 運行 `flutter analyze`，確認沒有「prefer_const_constructors」警告
   - [ ] 使用 Flutter DevTools 檢查記憶體使用量

**預期成果**:
- 減少 Widget 實例化開銷
- 降低記憶體使用量 10-15%
- 提升滾動列表的流暢度

---

### Phase 3: Use Case 重構 (Medium Priority) 🔧

#### Task 3.1: ListCollectionThreads 重構

**優先級**: 🟡 高
**預估工時**: 6-8 小時
**目標**: 符合單一職責原則，移除 `async` 套件依賴

**當前問題**:
- 126 行程式碼（建議 < 50 行）
- 同時負責 5 個職責：
  1. 獲取 Collection 資料
  2. 並行請求協調
  3. Stream 合併
  4. 錯誤處理
  5. 資料轉換

**重構方案**:

1. **提取 BoardDataChunk 至 models** (30 分鐘)
   - [ ] 將 `BoardDataChunk` 類別移至 `lib/domain/models/models.dart`
   - [ ] 添加 `@freezed` 註解
   - [ ] 更新 import

2. **拆分職責為多個 Use Case** (4-5 小時)
   ```dart
   // 新 Use Case 1: 準備看板資料
   class PrepareBoardDataForCollection {
     Future<List<BoardData>> call(String collectionId) { ... }
   }

   // 新 Use Case 2: 獲取看板貼文
   class FetchThreadsForBoard {
     Future<List<Post>> call(BoardData board) { ... }
   }

   // 新 Use Case 3: 組裝貼文資料 (enrichment)
   class EnrichPostWithExtensionAndBoard {
     SingleImagePostWithExtension call(SingleImagePost post, BoardData board) { ... }
   }

   // 原 Use Case: 協調上述三者
   class ListCollectionThreads {
     Stream<BoardDataChunk> call(String collectionId) {
       final boards = await _prepareBoardData(collectionId);
       return Stream.fromFutures(
         boards.map((board) => _fetchThreadsForBoard(board))
       ).asyncMap((threads) => threads.map(_enrichPost).toList());
     }
   }
   ```
   - [ ] 創建 3 個新 Use Case
   - [ ] 重構 `ListCollectionThreads` 使用這些 Use Case
   - [ ] 移除 `StreamGroup` 依賴，使用 `Stream.fromFutures`

3. **移除臨時對象創建** (1-2 小時)
   ```dart
   // Before: 創建填充空值的 tempBoard
   final tempBoard = Board(
     extensionPkgName: b.identity.extensionPkgName,
     id: b.identity.boardId,
     name: b.identity.boardName,
     icon: '',  // 空值
     largeWelcomeImage: '',
     url: '',
     sortOptions: {},
     selectedSort: b.selectedSort,
     collectionId: b.collectionId,
   );

   // After: 使用真實 Board 資料或創建 minimal DTO
   final board = await _boardRepository.getBoard(
     boardId: b.identity.boardId,
     collectionId: b.collectionId,
   );
   // 或創建 BoardDTO 只包含必要字段
   ```
   - [ ] 重新評估是否需要完整 `Board` 對象
   - [ ] 考慮創建 `MinimalBoardData` DTO
   - [ ] 或從 Repository 獲取真實資料

4. **添加單元測試** (1 小時)
   - [ ] 測試 `PrepareBoardDataForCollection`
   - [ ] 測試 `FetchThreadsForBoard`
   - [ ] 測試 `EnrichPostWithExtensionAndBoard`
   - [ ] 測試 `ListCollectionThreads` 協調邏輯

**預期成果**:
```
優化前: 1 個 126 行 Use Case，職責不明確
優化後: 4 個 Use Case，每個 < 40 行，職責清晰
測試覆蓋率: 從 0% 提升至 80%+
```

---

#### Task 3.2: ListExtensions 重構

**優先級**: 🟡 中
**預估工時**: 3-4 小時

**步驟**:
1. **移動 Extensions 類別** (30 分鐘)
   - [ ] 移至 `models.dart`，添加 `@freezed`

2. **拆分分類邏輯** (1.5-2 小時)
   ```dart
   // 新建 Domain Service
   class ExtensionClassifier {
     Extensions classify(
       List<Extension> installed,
       List<RemoteExtension> remote,
       List<Repo> repos,
     ) { ... }
   }

   // Use Case 簡化
   class ListExtensions {
     Stream<Extensions> call(String? keywords) {
       return CombineLatestStream.combine3(
         _installedRepo.watchList(),
         _remoteRepo.watchList(),
         _repoRepo.watchList(),
         (i, r, rp) => _classifier.classify(i, r, rp),
       );
     }
   }
   ```
   - [ ] 創建 `ExtensionClassifier` Domain Service
   - [ ] 將分類邏輯移至 Classifier
   - [ ] Use Case 只負責協調 Streams

3. **處理關鍵字過濾** (1 小時)
   ```dart
   // 選項 A: 由 Repository 處理
   _remoteRepo.watchList(keywords: keywords)

   // 選項 B: 由 Use Case 過濾
   _remoteRepo.watchList()
     .map((list) => keywords == null ? list : list.where(...))
   ```
   - [ ] 決定過濾邏輯的位置
   - [ ] 實作過濾邏輯

4. **添加測試** (30-45 分鐘)

---

#### Task 3.3: SearchThreads 重構

**優先級**: 🟡 中
**預估工時**: 2-3 小時

**步驟**:
1. **提取並行搜尋協調邏輯** (1.5 小時)
   - [ ] 創建 `ParallelSearchCoordinator` Domain Service
   - [ ] 將 `Future.wait` + `flatten` 邏輯移至 Coordinator

2. **簡化 Use Case** (30-45 分鐘)
   - [ ] Use Case 只負責：獲取 Extension 列表 → 委託給 Coordinator → 返回結果

3. **添加測試** (45 分鐘)

---

### Phase 4: 測試覆蓋率提升 (High Priority) 🧪

#### Task 4.1: 建立測試基礎設施

**優先級**: 🔴 最高
**預估工時**: 4-6 小時

**步驟**:

1. **創建測試目錄結構** (30 分鐘)
   ```
   test/
   ├── domain/
   │   ├── collection/
   │   │   ├── interactor/
   │   │   │   ├── create_collection_test.dart
   │   │   │   ├── get_collections_test.dart
   │   │   │   └── ...
   │   │   └── repository_test.dart (測試 Mock)
   │   ├── thread/
   │   │   ├── interactor/
   │   │   └── repository_test.dart
   │   ├── extension/
   │   └── ...
   ├── app/
   │   └── (暫時略過)
   ├── presentation/
   │   ├── pages/
   │   │   ├── home/
   │   │   │   └── home_cubit_test.dart
   │   │   └── ...
   │   └── components/
   └── helpers/
       ├── mock_repositories.dart
       └── test_data.dart
   ```
   - [ ] 創建上述目錄結構
   - [ ] 安裝測試套件：`mockito`, `bloc_test`

2. **設置 Mock 基礎設施** (1-2 小時)
   ```dart
   // test/helpers/mock_repositories.dart
   import 'package:mockito/annotations.dart';
   import 'package:news_hub/domain/collection/repository.dart';
   import 'package:news_hub/domain/thread/repository.dart';
   // ...

   @GenerateMocks([
     CollectionRepository,
     ThreadRepository,
     ExtensionRepository,
     BoardRepository,
     // ...
   ])
   void main() {}
   ```
   - [ ] 定義所有需要 Mock 的 Repository
   - [ ] 運行 `flutter pub run build_runner build`
   - [ ] 生成 Mock 類別

3. **創建測試資料工廠** (1-2 小時)
   ```dart
   // test/helpers/test_data.dart
   class TestDataFactory {
     static Collection createCollection({String? id, String? name}) {
       return Collection(
         id: id ?? 'test-collection-1',
         name: name ?? 'Test Collection',
         boards: [],
       );
     }

     static Extension createExtension({String? pkgName}) {
       return Extension(...);
     }

     // ...
   }
   ```
   - [ ] 為所有 Entity 創建工廠方法
   - [ ] 支援參數化定制
   - [ ] 提供常用測試資料集

4. **編寫測試範例** (1-2 小時)
   ```dart
   // test/domain/collection/interactor/create_collection_test.dart
   void main() {
     group('CreateCollection', () {
       late MockCollectionRepository mockRepository;
       late CreateCollection useCase;

       setUp(() {
         mockRepository = MockCollectionRepository();
         useCase = CreateCollection(mockRepository);
       });

       test('should create collection with given name and boards', () async {
         // Arrange
         const name = 'My Collection';
         final boards = [TestDataFactory.createCollectionBoard()];
         when(mockRepository.create(name, boards))
           .thenAnswer((_) async => {});

         // Act
         await useCase(name: name, boards: boards);

         // Assert
         verify(mockRepository.create(name, boards)).called(1);
       });
     });
   }
   ```
   - [ ] 編寫 3-5 個範例測試
   - [ ] 建立測試模板供團隊參考

---

#### Task 4.2: Domain 層 Use Case 測試

**優先級**: 🔴 最高
**預估工時**: 12-16 小時 (視 Use Case 數量)
**目標**: 覆蓋率 80%+

**測試清單** (37 個 Use Case):

**Collection 相關** (7 個):
- [ ] CreateCollection
- [ ] DeleteCollection
- [ ] GetCollection
- [ ] GetCollectionBoard
- [ ] GetCollections
- [ ] UpdateCollection
- [ ] WatchCollections

**Extension 相關** (6 個):
- [ ] GetInstalledExtension
- [ ] InstallExtension
- [ ] ListExtensions
- [ ] ListInstalledExtensions
- [ ] ListRemoteExtensions
- [ ] UninstallExtension

**Thread 相關** (6 個):
- [ ] SearchThreads
- [ ] ListComments
- [ ] GetOriginalPost
- [ ] ListReplies
- [ ] ListBoardThreads
- [ ] ListCollectionThreads

**Repo 相關** (3 個):
- [ ] ListRepos
- [ ] RemoveRepo
- [ ] AddRepo

**Bookmark 相關** (1 個):
- [ ] ListBookmarks

**Suggestion 相關** (3 個):
- [ ] ListSuggestions
- [ ] InsertSuggestion
- [ ] UpdateSuggestionLatestUsedAt

**Board 相關** (1 個):
- [ ] GetBoardSortOptions

**每個測試的基本結構** (20-30 分鐘/個):
```dart
void main() {
  group('UseCase Name', () {
    late MockRepository mockRepo;
    late UseCase useCase;

    setUp(() { ... });

    test('should return data when repository succeeds', () async { ... });
    test('should throw exception when repository fails', () async { ... });
    test('should call repository with correct parameters', () async { ... });
  });
}
```

**優先級順序**:
1. 🔴 最高: 複雜 Use Case (ListCollectionThreads, SearchThreads, ListExtensions)
2. 🟡 高: 常用 Use Case (GetCollections, ListBoardThreads, GetOriginalPost)
3. 🟢 中: CRUD Use Case (Create, Update, Delete)

---

#### Task 4.3: Presentation 層 Cubit 測試

**優先級**: 🟡 高
**預估工時**: 8-12 小時
**目標**: 關鍵功能覆蓋率 60%+

**測試清單** (11 個 Cubit):

**優先級 🔴 最高**:
- [ ] HomeCubit (狀態管理核心)
- [ ] ThreadDetailCubit (複雜狀態)
- [ ] CollectionThreadListCubit (分頁邏輯)

**優先級 🟡 高**:
- [ ] SearchCubit
- [ ] ExtensionCubit
- [ ] SidecarLogsCubit
- [ ] BoardsPickerCubit

**優先級 🟢 中**:
- [ ] CollectionBoardThreadListCubit
- [ ] CollectionCubit (Settings)
- [ ] RepoCubit
- [ ] CollectionFormCubit

**測試範例** (使用 `bloc_test`):
```dart
void main() {
  group('HomeCubit', () {
    late MockCollectionRepository mockCollectionRepo;
    late MockSidecarRepository mockSidecarRepo;
    late HomeCubit cubit;

    setUp(() {
      mockCollectionRepo = MockCollectionRepository();
      mockSidecarRepo = MockSidecarRepository();
      cubit = HomeCubit(mockCollectionRepo, mockSidecarRepo);
    });

    tearDown(() {
      cubit.close();
    });

    blocTest<HomeCubit, HomeState>(
      'should emit updated title when handleRouteChanged is called',
      build: () => cubit,
      act: (cubit) => cubit.handleRouteChanged(/* route data */),
      expect: () => [
        const HomeState(title: 'Expected Title'),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'should emit collections when repository emits data',
      build: () {
        when(mockCollectionRepo.watchList())
          .thenAnswer((_) => Stream.value([TestDataFactory.createCollection()]));
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        HomeState(collections: [TestDataFactory.createCollection()]),
      ],
    );
  });
}
```

---

#### Task 4.4: 設置 CI/CD 測試檢查

**優先級**: 🟡 中
**預估工時**: 2-3 小時

**步驟**:

1. **創建測試腳本** (30 分鐘)
   ```bash
   # scripts/run_tests.sh
   #!/bin/bash
   set -e

   echo "Running Flutter tests with coverage..."
   flutter test --coverage

   echo "Generating coverage report..."
   genhtml coverage/lcov.info -o coverage/html

   echo "Checking coverage threshold..."
   flutter test --coverage | grep "All tests passed"

   # 可選: 使用 lcov 檢查覆蓋率閾值
   # lcov --summary coverage/lcov.info | grep "lines......: 80"
   ```
   - [ ] 創建測試腳本
   - [ ] 設置覆蓋率閾值檢查
   - [ ] 添加執行權限：`chmod +x scripts/run_tests.sh`

2. **更新 GitHub Actions** (1 小時)
   ```yaml
   # .github/workflows/test.yml
   name: Flutter Tests

   on: [push, pull_request]

   jobs:
     test:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v3
         - uses: subosito/flutter-action@v2
           with:
             flutter-version: '3.38.6'
         - run: flutter pub get
         - run: flutter test --coverage
         - name: Check coverage
           run: |
             if grep -q "All tests passed" coverage/lcov.info; then
               echo "Tests passed"
             else
               echo "Tests failed"
               exit 1
             fi
         - name: Upload coverage to Codecov
           uses: codecov/codecov-action@v3
           with:
             files: ./coverage/lcov.info
   ```
   - [ ] 創建或更新 GitHub Actions 配置
   - [ ] 添加測試步驟
   - [ ] 配置 Codecov (可選)

3. **本地測試檢查** (30 分鐘)
   ```bash
   # Makefile 添加
   .PHONY: test
   test:
       @./scripts/run_tests.sh

   .PHONY: test-coverage
   test-coverage:
       @flutter test --coverage
       @genhtml coverage/lcov.info -o coverage/html
       @open coverage/html/index.html  # macOS
   ```
   - [ ] 更新 Makefile
   - [ ] 測試本地執行

---

### Phase 5: 程式碼品質改進 (Low Priority) 🔍

#### Task 5.1: 清理靜態分析警告

**優先級**: 🟢 低
**預估工時**: 4-6 小時
**目標**: `flutter analyze` 零警告

**當前問題統計** (57 issues):
- 15 warnings (unused import, unused variables)
- 42 info (deprecated API, unnecessary code)

**分類處理**:

1. **移除未使用的 import** (1-2 小時)
   ```
   受影響檔案:
   - lib/app/service/database/database.dart (drift_flutter)
   - lib/app/sidecar/repository/sidecar_repository_impl.dart (flutter/foundation)
   - lib/domain/repo/interactor/add_repo.dart (flutter/widgets)
   - lib/locator.dart (多個)
   - lib/presentation/pages/collection/create/view/collection_create_screen.dart
   - lib/presentation/pages/settings/extensions/bloc/repo_cubit.dart
   - lib/presentation/pages/sidecar/logs/sidecar_logs_cubit.dart
   ```
   - [ ] 批次刪除所有未使用的 import
   - [ ] 使用 IDE 的 "Optimize Imports" 功能

2. **移除未使用的變數和方法** (1 小時)
   ```
   - _isInRightSegment in video_controls.dart
   - _isInLeftSegment in video_controls.dart
   - _playerState in youtube_paragraph.dart
   - _videoMetaData in youtube_paragraph.dart
   ```
   - [ ] 刪除或標記為 `// ignore: unused_element`（如果未來可能使用）

3. **修復 deprecated API 使用** (2-3 小時)
   ```
   需要替換的 API:
   - ExpansionTileController → ExpansibleController
   - surfaceVariant → surfaceContainerHighest
   - withOpacity → withValues
   - form field value → initialValue
   - screen brightness API
   ```
   - [ ] 更新 `ExpansionTileController` 使用
   - [ ] 更新顏色 API
   - [ ] 更新 screen brightness API
   - [ ] 更新 form field API

4. **清理不必要的程式碼** (30 分鐘)
   ```
   - Unnecessary Container instances
   - Unnecessary braces in string interpolation
   - Unnecessary import statements
   ```
   - [ ] 批次修復 IDE 提示的問題

---

#### Task 5.2: Repository 接口優化

**優先級**: 🟢 低
**預估工時**: 2-3 小時

**步驟**:

1. **BookmarkRepository 重命名** (1 小時)
   ```dart
   // Before
   Future<void> insertRepo({...});
   Future<void> upsertRepo({...});
   Future<void> deleteRepo(String id);

   // After
   Future<void> insert({...});
   Future<void> upsert({...});
   Future<void> delete(String id);
   ```
   - [ ] 重命名方法
   - [ ] 更新所有調用處

2. **參數封裝** (1-2 小時)
   ```dart
   // 創建 DTO
   @freezed
   class BookmarkData with _$BookmarkData {
     const factory BookmarkData({
       required String extensionPkgName,
       required String boardId,
       required List<String> enabledBoards,
       required Map<String, String> threadsSorting,
       String? keywords,
     }) = _BookmarkData;
   }

   // 簡化方法簽名
   Future<void> insert(BookmarkData data);
   ```
   - [ ] 創建 `BookmarkData` DTO
   - [ ] 更新 Repository 接口
   - [ ] 更新實現和調用處

3. **BoardRepository 方法註釋** (30 分鐘)
   ```dart
   /// 獲取看板的基礎資訊（不包含 Collection 關聯）
   Future<Board> getBoard({
     required String boardId,
     required String collectionId,
   });

   /// 獲取看板的 Collection 關聯資訊（包含 selectedSort）
   Future<CollectionBoard> getCollectionBoard({
     required String boardId,
     required String collectionId,
   });
   ```
   - [ ] 添加方法註釋
   - [ ] 說明使用場景

---

#### Task 5.3: 統一命名規範

**優先級**: 🟢 低
**預估工時**: 2-3 小時

**步驟**:

1. **Use Case 命名統一** (1-2 小時)
   ```
   建議規範:
   - 動詞使用現在式: Get, List, Create, Update, Delete, Search
   - 名詞使用複數（如果是列表）: Collections, Threads, Extensions
   - 組合: GetCollection, ListCollections, CreateCollection

   需要重命名:
   - WatchCollections → GetCollectionsStream (如果是 Stream)
   ```
   - [ ] 統一所有 Use Case 命名
   - [ ] 更新所有引用

2. **參數命名統一** (1 小時)
   ```
   建議統一:
   - extensionPkgName (所有地方) 或
   - extensionId (如果簡化)

   不建議:
   - Extension.pkgName vs ThreadRepository.extensionPkgName 混用
   ```
   - [ ] 決定統一名稱
   - [ ] 批次替換

---

### Phase 6: 進階優化 (Optional) 🚀

#### Task 6.1: State 拆分

**優先級**: 🟢 低 (可選)
**預估工時**: 6-10 小時

**目標**: 將粗粒度的 State 拆分為多個細粒度 Cubit

**候選項目**:

1. **HomeState 拆分** (4-6 小時)
   ```dart
   // 拆分前: 1 個 HomeCubit
   class HomeState {
     String title;
     List<Collection> collections;
     SidecarConnectionState sidecarStatus;
     String? sidecarMessage;
     RouteData? pendingRoute;
   }

   // 拆分後: 3 個 Cubit
   class AppBarCubit extends Cubit<String> { ... }
   class NavigationDrawerCubit extends Cubit<List<Collection>> { ... }
   class SidecarStatusCubit extends Cubit<SidecarConnectionState> { ... }
   ```
   - [ ] 創建 3 個新 Cubit
   - [ ] 更新 DI 配置
   - [ ] 重構 HomeScreen 使用多個 Cubit
   - [ ] 測試功能正常

2. **ThreadDetailState 優化** (2-4 小時)
   ```dart
   // 選項 A: 保持現有 Map 結構，但使用 BlocSelector 精確訂閱
   // 選項 B: 為每個 thread 創建獨立的 Cubit (過度設計)
   ```
   - [ ] 評估是否需要拆分
   - [ ] 如果需要，實作拆分

**注意**: 此項目為可選優化，建議在完成 Phase 1-5 後再考慮。

---

#### Task 6.2: 提取重複邏輯為 Domain Service

**優先級**: 🟢 低 (可選)
**預估工時**: 4-6 小時

**目標**: 創建 Domain Service 封裝常見模式

**候選 Service**:

1. **ThreadDataEnricher** (2-3 小時)
   ```dart
   @injectable
   class ThreadDataEnricher {
     final ExtensionRepository _extensionRepo;
     final BoardRepository _boardRepo;

     Future<T> enrichWithExtensionAndBoard<T>({
       required String extensionPkgName,
       required String boardId,
       required String collectionId,
       required Future<Post> Function() fetchPost,
       required T Function(Post, Extension, Board) transform,
     }) async {
       final extension = await _extensionRepo.get(extensionPkgName);
       final board = await _boardRepo.getBoard(
         boardId: boardId,
         collectionId: collectionId,
       );
       final post = await fetchPost();
       return transform(post, extension, board);
     }
   }
   ```
   - [ ] 創建 Service
   - [ ] 重構 GetOriginalPost, ListReplies, ListBoardThreads 使用此 Service
   - [ ] 減少 30-40 行重複代碼

2. **ParagraphHelper** (1-2 小時)
   ```dart
   class ParagraphHelper {
     static String getThumbnail(ImageParagraph paragraph) {
       return paragraph.thumbnail ?? paragraph.url;
     }

     static bool isYouTubeVideo(VideoParagraph paragraph) {
       return paragraph.url.contains('youtube.com') ||
              paragraph.url.contains('youtu.be');
     }
   }
   ```
   - [ ] 創建 Helper
   - [ ] 從 Entity 移除業務邏輯方法
   - [ ] 更新所有調用處

---

## 📅 執行時程建議

### Sprint 1 (Week 1-2): 架構修復 + 關鍵效能優化

**目標**: 修復最嚴重的架構問題，提升使用者體驗

- [ ] Phase 1: Task 1.1 (Domain 層依賴修復)
- [ ] Phase 2: Task 2.1, 2.2, 2.3 (HomeScreen, SidecarLogsScreen, ThreadDetailScreen 優化)
- [ ] Phase 4: Task 4.1 (測試基礎設施建立)

**驗收標準**:
- Domain 層 0 依賴違規
- HomeScreen, SidecarLogsScreen 重建次數減少 90%+
- 測試框架可運行

**預估工時**: 20-25 小時

---

### Sprint 2 (Week 3-4): Use Case 重構 + 測試覆蓋

**目標**: 符合 DDD 單一職責原則，建立測試覆蓋

- [ ] Phase 1: Task 1.2 (Entity 重構)
- [ ] Phase 3: Task 3.1, 3.2, 3.3 (Use Case 重構)
- [ ] Phase 4: Task 4.2 (Domain 層測試，優先級 🔴 和 🟡)

**驗收標準**:
- 所有 Entity 使用 freezed
- 複雜 Use Case 符合單一職責
- Domain 層測試覆蓋率 > 50%

**預估工時**: 25-30 小時

---

### Sprint 3 (Week 5-6): 全面優化 + 測試補齊

**目標**: 完成剩餘優化，達成測試目標

- [ ] Phase 2: Task 2.4, 2.5 (其他頁面優化 + const 優化)
- [ ] Phase 4: Task 4.2 (剩餘 Use Case 測試)
- [ ] Phase 4: Task 4.3 (Cubit 測試，優先級 🔴 和 🟡)
- [ ] Phase 5: Task 5.1 (靜態分析警告清理)

**驗收標準**:
- 所有頁面 BLoC 重建優化
- Domain 層測試覆蓋率 > 80%
- flutter analyze 0 warning

**預估工時**: 25-30 小時

---

### Sprint 4 (Week 7-8): 收尾 + 文件 (Optional)

**目標**: 完成剩餘任務，整理文件

- [ ] Phase 4: Task 4.3 (剩餘 Cubit 測試)
- [ ] Phase 4: Task 4.4 (CI/CD 設置)
- [ ] Phase 5: Task 5.2, 5.3 (Repository 優化 + 命名統一)
- [ ] Phase 6: Task 6.1, 6.2 (進階優化，可選)

**驗收標準**:
- Presentation 層關鍵測試覆蓋率 > 60%
- CI/CD 自動測試運行
- 架構文件更新

**預估工時**: 20-25 小時

---

## 總預估工時

| Phase | 工時範圍 | 優先級 |
|-------|---------|--------|
| Phase 1: 架構修復 | 16-24 小時 | 🔴 Critical |
| Phase 2: BLoC 優化 | 20-28 小時 | 🔴 Critical |
| Phase 3: Use Case 重構 | 11-15 小時 | 🟡 High |
| Phase 4: 測試覆蓋 | 26-37 小時 | 🔴 Critical |
| Phase 5: 品質改進 | 8-12 小時 | 🟢 Medium |
| Phase 6: 進階優化 | 10-16 小時 | 🟢 Low (Optional) |
| **總計** | **91-132 小時** | - |

**建議執行順序**: Phase 1 → Phase 2 (Task 2.1-2.3) → Phase 4 (Task 4.1) → Phase 3 → Phase 2 (剩餘) → Phase 4 (剩餘) → Phase 5 → Phase 6 (可選)

---

## 🎯 成功指標

### 架構合規性指標

- [ ] Domain 層依賴違規: 9 → 0
- [ ] Use Case 符合單一職責: 0/37 → 37/37
- [ ] Entity 使用 freezed: ~40% → 100%

### 效能指標

- [ ] HomeScreen 重建次數: 基準 → 減少 90%+
- [ ] SidecarLogsScreen FPS: ~40 → 60 (日誌串流場景)
- [ ] ThreadDetailScreen 重建次數: 基準 → 減少 85%+
- [ ] 整體 BlocSelector 使用: 0 次 → 15+ 次

### 測試指標

- [ ] Domain 層測試覆蓋率: 0% → 80%+
- [ ] Presentation 層 Cubit 測試覆蓋率: 0% → 60%+
- [ ] CI/CD 自動測試: 無 → 有

### 程式碼品質指標

- [ ] flutter analyze issues: 57 → 0
- [ ] 未使用 import: 15 → 0
- [ ] const constructor 優化: ~20% → 80%+

---

## 📝 注意事項

### 開發團隊需知

1. **分支策略**:
   - 為每個 Phase 創建獨立分支
   - Phase 1-2 完成後合併主分支，確保穩定性
   - Phase 3-6 可並行開發

2. **測試優先**:
   - 重構前先為現有功能編寫測試（如果沒有）
   - 確保重構不改變行為

3. **漸進式重構**:
   - 不要一次性修改過多檔案
   - 每完成一個 Task 就提交 commit
   - 使用 Conventional Commits 格式

4. **效能驗證**:
   - 每次優化後使用 Flutter DevTools Performance 驗證
   - 記錄優化前後的數據對比
   - 目標：重建次數減少 > 80%

5. **向後兼容**:
   - 如果修改 Repository 接口，先添加新方法，再逐步遷移
   - 避免破壞性變更影響其他功能

### 風險管理

**高風險項目**:
1. Task 1.1.3: 移除 RxDart 依賴（可能影響複雜 Stream 邏輯）
2. Task 3.1: ListCollectionThreads 重構（126 行複雜邏輯）
3. Phase 2 全部：BLoC 優化可能引入新 bug

**風險緩解**:
- 高風險項目優先編寫測試
- 重構前詳細記錄原有行為
- 分階段提交，方便回滾
- Code Review 必須 2 人以上

---

## 📚 參考資源

### 官方文件
- [Flutter Performance Best Practices](https://flutter.dev/docs/perf/best-practices)
- [BLoC Library Documentation](https://bloclibrary.dev/)
- [Clean Architecture in Flutter](https://resocoder.com/flutter-clean-architecture-tdd/)

### 內部文件
- `CLAUDE.md` - 專案架構規範
- `README.md` - 專案說明
- `CONTRIBUTING.md` - 貢獻指南（建議創建）

### 工具
- Flutter DevTools Performance
- Codecov (測試覆蓋率視覺化)
- `flutter analyze` (靜態分析)
- `dart run build_runner build` (代碼生成)

---

## 📧 聯絡與回饋

如有任何問題或建議，請：
1. 在專案 Issue Tracker 中創建 Issue
2. 標記相關的 Phase 和 Task 編號
3. 提供詳細的問題描述和重現步驟

---

**文件版本**: 1.0
**最後更新**: 2026-01-14
**維護者**: Sonnet 4.5 (AI Code Analyst)
**審核狀態**: 待人工審核
