pragma solidity ^0.8.13;

import {Deployer} from "./Deployer.sol";
import {Script, console} from "forge-std/Script.sol";
import {Broadcast} from "fuse-contracts/Broadcast.sol";

import {Vault} from "../../src/Vault.sol";
import {Router} from "../../src/Router.sol";

contract PeripheryScript is Script {
    function run() external {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        Broadcast.Contract memory token = Broadcast.getContract("Core.s.sol", "Token");
        Vault vault = Vault(Deployer.deployVault(token.addr));
        Router router = Router(Deployer.deployRouter(address(vault)));

        console.log("Vault:", address(vault));
        console.log("Vault limit:", vault.limit());
        console.log("Vault WETH:", vault.WETH());
        console.log("Vault token:", address(vault.token()));

        console.log("Router:", address(router));
        console.log("Router uniswapV3Pool:", router.uniswapV3Pool());
        console.log("Router aaveV3Pool:", router.aaveV3Pool());
        console.log("Router USDT:", router.USDT());
        console.log("Router vault:", address(router.vault()));

        vm.stopBroadcast();
    }
}
