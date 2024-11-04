// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/MyContract.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        
        // 部署合约
        MyContract myContract = new MyContract();
        
        vm.stopBroadcast();
    }
}
