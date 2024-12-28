// SPDX-License-Identifier: MIT

pragma solidity 0.8.24; //stating our solidity version, in range >=0.8.18 <0.9.0

contract SimpleStorage {

    uint256 public myFavoriteNumber; // 0 by default

    // uint256[] listOfFavoriteNumbers;
    
    // struct is used to create a class type or object
    // each parameters is also indexed like 0, 1, 2
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    //dynamic array - it can grow, but 
    //if a number is specified inside [3], it will be static
    //size cannot be greater than that
    Person[] public listOfPeople;


    //mapping is like dictionary, object
    // you specify the key => value
    //default value for nonexisting key is 0

        //john -> 10
    mapping(string => uint256) public nameToFavoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

/* 
    calldata, memory, storage

   calldata and memory are temporary variables.

    struct, mapping or array, needs to be given one of the variables memory or callback.

    string is an array of byte which is why its important to specify the variable type

    The difference between memory and calldata is, memory can be modify but calldata cannot be modify

    storage is a variable type that the value can be changed.



*/
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person({favoriteNumber: _favoriteNumber, name: _name}) );

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

 
}
