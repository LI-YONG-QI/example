// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {Vault} from "./Vault.sol";

contract Router {
    address public uniswapV3Pool;
    address public aaveV3Pool;
    address public immutable USDT;
    Vault public vault;

    constructor(address _uniswapV3Pool, address _aaveV3Pool, address _USDT, address _vault) {
        uniswapV3Pool = _uniswapV3Pool;
        aaveV3Pool = _aaveV3Pool;
        USDT = _USDT;
        vault = Vault(_vault);
    }
}
