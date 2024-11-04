#!/bin/bash

# 配置私钥和 RPC URL

CONFIG_PATH="./config/config.json"

# 检查配置文件是否存在
if [ ! -f "$CONFIG_PATH" ]; then
    echo "配置文件 $CONFIG_PATH 不存在。请先生成配置文件。"
    exit 1
fi

# 提示用户输入私钥
while true; do
    read -rp "请输入您的私钥（以 0x 开头）: " PRIVATE_KEY
    if [[ "$PRIVATE_KEY" =~ ^0x[a-fA-F0-9]{40}$ ]]; then
        break
    else
        echo "无效的私钥格式，请重新输入。"
    fi
done

# 提示用户输入 RPC URL
while true; do
    read -rp "请输入您的 RPC URL: " RPC_URL
    if [[ "$RPC_URL" =~ ^https?:// ]]; then
        break
    else
        echo "无效的 RPC URL，请以 http:// 或 https:// 开头。"
    fi
done

# 更新配置文件
jq --arg key "$PRIVATE_KEY" --arg url "$RPC_URL" \
   '.chain.wallet.private_key = $key | .chain.rpc_url = $url' \
   "$CONFIG_PATH" > tmp.$$.json && mv tmp.$$.json "$CONFIG_PATH"

echo "私钥和 RPC URL 已更新到 $CONFIG_PATH。"
