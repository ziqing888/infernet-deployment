#!/bin/bash

# 重置节点并重启服务
echo "重置节点并重启所有服务..."
infernet-cli reset --services

echo "节点已重置并应用新配置。"
