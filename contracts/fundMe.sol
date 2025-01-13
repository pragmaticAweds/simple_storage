// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract fundMe {

    uint256 public minimumUsd = 5;

    function fund () public payable  {

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
        require(msg.value >= minimumUsd, "Didn't send enough ETH"); 
        // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18
        // Gas cost is mostly in gwei
    }

        function getPrice() public {}
        function getConversionRate() public {}

    // function withdraw () public {}
    
}