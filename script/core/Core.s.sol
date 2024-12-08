// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import {Deployer} from "./Deployer.sol";
import {Script, console} from "forge-std/Script.sol";
import {Token} from "../../src/Token.sol";

contract CoreScript is Script {
    function run() external {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        address tokenAddr = Deployer.deployToken(address(this));
        Token token = Token(tokenAddr);

        console.log("Token x:", token.x());
        console.log("Token y:", token.y());
        console.log("Token owner:", token.owner());

        vm.stopBroadcast();
    }
}
