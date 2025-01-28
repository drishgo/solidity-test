//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";
contract FundMe{
    using PriceConverter for uint256;
    uint256 public minimumUSD = 25*1e18;
    
    address[] public  patrons;
    mapping(address=> uint256) public fundingGivenByAddress;

    function fund() public payable {

               require(msg.value.getConversionRate()>=minimumUSD,"The funding does not meet base requirement ");
                patrons.push(msg.sender);   
                fundingGivenByAddress[msg.sender]=msg.value;
    }
     



    function Withdraw() public {
        for(uint256 i = 0;i<patrons.length; i++){
            address patron = patrons[i];
            fundingGivenByAddress[patron] = 0;
    }
    patrons = new address[](0);
    require(payable(msg.sender).send(address(this).balance),"Could not send Try again");
}
}


// PAYABLE ALLOWS TRANSACTIONS TO OCCUR BETWEEN WALLETS AND CONTRACTS.
// CONTRACT ALSO ACTS LIKE A WALLET ADDRESS THAT CAN STORE ETHER.
// A PAYABLE PARAMETER ALLOWS A FUNCTION AND THEREFORE A CONTRACT TO BE ABLE TO
// PERFORM ETHER TRANSFER TO AND FROM AN EOA LIKE METAMASK.
// SO THE FUNCTION fund() IS DECLARED TO BE PAYABLE.