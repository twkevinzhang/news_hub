# Flutter 專案開發指導原則

## UI 設計規範

1. **Material Design 3 組件使用**
   - 所有 UI 組件必須使用 Material 3 (Material You) 組件
   - 使用 `ThemeData(useMaterial3: true)` 啟用 M3
   - 優先使用 M3 特有組件如 `FilledButton`、`NavigationBar`、`SearchBar` 等
   - 顏色系統使用 `ColorScheme` 而非硬編碼顏色值

## 開發流程規範

2. **版本控制**

   - 每完成一個獨立功能或重大階段性修改後,必須執行 git commit
   - Commit 時使用指定作者: `git commit --author="Gemini 3 Flash <noreply@google.com>" -m "commit message"`
   - Commit message 應清楚描述變更內容
   - Commit message 格式應該遵循 Angular Commit Message 格式: https://www.conventionalcommits.org/en/v1.0.0-beta.4/

3. **需求確認機制**

   - 當功能需求中使用的組件可能不是最佳選擇時,先列出:
     - 需求中提到的方案
     - 建議的替代方案
     - 各方案的優缺點對比
     - 等待確認後再開始實作

4. **模糊需求處理**

   - 遇到以下情況必須先詢問:
     - 需求描述不完整或有歧義
     - 業務邏輯不明確
     - 技術實現方案有多種選擇
   - 詢問時應列出可能的理解方向供選擇

5. **溝通語言**
   - 所有回覆、思考過程、代碼註解統一使用繁體中文

## 狀態管理規範

6. **BLoC 模式實作細則**
   - 嚴格遵循 BLoC 生命週期:初始化 → 事件處理 → 狀態發射 → 資源清理
   - 使用 `flutter_bloc` 套件的標準組件:`BlocProvider`、`BlocBuilder`、`BlocListener`、`BlocConsumer`
   - Event 命名使用過去式動詞 (如 `UserLoggedIn`、`DataFetched`)
   - State 使用不可變類別,善用 `Equatable` 或 `freezed` 進行狀態比對
   - 業務邏輯完全隔離在 BLoC 中,UI 層只負責渲染和事件觸發
   - 一個 BLoC 只負責一個特定功能領域,避免職責過重
   - 使用 `BlocObserver` 進行全局錯誤處理和日誌記錄
   - Stream 訂閱必須在 `close()` 方法中取消,避免內存洩漏
   - **效能要求**:優化 BLoC 狀態發射,減少不必要的重建,目標降低重建次數 > 80%

## 代碼品質規範

7. **Clean Code 實踐細則**

   - **命名規範**:

     - 類別名使用名詞或名詞片語 (如 `UserRepository`、`PaymentService`)
     - 方法名使用動詞或動詞片語 (如 `fetchUserData`、`calculateTotal`)
     - 布林變數使用 `is`、`has`、`can` 等前綴 (如 `isLoading`、`hasPermission`)
     - 避免使用縮寫,除非是業界通用術語 (如 `id`、`url`)

   - **方法設計**:

     - 單一方法長度不超過 20 行 (不含空行和大括號)
     - 一個方法只做一件事,符合單一職責原則
     - 參數數量不超過 3 個,超過則使用參數對象封裝
     - 避免使用輸出參數,使用返回值代替

   - **可讀性優先**:

     - 代碼邏輯應該自解釋,通過良好的命名和結構展現意圖
     - 只在「為什麼這樣做」而非「做了什麼」時才寫註解
     - 使用 Guard Clause (提前返回) 減少嵌套層級
     - 提取複雜條件判斷為命名清晰的方法

   - **文件註解要求**:

     - 所有公開 API (public classes, methods, properties) 必須有 Dart Doc 註解
     - 註解應說明功能、參數意義、返回值、可能的異常
     - 使用 `///` 格式撰寫文件註解,支援 IDE 智能提示

   - **錯誤處理**:
     - 使用 `Either`、`Result` 等類型處理可預期的錯誤
     - 異常只用於真正的異常情況
     - 錯誤信息應該有意義,能指導問題解決

## 架構設計規範

8. **DDD (領域驅動設計) 實踐細則**

   - **分層架構**:

     - `presentation` 層:UI 組件和 BLoC/Cubit
     - `domain` 層:業務邏輯、實體 (Entity)、用例 (Use Case)、倉儲接口 (Repository Interface)
     - `data` 層:數據模型 (Model)、倉儲實現、數據源 (API/Database)

   - **依賴規則**:

     - 依賴方向:presentation → domain ← data
     - domain 層不依賴任何外層,保持純粹的業務邏輯
     - 使用依賴注入 (如 `get_it`、`injectable`) 管理依賴關係

   - **核心概念實現**:

     - Entity:具有唯一標識的領域對象,包含業務邏輯
     - Value Object:無標識的不可變對象,使用 `freezed` 或 `equatable`
     - Use Case:每個用例一個類,命名如 `GetUserProfileUseCase`
     - Repository:定義接口在 domain,實現在 data

   - **可測試性保證**:
     - 所有 Use Case 必須可單元測試,不依賴 Flutter framework
     - Repository 使用接口,便於 Mock
     - BLoC 測試覆蓋所有關鍵業務流程
     - 使用 `mockito` 或 `mocktail` 進行依賴模擬
     - 關鍵業務邏輯測試覆蓋率應達 80% 以上

## 效能與品質要求

9. **效能指標**

   - 所有動畫保持 60 FPS (16.67ms/frame)

     - 使用 Flutter DevTools Performance 檢測幀率
     - 避免在 build 方法中執行耗時操作
     - 大列表使用 `ListView.builder` 或 `ListView.separated`

   - 頁面轉場流暢

     - 使用 Hero 動畫優化頁面切換
     - 預加載下一頁資源
     - 避免轉場時的同步耗時操作

   - 冷啟動時間 < 3 秒

     - 延遲載入非關鍵資源
     - 優化啟動畫面顯示邏輯
     - 使用 `--split-debug-info` 和 `--obfuscate` 減小包體積

   - BLoC 重建次數優化
     - 使用 `BlocSelector` 精確訂閱狀態變化
     - 合理使用 `buildWhen` 和 `listenWhen` 條件
     - 避免不必要的狀態發射
     - 目標:相比未優化版本減少重建次數 > 80%

10. **程式碼品質檢查**

    - 測試覆蓋率 > 80%

      - 執行 `flutter test --coverage` 生成覆蓋率報告
      - 重點覆蓋 domain 層和 BLoC 邏輯

    - 靜態分析零警告

      - 執行 `flutter analyze` 確保 0 critical warnings
      - 修復所有 error 級別問題
      - 處理重要的 warning 和 info 提示

    - API 文件完整性

      - 所有 public classes、methods、properties 必須有文件註解
      - 使用 `dartdoc` 生成 API 文件驗證完整性

    - CI/CD 檢查
      - 所有提交必須通過自動化測試
      - 通過程式碼風格檢查 (如 `flutter format`)
      - 通過靜態分析檢查

11. **使用者體驗驗證**

    - 無視覺閃爍

      - 避免在短時間內多次重建 Widget
      - 圖片載入使用淡入動畫或佔位符
      - 列表滾動時避免載入導致的抖動

    - 動畫連貫自然

      - 使用標準 Material 動畫曲線 (Curves.easeInOut 等)
      - 動畫時長遵循 Material Design 規範 (200-300ms)
      - 避免動畫卡頓或突兀

    - 狀態保持正確

      - 頁面返回時狀態保持 (使用 AutomaticKeepAliveClientMixin)
      - 應用切換後狀態恢復
      - 配置變更 (螢幕旋轉) 時狀態不丟失

    - 無記憶體洩漏
      - 所有 Stream、AnimationController 必須在 dispose 中釋放
      - 使用 Flutter DevTools Memory 檢測洩漏
      - BLoC 的 `close()` 方法正確實現

## 任務完成檢查清單

在宣告任務完成前,必須逐項確認:

### 代碼質量

- [ ] 執行 `flutter analyze`,確認 0 error 和 0 critical warning
- [ ] 執行 `flutter test --coverage`,確認測試覆蓋率 > 80%
- [ ] 所有公開 API 已添加文件註解
- [ ] 代碼符合 Clean Code 原則 (命名、方法長度、職責分離)

### 架構規範

- [ ] DDD 分層清晰,依賴方向正確
- [ ] 所有 Use Case 可單元測試
- [ ] Repository 使用接口抽象

### 狀態管理

- [ ] BLoC 生命週期正確實現
- [ ] Stream 訂閱已在 `close()` 中取消
- [ ] 優化了不必要的重建

### 效能與 UX

- [ ] 使用 DevTools 確認動畫保持 60 FPS
- [ ] 頁面轉場流暢無卡頓
- [ ] 無視覺閃爍或記憶體洩漏
- [ ] 狀態在頁面切換時正確保持

### 版本控制

- [ ] 已執行 git commit (使用指定 author)
- [ ] Commit message 清楚描述變更內容
