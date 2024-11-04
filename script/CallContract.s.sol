// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

interface IMyContract {
    function sayHello() external;
}

contract CallContract is Script {
    function run() external {
        // 指定合约地址
        address myContractAddress = 0xYourContractAddress;

        vm.startBroadcast();

        // 调用合约方法
        IMyContract(myContractAddress).sayHello();

        vm.stopBroadcast();
    }
}
