// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    event Greet(string message);

    function sayHello() public {
        emit Greet("Hello, world!");
    }
}
