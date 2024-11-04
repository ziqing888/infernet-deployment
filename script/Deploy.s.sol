// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/OfficialContract.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        
        // 部署官方合约
        OfficialContract officialContract = new OfficialContract();
        
        // 输出合约地址，方便后续调用
        console.log("OfficialContract 部署地址:", address(officialContract));

        vm.stopBroadcast();
    }
}
