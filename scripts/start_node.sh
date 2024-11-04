#!/bin/bash

# 检查 infernet-cli 是否已安装
if ! command -v infernet-cli &> /dev/null; then
    echo "infernet-cli 未安装，请先安装 infernet-cli。"
    exit 1
fi

# 启动节点
echo "启动 Infernet 节点..."
if infernet-cli start; then
    echo "节点启动完成。"
else
    echo "节点启动失败，请检查 infernet-cli 配置。"
    exit 1
fi
