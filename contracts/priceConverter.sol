 // SPDX-License-Identifier: MIT

 pragma solidity ^0.8.18;

 import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


 library PriceConverter {


    function getPrice() view internal returns(uint256) {

    // 0x694AA1769357215DE4FAC081bf1f309aDC325306 ETH/USD Sepolia Address
    // AB
    
    AggregatorV3Interface priceFeed =  AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        // prettier-ignore
        (
            /* uint80 roundID */,
            int256 answer, //price of eth in terms of usd - 2000.00000000
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();

        return uint256(answer * 1e10);

        }


    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        
            uint256 ethPrice = getPrice();

            uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // 1000000000000000000,000000000000000000 / 1e18

            return ethAmountInUsd;
        }
    
 }