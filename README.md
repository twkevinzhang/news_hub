# news_hub

Browse between multiple forums.

## Road Map

- [x] 預覽 reply 的引用內容(ex. >>12345678 (我的家庭真可愛...) )
- [x] 點擊開啟樹狀留言圖 Dialog
- [x] Open Url in Browser
- [x] 像 Pitt 的點擊開圖
- [x] 將「播放影片」跟「點擊開圖」結合
- [x] 後端可以決定顯示多變的 Post layout
- [ ] 偵測連結開啟 App
- [ ] 閱讀歷史
- [ ] 收藏、備份
- [ ] 儲存搜尋條件作為書籤
- [ ] Web 登入取得 session cookies
- [ ] iOS App
- [ ] CI/CD (Github Action) integrate Renovate Bot or Sourcegraph Cody

## Development Method

1. 使用 python、lxml 撰寫爬蟲 Sidecar：[news_hub_extensions]
2. 使用 protobuf 定義資料結構：[news_hub_protos]
3. 使用 grpc 進行資料傳輸
4. 使用 flutter lib [flet-dev/serious-python] 將 python file 打包成 App
5. 在本 repo 中使用開發 UI 介面，得到最終產品

## Commands

```
make install  # 安裝依賴
make proto # 生成 proto
make sidecar  # 生成 sidecar
make build # 執行 dart build_runner
make run  # 執行 App 以及 Sidecar
```

[news_hub_extensions]: https://github.com/twkevinzhang/news_hub_extensions
[flet-dev/serious-python]: https://github.com/flet-dev/serious-python
