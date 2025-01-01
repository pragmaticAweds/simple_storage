// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract TodoList {

    struct Todo {
      bool isCompleted;
      string name;
    }

    Todo[] public todoLists;

    function addTodo(string memory _name) public {
       Todo memory newTodo = Todo({isCompleted: false, name: _name});

       todoLists.push(newTodo);
    }



    function showTodos() public view returns(Todo[] memory) {
        return todoLists;
    }

    
}