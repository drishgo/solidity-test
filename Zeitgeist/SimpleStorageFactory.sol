// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "./SimpleStorage.sol";
contract StorageFactory{
    SimpleStorage[] public simpleStoreArray;
    function createSimpleStorage() public {
        SimpleStorage simpleStore = new SimpleStorage();
        simpleStoreArray.push(simpleStore);
    }
    function sfStore(uint256 _simpleStoreIndex,uint256 number) public {
        //Address of Contract
        //ABI of contract (how exactly does the program interact with the contract)

        SimpleStorage currentSimpleStorage = simpleStoreArray[_simpleStoreIndex];
        currentSimpleStorage.store(number);
        currentSimpleStorage.getNum();

    }
    function getNumberFromFactory(uint256 _simpleStoreIndex) public view returns(uint256){
        return simpleStoreArray[_simpleStoreIndex].getNum();
        
    }

}