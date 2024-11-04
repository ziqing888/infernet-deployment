#!/bin/bash

# 更新并安装必要的依赖
sudo apt update && sudo apt upgrade -y
sudo apt install -y docker.io python3 python3-pip

# 安装 Infernet CLI
pip install infernet-cli
