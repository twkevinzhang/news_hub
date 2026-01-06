# CLAUDE.md

本文件為 Claude Code (claude.ai/code) 在本 repository 中工作時的指導文件。

## 專案概覽

News Hub 是一個使用 Flutter(前端)和 Python(後端 sidecar 服務)構建的多論壇瀏覽應用。應用允許用戶通過動態安裝的擴展功能瀏覽多個論壇,Flutter 應用與 Python sidecar 之間通過 gRPC 進行通信。

**核心技術:**

- Flutter 3.29+ with Dart 3.7+
- Python 3.8+ for sidecar service
- gRPC for client-server communication
- Protocol Buffers for data serialization
- serious_python for embedding Python in Flutter apps

## 常用指令

### 開發環境設置

```bash
make install           # 安裝 Flutter 依賴
cd sidecar && pip install -r requirements.txt  # 安裝 Python 依賴
```

### 構建與運行

```bash
make run              # 使用本地 sidecar 運行應用 (127.0.0.1:55001)
make run SIDECAR_HOST=192.168.1.100  # 使用遠程 sidecar 運行
make build            # 運行 dart build_runner
make proto            # 為 Dart 和 Python 生成 protobuf 文件
make sidecar          # 構建 sidecar 發布包
```

### Sidecar 開發

```bash
cd sidecar/src && python main.py  # 直接運行 sidecar (port 55001)
make -C sidecar run               # 另一種運行 sidecar 的方式
python -m pytest tests/           # 運行所有 sidecar 測試
python -m pytest tests/unit/test_extension_entity.py  # 運行特定測試
python -m pytest --cov=. --cov-report=html tests/     # 運行測試並生成覆蓋率報告
```

### 代碼生成

```bash
dart run build_runner build --delete-conflicting-outputs  # 生成 Dart 代碼
dart run build_runner watch --delete-conflicting-outputs  # 監視模式
```

### 代碼檢查與分析

```bash
flutter analyze                    # 分析 Dart 代碼
cd sidecar && python3 -m flake8 src --select=E9,F63,F7,F82 --count  # 檢查 Python 代碼
```

### 日誌查看 (Android)

```bash
make log  # 從 Android 設備查看 sidecar 日誌
```

## 架構設計

### Flutter 應用架構 (Clean Architecture with DDD)

Flutter 應用遵循 Clean Architecture 原則,分為 3 個主要層次:

```
lib/
├── domain/          # 業務邏輯層 (entities, repositories, use cases)
│   ├── models/      # 核心領域模型 (freezed classes)
│   ├── */repository.dart      # Repository 接口
│   └── */interactor/          # Use cases/interactors
├── app/             # 實現層 (repository 實現, services)
│   ├── service/     # 基礎設施服務 (API, database, cache, logging)
│   │   ├── api/     # gRPC 客戶端實現 (SidecarApiImpl)
│   │   ├── database/  # Drift 數據庫
│   │   └── connection/  # gRPC 連接管理器
│   ├── bookmark/    # Bookmark repository 實現
│   ├── collection/  # Collection repository 實現
│   ├── extension/   # Extension repository 實現
│   └── sidecar/     # Sidecar 偏好設置和 repository
└── presentation/    # UI 層 (screens, widgets, BLoC/Cubit)
    ├── pages/       # 頁面實現
    ├── components/  # 可重用 UI 組件
    └── router/      # AutoRoute 配置
```

**關鍵模式:**

- **依賴注入**: GetIt + Injectable 進行 DI (見 `lib/locator.dart`)
- **狀態管理**: BLoC/Cubit (flutter_bloc)
- **導航**: AutoRoute 進行類型安全路由
- **數據庫**: Drift 進行本地持久化
- **代碼生成**: freezed 用於不可變模型, injectable 用於 DI, auto_route 用於路由, drift 用於數據庫

**Domain 層依賴限制**: 僅允許 get_it, injectable, dartx, freezed, json_annotation 和 flutter/foundation.dart。不允許其他 Flutter 或基礎設施依賴。

### Sidecar 架構 (Domain-Driven Design)

Python sidecar 遵循 DDD 原則,嚴格分層:

```
sidecar/src/
├── domain/           # 核心業務邏輯 (無外部依賴)
│   ├── entities/     # 可變業務實體 (Extension)
│   ├── value_objects/  # 不可變值對象 (ExtensionMetadata)
│   └── repositories/   # Repository 接口 (僅契約)
├── application/      # 用例和應用服務
│   ├── use_cases/    # 業務操作 (InstallExtension 等)
│   └── services/     # 應用服務 (ExtensionInstaller, ExtensionLoader)
├── infrastructure/   # 技術實現
│   ├── repositories/ # Repository 實現 (基於文件)
│   ├── downloaders/  # HTTP 下載器
│   └── file_system/  # 文件操作管理器
├── presentation/     # 外部接口
│   └── grpc/         # gRPC 服務實現
└── shared/           # 橫切關注點 (config, DI, logging)
```

**核心原則:**

- 依賴倒置 (高層不依賴低層)
- 每個組件單一職責
- 所有組件設計為可測試,使用依賴注入
- Repository 模式抽象數據訪問

### gRPC 通信

應用使用 protobuf 定義的 gRPC 服務進行所有客戶端-服務器通信。Proto 文件位於 `news_hub_protos/`,生成的代碼位於:

- Dart: `lib/app/service/api/models/sidecar_api.pb*.dart`
- Python: `sidecar/src/sidecar_api_pb2*.py`

**主要 gRPC 操作:**

- 擴展管理: ListInstalledExtensions, InstallExtension, UninstallExtension
- 論壇操作: GetSite, GetBoards, GetThreadInfos, GetThreadPost
- 所有操作委託給動態加載的擴展，並在非同步環境下透過執行緒池執行以確保不阻塞。

### 擴展系統

擴展是動態安裝的 Python 包,實現特定論壇的爬蟲邏輯:

- 擴展在構建期間從 GitHub repos 克隆
- 必須在 `resolver_impl.py` 中實現 `ResolverImpl` 類
- 可包含 `requirements.txt` 用於依賴
- 元數據存儲在 `metadata.json`
- 擴展通過 serious_python 合併並打包到應用中

## Sidecar 服務器配置

應用支持靈活的 sidecar 服務器配置:

**優先級順序:**

1. Makefile 參數 (`SIDECAR_HOST`)
2. 編譯時環境變量 (`--dart-define`)
3. 默認值 (`127.0.0.1:55001`)

**示例:**

```bash
make sidecar-info  # 顯示網絡信息
make run           # 使用默認本地服務器
make run SIDECAR_HOST=192.168.1.100  # 連接到遠程 IP
make run SIDECAR_HOST=my-server.local  # 連接到主機名/mDNS
```

**安全性:** 永遠不要將實際遠程 IP 地址提交到 git。使用 `--dart-define` 進行本地開發或在應用內實現設置 UI。

## Flutter 開發規範

### UI 設計規範

1. **Material Design 3 組件使用**
   - 所有 UI 組件必須使用 Material 3 (Material You) 組件
   - 使用 `ThemeData(useMaterial3: true)` 啟用 M3
   - 優先使用 M3 特有組件如 `FilledButton`、`NavigationBar`、`SearchBar` 等
   - 顏色系統使用 `ColorScheme` 而非硬編碼顏色值

### 開發流程規範

2. **版本控制**

   - 功能開發任務：

     - 每完成一個獨立功能或重大修改後，必須執行 git commit。
     - Commit 時使用指定作者: `git commit --author="Gemini 3 Flash <noreply@google.com>" -m "commit message"`
     - Commit message 應清楚描述變更內容
     - Commit message 格式應該遵循 Conventional Commits: https://www.conventionalcommits.org/en/v1.0.0-beta.4/

   - Bug 修復任務 (豁免條款)：

     - **嚴禁執行 git commit。**
     - AI 於修復完成並通過自動化測試後，應列出修復的邏輯點並**直接宣告任務結束**。

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

### 狀態管理規範

5. **BLoC 模式實作細則**
   - 嚴格遵循 BLoC 生命週期:初始化 → 事件處理 → 狀態發射 → 資源清理
   - 使用 `flutter_bloc` 套件的標準組件:`BlocProvider`、`BlocBuilder`、`BlocListener`、`BlocConsumer`
   - Event 命名使用過去式動詞 (如 `UserLoggedIn`、`DataFetched`)
   - State 使用不可變類別,善用 `Equatable` 或 `freezed` 進行狀態比對
   - 業務邏輯完全隔離在 BLoC 中,UI 層只負責渲染和事件觸發
   - 一個 BLoC 只負責一個特定功能領域,避免職責過重
   - 使用 `BlocObserver` 進行全局錯誤處理和日誌記錄
   - Stream 訂閱必須在 `close()` 方法中取消,避免內存洩漏
   - **效能要求**:優化 BLoC 狀態發射,減少不必要的重建,目標降低重建次數 > 80%

### 代碼品質規範

6. **Clean Code 實踐細則**

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

     - 盡可能不要寫「做了什麼」的註解,用 Clean Code 的方法,用 function 呼叫邏輯以及命名來表達邏輯

   - **錯誤處理**:
     - 使用 `Either`、`Result` 等類型處理可預期的錯誤
     - 異常只用於真正的異常情況
     - 錯誤信息應該有意義,能指導問題解決

### 架構設計規範

7. **DDD (領域驅動設計) 實踐細則**

   - **分層架構** (本專案已實現):

     - `presentation` 層:UI 組件和 BLoC/Cubit
     - `domain` 層:業務邏輯、實體 (Entity)、用例 (Use Case)、倉儲接口 (Repository Interface)
     - `app` 層:數據模型 (Model)、倉儲實現、數據源 (API/Database)

   - **依賴規則**:

     - 依賴方向:presentation → domain ← app
     - domain 層不依賴任何外層,保持純粹的業務邏輯
     - 使用依賴注入 (GetIt + Injectable) 管理依賴關係

   - **核心概念實現**:

     - Entity:具有唯一標識的領域對象,包含業務邏輯
     - Value Object:無標識的不可變對象,使用 `freezed` 或 `equatable`
     - Use Case:每個用例一個類,命名如 `GetUserProfileUseCase`
     - Repository:定義接口在 domain,實現在 app

   - **可測試性保證**:
     - 所有 Use Case 必須可單元測試,不依賴 Flutter framework
     - Repository 使用接口,便於 Mock
     - BLoC 測試覆蓋所有關鍵業務流程
     - 使用 `mockito` 或 `mocktail` 進行依賴模擬
     - 關鍵業務邏輯測試覆蓋率應達 80% 以上

### 效能與品質要求

8.  **效能指標**

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
      - 目標：相比「未優化版本」(即直接對整個頁面進行 BlocBuilder)，減少重建次數 > 80%。
      - 具體基準：單次狀態更新應僅觸發「直接相關」的 Widget 重建。嚴禁導致無關的 AppBar、BottomNavigationBar 或背景組件被重新 build。

9.  **程式碼品質檢查**

    - 測試覆蓋率 > 80%

      - 執行 `flutter test --coverage` 生成覆蓋率報告
      - 核心範圍覆蓋率 > 80%：重點鎖定於 `domain` 層 (Use Cases, Entities) 以及 `presentation` 層的 `BLoC/Cubit` 邏輯。
      - UI 組件 (Widgets) 與基礎設施實作 (Infrastructure/App 層) 不強制要求 80% 覆蓋率，但關鍵 Repository 實作應有單元測試。

    - 靜態分析零警告

      - 執行 `flutter analyze` 確保 0 critical warnings
      - 修復所有 error 級別問題
      - 處理重要的 warning 和 info 提示

    - CI/CD 檢查
      - 所有提交必須通過自動化測試
      - 通過程式碼風格檢查 (如 `flutter format`)
      - 通過靜態分析檢查

10. **使用者體驗驗證**

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

11. **AI 診斷與自我審計規範 (Metacognitive Monitoring)**
    為了防止 AI 陷入無效的邏輯死循環並優化 Token 消耗，AI 在執行任務時必須遵循以下協議：

    - 防止邏輯死循環 (Loop Detection):

      - 在提出建議前，檢查該建議是否與前兩次嘗試高度相似。
      - 若在沒有獲得新日誌或錯誤訊息的情況下，重複要求修改同一段代碼，必須立即停止並承認陷入盲點。

    - 層級切換診斷 (Architectural Skepticism):

      - 若代碼邏輯（語法、if/else）看起來正確但執行失敗（如：客戶端 Loading 超時），必須從代碼層面轉向架構層面檢查。
      - **核心檢查點**：gRPC 執行緒池 (MAX_WORKERS)、Streaming 請求是否佔滿資源、併發死鎖、網路緩存、依賴注入實例化失敗。

    - 執行緒與併發警示:

      - Sidecar 使用 `grpc.aio` 非同步伺服器。大部分 Streaming 請求（如 WatchHealth 和 WatchLogs）運行在非同步事件迴圈中。
      - 對於同步的擴展開發或 IO 操作，應使用 `run_in_executor` 委託給執行緒池。
      - 超時定義：本專案 gRPC 請求的超時判定基準為 `10 秒`。若超過此閾值，AI 必須停止重試並轉向架構層面檢查。

    - 中斷與人工干預 (Interruption Protocol):

      - 若連續 2 次嘗試失敗，AI 應停止自動嘗試。
      - 動作：列出已排除的可能性，請求使用者提供更高層級的診斷（如：netstat 狀態、執行緒堆疊、環境變數）。
      - 例外：除非使用者標註 [我在睡覺/請勿打擾]，否則禁止在無把握時盲目消耗 Token。

    - 擴展系統 (Extension System) 異常處置:

      - 若發生擴展包依賴衝突、`requirements.txt` 安裝失敗或 `serious_python` 運行期環境限制（如 C 擴展不支援），AI 應立即觸發「自我審計協議」，停止盲目修改代碼，並向使用者回報可能的環境隔離問題或依賴衝突。

## 重要注意事項

### Protobuf 變更

修改 `news_hub_protos/` 中的 `.proto` 文件時:

1. 運行 `make proto` 重新生成 Dart 和 Python 代碼
2. 相應更新 Flutter 應用和 sidecar 服務
3. 確保向後兼容或協調破壞性變更

### 代碼生成

本項目高度依賴代碼生成。修改以下內容後:

- `@freezed` 類 → 運行 `make build`
- `@injectable` 類 → 運行 `make build`
- `@AutoRoute` 註解 → 運行 `make build`
- Drift 表 → 運行 `make build`

### 擴展開發

在 sidecar 構建期間添加新擴展:

```bash
make sidecar ADD_REPO=https://github.com/user/repo ADD_EXTENSION=extension_name
```

### 測試策略

**Flutter:**

- Widget 測試用於 UI 組件
- Unit 測試用於 use cases/interactors
- Integration 測試用於 repositories,使用 mocked gRPC

**Python Sidecar:**

- Unit 測試 (domain 層 80%+ 覆蓋率),使用 mocked 依賴
- Integration 測試用於組件交互
- 提交前運行 `make -C sidecar lint`

### 依賴注入

**Flutter:** 服務在 `lib/locator.dart` 中註冊,使用 `@injectable`、`@singleton` 或 `@lazySingleton` 註解。使用 `sl<Type>()` 或構造函數注入來解析。

**Python:** 通過 `shared/dependency_container.py` 中的 `DependencyContainer` 進行手動 DI。所有依賴顯式連接。

### 格式化配置

Dart formatter 使用 160 字符頁寬 (見 `analysis_options.yaml`)。不要在 80 字符處手動換行。

## 任務完成檢查清單

在宣告任務完成前,必須逐項確認:

### 代碼質量

- [ ] 執行 `flutter analyze`,確認 0 error 和 0 critical warning
- [ ] 執行 `flutter test --coverage`,確認測試覆蓋率 > 80%
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
- [ ] Commit message 遵循 Conventional Commits 格式

### 關於修復任務的指令，AI 應自我審計：

- [ ] **是否避開了 Token 陷阱？**確認沒有重複建議已嘗試過的方案。
- [ ] **環境因素確認？** 若涉及連線或異步問題，是否已確認非 MAX_WORKERS 或執行緒阻塞引起。
- [ ] **透明度報告**：是否已向使用者說明目前的診斷假設。

## Git 工作流程

Current branch: feat/ai-sidecar-task
Main branch: master (使用此分支提交 PR)

提交變更時,如果修改了 proto 定義或跨層級功能,請同時包含 Flutter 和 sidecar 的變更。
