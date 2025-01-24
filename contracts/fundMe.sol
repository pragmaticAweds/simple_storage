// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;



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

 
    // 1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18
    // Gas cost is mostly in gwei


    import { PriceConverter } from "./priceConverter.sol";

contract fundMe {

    using PriceConverter for uint256;

        uint256 public minimumUsd = 5e18;

        address[] public funders;

        mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

        address public owner;

    constructor() {
        owner = msg.sender;
    }


    function fund () public payable  {

        require(msg.value.getConversionRate() >= minimumUsd, "Did not send enough ETH");

        funders.push(msg.sender);

        addressToAmountFunded[msg.sender] += msg.value;
    }
   
    function withdraw () public onlyOwner {

        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {

            address funder = funders[funderIndex];

            addressToAmountFunded[funder] = 0;

        }

        funders = new address[](0);

        // withdrawing the fund
        
        // 3 different ways of sending native blockchain are: transfer, send, call

        //transfer -- gas fee is capped at 2300, anything exceeding will throw error and revver
    //     payable(msg.sender).transfer(address(this).balance);

    //     //send - operates like transfer but, returns bool to indicate success or fail.
    //    bool sendSuccess = payable(msg.sender).send(address(this).balance);

    //    require(sendSuccess, "Send failed"); //reverts when false is returned

       //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        
        require(callSuccess, "Calll failed");

    }


    modifier onlyOwner() {
        require(msg.sender == owner, "must be the owner");
        _;  // having the underscore below means, the check above should be done first, before proceeding to code
    }
    
}