
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import {SaysGM} from "../src/SaysGM.sol"; // 引入 SaysGM 合约

contract Deploy is Script {
    address registryAddress = 0xe2F36C4E23D67F81fE0B278E80ee85Cf0ccA3c8d; // 从 config.json 中的地址

    function run() external {
        vm.startBroadcast();
        
        // 部署 SaysGM 合约
        SaysGM saysGMContract = new SaysGM(registryAddress);
        
        // 输出 SaysGM 合约地址
        console.log("SaysGM 合约已部署，地址为:", address(saysGMContract));
        
        // 如果需要将合约地址写入文件
        vm.writeFile("deployed_address.txt", abi.encodePacked(address(saysGMContract)));

        vm.stopBroadcast();
    }
}
