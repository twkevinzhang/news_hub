#!/bin/bash

# 檢查是否有傳入參數
if [ "$#" -eq 0 ]; then
    echo "使用方式: $0 <command>"
    exit 1
fi

# 將使用者的指令組合成字串
USER_COMMAND="$@"

# 使用 adb exec-out 執行該指令
adb exec-out run-as tw.kevinzhang.news_hub $USER_COMMAND
