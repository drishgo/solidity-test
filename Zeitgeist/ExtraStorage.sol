// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./SimpleStorage.sol";
contract ExtraStorage is SimpleStorage{

    function extraStore(uint256 _num) public {
        num = _num +5;
    }
    function getExtraStored() public view returns(uint256){
        return num;
    }
}