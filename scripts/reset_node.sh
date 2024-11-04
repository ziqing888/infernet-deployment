#!/bin/bash

# 检查 infernet-cli 是否安装
if ! command -v infernet-cli &> /dev/null; then
    echo "infernet-cli 未安装，请先安装 infernet-cli。"
    exit 1
fi

# 重置节点并重启服务
echo "开始重置节点并重启所有服务..."
if infernet-cli reset --services; then
    echo "节点已成功重置并应用新配置。"
else
    echo "节点重置失败，请检查 infernet-cli 配置。"
    exit 1
fi

