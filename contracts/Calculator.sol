//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Calculator{
    uint256 result;

    function add(uint256 nums) public returns(uint256){
        return result +=nums ;
    
    }
    function subtract(uint256 nums) public returns(uint256){
        return result -= nums;
    }
    function multiply(uint256 nums) public returns(uint256){
        return result *= nums;
    }
    function getResult() public view returns(uint256){
        return result; 
    }
}
