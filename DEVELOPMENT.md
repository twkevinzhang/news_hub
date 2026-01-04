# 開發指南 (Development Guide)

## Sidecar 伺服器配置

本專案使用 gRPC 與 Sidecar 伺服器通訊。為了避免在程式碼中寫死 IP 位址，我們提供了多種配置方式。

### 配置優先順序

1. **Makefile 參數** - 手動指定 `SIDECAR_HOST`（最高優先）
2. **編譯時環境變數** (`--dart-define`) - 直接使用 flutter run
3. **預設值** (`127.0.0.1:55001`) - 未設定任何環境變數時使用

> **重要**：執行 `make run` 時，預設使用本地 127.0.0.1:55001，**不會**自動連接遠端。只有手動指定 `SIDECAR_HOST` 參數時才會連接到其他伺服器。

### 方法 1：使用編譯時環境變數 (推薦給開發者)

#### Makefile 方式 (最簡單 ⭐)

```bash
# 查看當前的網路資訊
make sidecar-info

# 本地開發（預設使用 127.0.0.1:55001）
make run

# 連接到遠端 Sidecar（使用 mDNS）
make run SIDECAR_HOST=zhangzhenlongdeMacBook-Air.local

# 連接到遠端 Sidecar（使用 IP）
make run SIDECAR_HOST=192.168.1.100

# 指定不同的埠號
make run SIDECAR_HOST=192.168.1.100 SIDECAR_PORT=55002
```

#### 命令列方式

```bash
# 開發時指定遠端伺服器
flutter run --dart-define=SIDECAR_HOST=192.168.1.100 --dart-define=SIDECAR_PORT=55001

# 使用本地伺服器（預設）
flutter run
```

#### VS Code 配置

在 `.vscode/launch.json` 中新增配置：

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter (Local Sidecar)",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart"
    },
    {
      "name": "Flutter (Remote Sidecar)",
      "request": "launch",
      "type": "dart",
      "program": "lib/main.dart",
      "args": [
        "--dart-define=SIDECAR_HOST=192.168.1.100",
        "--dart-define=SIDECAR_PORT=55001"
      ]
    }
  ]
}
```

### 方法 2：使用 .env 檔案 (保留，未來可擴展)

已提供 `.env.example` 範本檔案，`.env` 已加入 `.gitignore`。未來可搭配 `flutter_dotenv` 套件實作。

### 方法 3：App 內設定 (已實作，未來擴展)

`SidecarPreferences` 已實作 `host` 和 `port` 偏好設定。未來可以實作：
- 在設定頁面提供 UI 讓使用者修改
- 實作連線重新建立功能以支援動態切換伺服器

## 安全性注意事項

⚠️ **絕對不要將實際的遠端 IP 位址提交到 git！**

- ✅ 使用 `--dart-define` 在本地開發
- ✅ 使用 `.env` 檔案（已加入 .gitignore）
- ✅ 在 App 內提供設定介面
- ❌ 不要在程式碼中寫死 IP 位址
- ❌ 不要在 commit message 中包含 IP 位址

## 常見問題

### Q: 如何查看當前使用的伺服器位址？

A: 啟動 App 時會在 console 印出：`Sidecar gRPC connecting to: <host>:<port>`

### Q: 我的 IP 經常變動怎麼辦？

A: 
1. 使用 VS Code launch configuration，方便切換
2. 或在 App 內設定頁面動態修改
3. 考慮使用固定 IP 或 hostname

### Q: 可以使用 hostname 嗎？

A: 可以！`SIDECAR_HOST` 支援 IP 位址或 hostname (例如：`my-server.local`)

## 範例

### 開發場景 1：查看網路資訊
```bash
make sidecar-info
# ==========================================
#   Sidecar 網路資訊
# ==========================================
# 本機 mDNS 名稱: zhangzhenlongdeMacBook-Air.local
# 本機 IP 位址:
#   - 10.69.71.136
#
# 使用方式：
#   make run                                    # 使用預設 (127.0.0.1:55001)
#   make run SIDECAR_HOST=<mDNS或IP>           # 連接到指定伺服器
# ==========================================
```

### 開發場景 2：本地開發（預設）
```bash
make run
# 🚀 Starting Flutter (使用預設 127.0.0.1:55001)
```

### 開發場景 3：連接到本機的 Sidecar（使用 mDNS）
```bash
make run SIDECAR_HOST=zhangzhenlongdeMacBook-Air.local
# 🚀 Starting Flutter with Sidecar: zhangzhenlongdeMacBook-Air.local:55001
```

### 開發場景 4：連接到同事的機器（使用 IP）
```bash
make run SIDECAR_HOST=192.168.1.50
# 🚀 Starting Flutter with Sidecar: 192.168.1.50:55001
```

### 開發場景 5：使用不同的埠號
```bash
make run SIDECAR_HOST=192.168.1.100 SIDECAR_PORT=55002
# 🚀 Starting Flutter with Sidecar: 192.168.1.100:55002
```
