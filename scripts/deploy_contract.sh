#!/bin/bash

# 导入配置文件路径
CONFIG_PATH="./config/config.json"

# 从 config.json 读取私钥和 RPC URL
PRIVATE_KEY=$(jq -r '.chain.wallet.private_key' $CONFIG_PATH)
RPC_URL=$(jq -r '.chain.rpc_url' $CONFIG_PATH)

# 检查是否已安装 forge（Foundry）
if ! command -v forge &> /dev/null; then
    echo "Foundry 未安装。请先安装 Foundry。"
    exit 1
fi

# 编译并部署合约
echo "编译合约..."
forge build

echo "部署合约..."
forge script script/Deploy.s.sol:Deploy --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
