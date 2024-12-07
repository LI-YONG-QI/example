// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract Inner {
    uint256 public x;
    uint256 public y;

    constructor(uint256 _x, uint256 _y, address owner) {
        x = _x;
        y = _y;
    }
}
