#!/bin/bash

# 主控制脚本

while true; do
    echo "请选择要执行的操作:"
    echo "1. 安装依赖"
    echo "2. 配置私钥和 RPC URL"
    echo "3. 配置节点"
    echo "4. 添加服务"
    echo "5. 启动节点"
    echo "6. 部署合约"
    echo "7. 调用合约"
    echo "8. 退出"

    read -rp "请输入选项（1-8）: " OPTION

    case $OPTION in
        1)
            echo "安装依赖..."
            bash ./scripts/install_dependencies.sh
            ;;
        2)
            echo "配置私钥和 RPC URL..."
            bash ./scripts/configure.sh
            ;;
        3)
            echo "配置节点..."
            bash ./scripts/configure_node.sh
            ;;
        4)
            echo "添加服务..."
            bash ./scripts/add_services.sh
            ;;
        5)
            echo "启动节点..."
            bash ./scripts/start_node.sh
            ;;
        6)
            echo "部署合约..."
            bash ./scripts/deploy_contract.sh
            ;;
        7)
            echo "调用合约..."
            bash ./scripts/call_contract.sh
            ;;
        8)
            echo "退出程序..."
            exit 0
            ;;
        *)
            echo "无效选项，请选择 1 到 8 之间的数字。"
            ;;
    esac

    echo ""
done
