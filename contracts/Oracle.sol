// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./interfaces/AggregatorV3Interface.sol";

contract Oracle {
    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Mainnet
     * Aggregator: ETH/USD
     * Address: 0x5f4ec3df9cbd43714fe2740f5e3616155c5b8419
     */

    /**
     * Network: Optimism
     * Aggregator: ETH/USD
     * Address: 0x13e3Ee699D1909E989722E753853AE30b17e08c5
     */

    // optimism sepolia: 0x61Ec26aA57019C486B10502285c5A3D4A4750AD7
    constructor() {
        priceFeed = AggregatorV3Interface(address(0x61Ec26aA57019C486B10502285c5A3D4A4750AD7));
    }

    /**
     * Returns the latest price
     */
    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int256) {
        (uint80 roundID, int256 price, uint256 startedAt, uint256 timeStamp, uint80 answeredInRound) =
            priceFeed.latestRoundData();

        return price;
    }
}
