// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    uint256 public x;
    uint256 public y;

    constructor(uint256 _x, uint256 _y, address owner) ERC20("", "") Ownable(owner) {
        x = _x;
        y = _y;
    }
}
