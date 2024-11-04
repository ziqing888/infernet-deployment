#!/bin/bash

# 设置部署目录环境变量
export DEPLOY_DIR=./deploy

# 检查 infernet-cli 是否安装
if ! command -v infernet-cli &> /dev/null; then
    echo "infernet-cli 未安装，请先安装 infernet-cli。"
    exit 1
fi

# 检查并创建部署目录
if [ ! -d "$DEPLOY_DIR" ]; then
    mkdir -p "$DEPLOY_DIR"
fi

# 拉取配置模板并生成基础配置文件
if infernet-cli config anvil --skip; then
    echo "基础配置文件已生成并保存在 $DEPLOY_DIR 目录下。"
else
    echo "生成基础配置文件失败，请检查 infernet-cli 是否配置正确。"
    exit 1
fi

