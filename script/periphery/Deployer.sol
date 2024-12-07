pragma solidity ^0.8.0;

import {Config} from "forge_deploy/Config.sol";
import {Vm} from "forge-std/Vm.sol";

library Deployer {
    using Config for *;

    Vm internal constant vm = Config.vm;

    string constant ROOT = "periphery";

    struct VaultConfig {
        address tokenAddress;
        address weth;
        uint256 _limit;
    }

    function deployVault(address tokenAddress) internal returns (address) {
        bytes memory configJson = ROOT.loadConfig(block.chainid, "Vault");

        (uint256 _limit, address weth) = abi.decode(configJson, (uint256, address));

        bytes memory args = abi.encode(tokenAddress, weth, _limit);
        bytes memory bytecode = vm.getCode("Vault");

        return Config.deploy(abi.encodePacked(bytecode, args));
    }

    struct RouterConfig {
        address _uniswapV3Pool;
        address _aaveV3Pool;
        address _USDT;
        address _vault;
    }

    function deployRouter(address _vault) internal returns (address) {
        bytes memory configJson = ROOT.loadConfig(block.chainid, "Router");

        (address _USDT, address _aaveV3Pool, address _uniswapV3Pool) =
            abi.decode(configJson, (address, address, address));

        bytes memory args = abi.encode(_uniswapV3Pool, _aaveV3Pool, _USDT, _vault);
        bytes memory bytecode = vm.getCode("Router");

        return Config.deploy(abi.encodePacked(bytecode, args));
    }
}
