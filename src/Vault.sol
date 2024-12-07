// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {Token} from "./Token.sol";

contract Vault {
    Token public token;

    uint256 public limit;
    address public immutable WETH;

    constructor(address tokenAddress, address weth, uint256 _limit) {
        token = Token(tokenAddress);

        WETH = weth;
        limit = _limit;
    }
}
