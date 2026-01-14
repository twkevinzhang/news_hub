# News Hub 重構計畫 v2.0 (Spec-Driven Development) 🚀

**建立日期**: 2026-01-14 (最後更新於 2026-01-14)
**目標**: 遵循 `GEMINI.md` 規範，達成 BLoC 重建次數減量 > 80%，Domain 層測試覆蓋率 > 80%，並達成架構與效能的全面合規。

---

## 📅 Phase 2: BLoC 效能與 UI 優化 (Performance & UX)

### Task 2.4: 關鍵頁面重建優化 (批次處理)

本任務旨在消除過廣的狀態訂閱 (`context.watch` 或缺乏 `Selector` 的 `BlocBuilder`)，目標重建次數減少 > 80%。

#### 2.4.1 AppNavigationDrawer (側邊欄狀態提升與優化) ⭐⭐⭐

**問題描述**:

- 目前使用 `BlocBuilder<HomeCubit, HomeState>`，每當 Sidecar 狀態或任何 Collection 更新時，整個側邊欄都會重建。
- 「一次僅展開一個集合」的邏輯由 View 層的 `ExpansionTileController` 維護，違反「狀態提升 (Lifting State Up)」原則。

**重構規格 (SDD)**:

1.  **狀態提升**: 在 `HomeState` 新增 `expandedCollectionId` (String?)。
2.  **邏輯遷移**: 將展開/摺疊邏輯移至 `HomeCubit.toggleCollectionExpansion(String id)`。
3.  **細粒度訂閱**:
    - 主列表透過 `BlocSelector` 監聽 `collections.length`。
    - 集合區塊 (`_CollectionSection`) 獨立訂閱特定索引的 ID 與 `expandedCollectionId`。
    - 看板列表 (`ListTile`) 應標記為 `const` 並與展開邏輯隔離。

#### 2.4.2 BoardsPickerScreen (看板選擇器卡片優化) ⭐⭐

**問題描述**:
`_BoardCard` 使用 `context.watch`。勾選單一看板會觸發畫面上所有卡片（可能數十個）重繪。

**重構規格 (SDD)**:

1.  **精確篩選**: `_BoardCard` 必須移除 `context.watch`，改用 `context.select<BoardsPickerCubit, bool>((c) => c.getBoardCheckboxValue(board.id))`。
2.  **驗證**: 使用 DevTools 確保勾選時，非相關卡片的 `rebuilds` 計數維持 0。

#### 2.4.3 其他受影響頁面

- **CollectionBoardThreadListScreen**: 移除 `context.watch` 與 `Builder`，透過 `context.read` 獲取 `pagingController`。
- **CollectionManageScreen**: AppBar 標題與按鈕分別獨立使用 `BlocSelector` 監聽 `isSortingMode`，避免中間列表因標題切換而重跑。
- **SearchScreen**: 移除 `context.watch`，僅使用 `BlocSelector` 監測搜尋過濾器。

---

### Task 2.5: Const Constructor 全域優化

**目標**: 消除所有 `prefer_const_constructors` 警告，降低記憶體開銷與 Widget 實例化負擔。

**執行步驟**:

1.  執行 `dart fix --apply` 修復明顯缺失。
2.  **重點區域**: 優化 `itemBuilder` 內的靜態裝飾組件（`Padding`, `SizedBox`, `Divider`, `Icon`）。
3.  **豁免條款**: 若第三方套件組件不支援 `const` constructor，則直接跳過。

---

## 📅 Phase 3: Use Case 重構 (Architecture & Responsibility)

### Task 3.1: 簡化 ListCollectionThreads (符合單一職責) 🔧

**問題描述**:
該 Use Case 目前長達 126 行，同時負責 Collection 獲取、並行協調、Stream 合併等 5 個職責。

**重構規格**:

1.  **拆分為 3 個細小 Use Case**:
    - `PrepareBoardDataForCollection`: 準備看板基礎資料。
    - `FetchThreadsForBoard`: 負責單一看板的網路請求。
    - `EnrichPostWithExtensionAndBoard`: 負責貼文資料與元數據的組裝。
2.  **主 Use Case 職責**: 僅負責調用 `Stream.fromFutures` 或 `Stream.merge` 進行協調。
3.  **移除 `StreamGroup`**: 使用 Dart 原生 API 減少外部依賴。

---

## 📅 Phase 4: 測試覆蓋率提升 (Quality & Confidence) 🧪

### Task 4.1: 建立測試基礎設施

**執行步驟**:

1.  建立 Mock 注入環境（使用 `mockito` 產生所有 Repository 的 Mock 類別）。
2.  撰寫 `TestDataFactory`：提供標準化的 `Collection`、`Board`、`ArticlePost` 測試資料產生器。

### Task 4.2: Domain 層 Use Case 測試 (目標覆蓋率 > 80%)

**重點測試對象**:

- **🔴 複雜邏輯**: `ListCollectionThreads`, `SearchThreads`, `ListExtensions`。
- **🟡 核心業務**: `GetCollections`, `ListBoardThreads`, `GetOriginalPost`。

### Task 4.3: Presentation 層 Cubit 測試 (目標覆蓋率 > 60%)

**測試範例 (使用 `bloc_test`)**:

- 驗證 `HomeCubit` 在路由切換時正確發射 state。
- 驗證 `ThreadDetailCubit` 正確處理分頁載入失敗的情境。

---

## 🛠 驗收標準 (Overall DoD)

1.  **效能**: 透過 Flutter DevTools 確認關鍵路徑重建次數下降 80%+。
2.  **品質**: `flutter analyze` 達成 0 warnings。
3.  **測試**: `flutter test --coverage` 產出報告，Domain 層覆蓋率需超越 80%。
4.  **合規**: 檔案結構與依賴方向嚴格遵循 `GEMINI.md` 的 DDD 規範。
