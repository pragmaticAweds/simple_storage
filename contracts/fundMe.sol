
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


    /*
        Objectives At the end:

        - Allow users to send money
        - Have a minimum usd amount to send
        - How do we send ETH into this contract?

        - To access the amount sent with a message, use the global variable 
        - called: msg.value (number of wei sent with the message)
  
        - What is revert?
        - Undo any actions that have been done, and send the remaining gas back

    */


contract fundMe {
        uint256 public minimumUsd = 5e18;

    function fund () public payable  {

        require(getConversionRate(msg.value) >= minimumUsd, "Did not send enough ETH"); 
        // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18
        // Gas cost is mostly in gwei
    }


    function getPrice() view public returns(uint256) {

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


     function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        
            uint256 ethPrice = getPrice();

            uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // 1000000000000000000,000000000000000000 / 1e18

            return ethAmountInUsd;
        }

        

    // function withdraw () public {}
    
}