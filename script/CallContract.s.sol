# 导入配置文件路径
CONFIG_PATH="./config/config.json"

# 从 config.json 读取私钥和 RPC URL
PRIVATE_KEY=$(jq -r '.chain.wallet.private_key' "$CONFIG_PATH")
RPC_URL=$(jq -r '.chain.rpc_url' "$CONFIG_PATH")

# 检查是否已安装 forge
if ! command -v forge &> /dev/null; then
    echo "Foundry 未安装。请先安装 Foundry。"
    exit 1
fi

# 读取合约地址
if [ ! -f "deployed_address.txt" ]; then
    echo "未找到合约地址文件，请先部署合约。"
    exit 1
fi

# 从文件中读取合约地址
officialContractAddress=$(cat deployed_address.txt)

# 调用合约方法
echo "调用合约方法..."
forge script script/CallContract.s.sol:CallContract --broadcast --rpc-url "$RPC_URL" --private-key "$PRIVATE_KEY" --address "$officialContractAddress"

