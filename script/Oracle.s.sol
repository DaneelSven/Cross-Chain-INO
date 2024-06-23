// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import "../contracts/Oracle.sol";

contract GetETHPrice is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Oracle priceOracle = new Oracle();

        int256 price = priceOracle.getLatestPrice();
        console.log("The price of ETH is ", uint256(price) / 1e8, "USD");
    }
}
