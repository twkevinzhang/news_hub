# 開發指南 (Development Guide)

## Flutter Flavors (開發版本隔離)

為了加速開發並優化發佈流程，本專案使用了 Flutter Flavors。目前分為兩個版本：

1. **Sidecar 版本**:
   - 包含本地 Python 執行環境。
   - 每次啟動或打包時，若有資源變動，需要執行較耗時的 Sidecar 打包流程。
2. **Remote 版本**:
   - **不包含**本地 Python 環境。
   - 僅透過 gRPC 連接到遠端（或開發機上獨立運行的）Sidecar 伺服器。
   - **優點**: 跳過打包 Sidecar 的時間，開發與編譯速度極快。

---

## Sidecar 伺服器配置

本專案使用 gRPC 與 Sidecar 伺服器通訊。

### 配置優先順序

1. **Makefile 參數** - 手動指定 `SIDECAR_HOST`（最高優先）
2. **編譯時環境變數** (`--dart-define`) - 直接使用 flutter run
3. **預設值** (`127.0.0.1:55001`) - 未設定任何環境變數時使用

### 常用開發指令 (Makefile)

#### 運行專案 (Run) ⭐

```bash
# 1. 運行預設版本 (Sidecar 分支，含本地 Python)
make run-sidecar

# 2. 運行遠端版本 (Remote 分支，速度最快，需指定遠端 IP)
make run-remote SIDECAR_HOST=10.69.71.136

# 註：直接執行 `make run` 等同於 `make run-sidecar`
```

#### 打包發佈 (Build)

```bash
# 打包 APK - Sidecar 版本 (含 Python 環境)
make build-sidecar

# 打包 APK - Remote 版本 (不含 Python，適合遠端測試)
make build-remote
```

#### 查看網路資訊

```bash
# 查看當前機器的 IP 與 mDNS 名稱，方便遠端連線測試
make sidecar-info
```

---

### VS Code 配置

在 `.vscode/launch.json` 中新增配置以支援不同的 Flavor：

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter (Sidecar Local)",
      "request": "launch",
      "type": "dart",
      "args": ["--flavor", "sidecar", "-t", "lib/main_sidecar.dart"]
    },
    {
      "name": "Flutter (Remote Sidecar)",
      "request": "launch",
      "type": "dart",
      "args": [
        "--flavor",
        "remote",
        "-t",
        "lib/main_remote.dart",
        "--dart-define=SIDECAR_HOST=10.69.71.136"
      ]
    }
  ]
}
```

---

## 安全性注意事項

⚠️ **絕對不要將實際的遠端 IP 位址提交到 git！**

- ✅ 使用 `--dart-define` 或 Makefile 參數在本地開發
- ✅ 在 App 內提供設定介面
- ❌ 不要在程式碼中寫死 IP 位址
- ❌ 不要在 commit message 中包含 IP 位址

## 常見問題

### Q: 為什麼要分兩個版本？

A: 打包 Sidecar（Python 編譯與打包）通常需要數十秒甚至一分鐘。如果您只是在調整 UI 或與遠端伺服器對接，使用 `Remote` 版本可以節省大量開發等待時間。

### Q: iOS 支授嗎？

A: Flavorizr 已生成基本的 iOS 配置，但可能需要手動在 Xcode 中調整或安裝 `xcodeproj` gem 進行完整自動化配置。

### Q: 如何連接到同事的機器？

A:

1. 同事在其機器啟動 Sidecar (`make -C sidecar run`)
2. 您使用 `make run-remote SIDECAR_HOST=<同事的IP>` 啟動 App。
