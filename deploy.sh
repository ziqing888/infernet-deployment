#!/bin/bash

# 主控制脚本

echo "1. 安装依赖..."
bash ./scripts/install_dependencies.sh

echo "2. 配置节点..."
bash ./scripts/configure_node.sh

echo "3. 添加服务..."
bash ./scripts/add_services.sh

echo "4. 启动节点..."
bash ./scripts/start_node.sh

echo "5. 部署合约..."
bash ./scripts/deploy_contract.sh

echo "6. 调用合约..."
bash ./scripts/call_contract.sh

echo "部署流程完成！"
