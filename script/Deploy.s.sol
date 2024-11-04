// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

contract Deploy is Script {
    address registryAddress = 0xe2F36C4E23D67F81fE0B278E80ee85Cf0ccA3c8d; // 从 config.json 中的地址

    function run() external {
        vm.startBroadcast();
        
        // 使用已经存在的合约地址
        // 这里假设你已经知道该合约的接口
        OfficialContract officialContract = OfficialContract(registryAddress);
        
        // 输出合约地址
        console.log("OfficialContract 部署地址:", address(officialContract));
        
        // 如果需要将地址写入文件
        vm.writeFile("deployed_address.txt", abi.encodePacked(registryAddress));

        vm.stopBroadcast();
    }
}

