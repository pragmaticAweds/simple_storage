// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { SimpleStorage } from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorageList;

    function createSimpleStorageContract() public {

       SimpleStorage newSimpleStorage = new SimpleStorage();

       simpleStorageList.push(newSimpleStorage);

    }

    function sfStore (uint256 _simpleStorageIndex, uint _newSimpleStorageNo) public {

            SimpleStorage mySimpleStorage = simpleStorageList[_simpleStorageIndex];
            
            mySimpleStorage.store(_newSimpleStorageNo);

    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        
        SimpleStorage mySimpleStorage = simpleStorageList[_simpleStorageIndex];

        return mySimpleStorage.retrieve();
    }

}