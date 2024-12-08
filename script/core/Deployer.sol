pragma solidity ^0.8.0;

import {Config} from "fuse-contracts/Config.sol";
import {Vm} from "forge-std/Vm.sol";

library Deployer {
    using Config for *;

    Vm internal constant vm = Config.vm;

    string constant ROOT = "core";

    struct TokenConfig {
        uint256 _x;
        uint256 _y;
        address owner;
    }

    function deployToken(address owner) internal returns (address) {
        bytes memory configJson = ROOT.loadConfig(block.chainid, "Token");

        (uint256 _x, uint256 _y) = abi.decode(configJson, (uint256, uint256));

        bytes memory args = abi.encode(_x, _y, owner);
        bytes memory bytecode = vm.getCode("Token");

        return Config.deploy(abi.encodePacked(bytecode, args));
    }
}
