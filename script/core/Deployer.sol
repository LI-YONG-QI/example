pragma solidity ^0.8.0;

import {Config} from "forge_deploy/Config.sol";
import {Vm} from "forge-std/Vm.sol";
import {Token} from "../../src/Token.sol";

library Deployer {
    using Config for *;

    Vm internal constant vm = Config.vm;

    string constant ROOT = "core";

    struct TokenConfig {
        uint256 _x;
        uint256 _y;
        address owner;
    }

    function deployToken() internal returns (address) {
        bytes memory configJson = ROOT.loadConfig(block.chainid, "Token");

        (uint256 _x, uint256 _y, address owner) = abi.decode(configJson, (uint256, uint256, address));
        //return address(new Token(_x, _y, owner));

        bytes memory args = abi.encode(_x, _y, owner);
        bytes memory bytecode = vm.getCode("Token");

        return Config.deploy(abi.encodePacked(bytecode, args));
    }
}
