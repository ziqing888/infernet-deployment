#!/bin/bash

# 主控制脚本

while true; do
    echo "请选择要执行的操作:"
    echo "1. 安装依赖"
    echo "2. 配置私钥和 RPC URL"
    echo "3. 配置节点参数"
    echo "4. 添加服务"
    echo "5. 启动所有容器"
    echo "6. 停止所有容器"
    echo "7. 重启所有容器"
    echo "8. 启动节点"
    echo "9. 部署合约"
    echo "10. 调用合约"
    echo "11. 查看节点日志"
    echo "12. 退出"

    read -rp "请输入选项（1-12）: " OPTION

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
            echo "配置节点参数..."
            bash ./scripts/configure_node.sh
            ;;
        4)
            echo "添加服务..."
            bash ./scripts/add_services.sh
            ;;
        5)
            echo "拉取最新镜像并启动所有容器..."
            if ! docker-compose pull; then
                echo "拉取镜像失败，请检查配置。"
                continue
            fi
            
            if ! docker-compose up -d; then
                echo "启动容器时出错，请检查 Docker Compose 配置或镜像是否可用。"
            fi
            ;;
        6)
            echo "停止所有容器..."
            docker-compose down
            ;;
        7)
            echo "重启所有容器..."
            docker-compose restart
            ;;
        8)
            echo "启动节点..."
            bash ./scripts/start_node.sh
            ;;
        9)
            echo "部署合约..."
            bash ./scripts/deploy_contract.sh
            ;;
        10)
            echo "调用合约..."
            bash ./scripts/call_contract.sh
            ;;
        11)
            echo "查看节点日志..."
            docker logs infernet-node
            ;;
        12)
            echo "退出程序..."
            exit 0
            ;;
        *)
            echo "无效选项，请选择 1 到 12 之间的数字。"
            ;;
    esac

    echo ""
done



