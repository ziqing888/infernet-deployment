#!/bin/bash

# 导入配置文件路径
CONFIG_PATH="./config/config.json"

# 从 config.json 读取私钥和 RPC URL
PRIVATE_KEY=$(jq -r '.chain.wallet.private_key' $CONFIG_PATH)
RPC_URL=$(jq -r '.chain.rpc_url' $CONFIG_PATH)

# 调用合约方法
echo "调用合约方法..."
forge script script/CallContract.s.sol:CallContract --broadcast --rpc-url $RPC_URL --private-key $PRIVATE_KEY
