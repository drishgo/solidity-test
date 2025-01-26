//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract FundMe{
    uint256 public minimumUSD = 25;
    

    function fund() public payable {
    

               require(msg.value>=minimumUSD,"The funding does not meet base requirement ");
       
    }


    // function Withdraw(){

    // }
}