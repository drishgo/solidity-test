// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Arrays{
    //Normal initialization of Arrays
    uint256[] public arr;
    //instantiated Array
    uint8[] public arr2 = [1,2,3,4,5,6,7,8,9,10,11,12,123,255]; 

    //Fixed size array 
    uint8[5] nums = [1,2,3,4,5]; 
    address[5] public airdropWinners;
    

    //Arrays can be dynamic (in case of [] declaration) and Fixed (in case of [x] declaration)

    //dynamic array-

    uint8[] public numbers;

    //Fixed size array-

    uint8[5] public nums2=[1,2,3,4,5];

    //dynamic Arrays can be increased in size by simply pushing elements with array.push(x)

    function dynamicAdd(uint8 number) public {
        numbers.push(number);
    }
    
    function getDynamicLength() public view returns(uint){
        return numbers.length;
    }
}