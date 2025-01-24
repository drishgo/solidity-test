//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; //solidity version must

contract SimpleStorage{
    //boolean, uint, int ,address, bytes ---> prim datatypes in Solidity

    //uint is unsigned integer and can also be specified with the number of bits that can 
    // be allocated to the variable like so :-

    uint public num = 115792089237316195423570985008687907853269984665640564039457584007913129639 ;

    //to wrap your head around this, the largest number that can be represented in 8 bits is 255
    // which means that setting nums as anything above 255 and below 0 will give an error.
    // Default is uint256.

    function store(uint256 _nums) public{
        num = _nums;
    }
    people public person = people({pubAdd:0x9a1C85629AD9776997861860d7112Ed24afC4A30,username:"ElonMusk222"}) ;
    struct people{
        address pubAdd;
        string username;

    }
    

}
//0xd9145CCE52D386f254917e481eB44e9943F39138