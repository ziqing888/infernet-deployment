#!/bin/bash

# 导入配置文件路径
CONFIG_PATH="./config/config.json"

# 检查 jq 是否安装
if ! command -v jq &> /dev/null; then
    echo "jq 未安装，请先安装 jq。"
    exit 1
fi

# 从 config.json 读取私钥和 RPC URL
PRIVATE_KEY=$(jq -r '.chain.wallet.private_key' "$CONFIG_PATH")
RPC_URL=$(jq -r '.chain.rpc_url' "$CONFIG_PATH")

# 检查私钥和 RPC URL 是否成功读取
if [[ -z "$PRIVATE_KEY" || -z "$RPC_URL" ]]; then
    echo "错误：未能读取私钥或 RPC URL，请检查 config.json 文件。"
    exit 1
fi

# 检查是否已安装 forge
if ! command -v forge &> /dev/null; then
    echo "Foundry 未安装。请先安装 Foundry。"
    exit 1
fi

# 编译合约
echo "编译合约..."
if forge build; then
    echo "合约编译成功。"
else
    echo "合约编译失败，请检查代码。"
    exit 1
fi

# 部署合约
echo "部署合约..."
forge script script/Deploy.s.sol:Deploy --broadcast --rpc-url "$RPC_URL" --private-key "$PRIVATE_KEY"

