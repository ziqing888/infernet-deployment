#!/bin/bash

# 设置部署目录环境变量
export DEPLOY_DIR=./deploy

# 拉取配置模板并生成基础配置文件
infernet-cli config anvil --skip

echo "基础配置文件已生成并保存在 ./deploy 目录下。"
