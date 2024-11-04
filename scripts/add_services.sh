#!/bin/bash

# 使用 Infernet CLI 添加官方服务
echo "添加官方服务 onnx-inference..."
infernet-cli add-service onnx-inference --skip

# 添加自定义服务
echo "添加自定义服务..."
infernet-cli add-service <<EOF
{
  "id": "custom-service-1.0.0",
  "image": "custom_image/service:1.0.0",
  "description": "Custom Service Example",
  "command": "--bind=0.0.0.0:4000 --workers=4",
  "env": {},
  "external": true,
  "gpu": false,
  "port": 4000,
  "volumes": [],
  "allowed_addresses": [],
  "allowed_delegate_addresses": [],
  "allowed_ips": [],
  "accepted_payments": {},
  "generates_proofs": false
}
EOF

echo "服务已成功添加到配置文件中。"

