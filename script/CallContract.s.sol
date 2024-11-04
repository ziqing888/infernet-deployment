// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface IOfficialContract {
    function officialMethod() external;
}

contract CallContract is Script {
    function run() external {
        // 指定 OfficialContract 的部署地址
        address officialContractAddress = 0xYourContractAddress;  // 替换为实际部署地址

        vm.startBroadcast();

        // 调用官方合约方法
        IOfficialContract(officialContractAddress).officialMethod();

        vm.stopBroadcast();
    }
}

