# Infernet Node Deployment

本项目使用 Infernet CLI 自动化配置和部署节点，并使用 Foundry 工具部署和调用智能合约。

## 使用步骤

### 1. 克隆项目
```bash
git clone https://github.com/ziqing888/infernet-deployment.git
cd infernet-deployment
 ```
### 2. 运行主控制脚本
 ```bash
 bash deploy.sh
  ```
 ###  3. 重置节点（如有需要）
如果修改了配置文件，请使用以下命令重置节点： 
  ```bash
  bash scripts/reset_node.sh
   ```
 ### 配置文件路径
所有配置文件将保存在 ./deploy 目录中，手动编辑 config.json 以满足特定需求。

### 合约部署与调用
本项目包含自动化的合约部署和调用脚本，使用 Foundry 工具。
部署脚本在 scripts/deploy_contract.sh 中，调用脚本在 scripts/call_contract.sh 中。
在运行这些脚本前，请确保 Foundry 已安装，并且已配置合约文件（如 MyContract.sol）。
