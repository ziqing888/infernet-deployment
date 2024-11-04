#!/bin/bash

# 更新系统
echo "更新系统包..."
if sudo apt update && sudo apt upgrade -y; then
    echo "系统包更新完成。"
else
    echo "系统更新失败，请检查网络连接或包管理器配置。"
    exit 1
fi

# 安装 Docker 和 Python3 及其 pip
echo "安装 Docker、Python3 和 pip..."
if sudo apt install -y docker.io python3 python3-pip; then
    echo "Docker、Python3 和 pip 安装完成。"
else
    echo "安装 Docker、Python3 或 pip 失败，请检查安装源。"
    exit 1
fi

# 检查 pip 是否安装成功
if ! command -v pip &> /dev/null; then
    echo "pip 未成功安装，请检查 Python 环境。"
    exit 1
fi

# 安装 Infernet CLI
echo "安装 Infernet CLI..."
if pip install infernet-cli; then
    echo "Infernet CLI 安装成功。"
else
    echo "Infernet CLI 安装失败，请检查 pip 配置。"
    exit 1
fi

echo "所有依赖项已成功安装。"

