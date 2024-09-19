// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Freelancia {
    // Token properties
    string public name;
    string public symbol;
    uint256 public totalSupply;

    // Mapping of addresses to balances
    mapping (address => uint256) public balances;

    // Event emitted when tokens are transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Event emitted when tokens are minted
    event Mint(address indexed to, uint256 value);

    // Constructor
    constructor() {
        name = "Freelancia";
        symbol = "FLN";
        totalSupply = 100000000; // 100 million tokens

        // Mint the initial tokens
        balances[msg.sender] = totalSupply;
        emit Mint(msg.sender, totalSupply);
    }

    // Function to transfer tokens
    function transfer(address to, uint256 value) public {
        require(balances[msg.sender] >= value, "Insufficient balance");
        balances[msg.sender] -= value;
        balances[to] += value;
        emit Transfer(msg.sender, to, value);
    }

    // Function to get the balance of an address
    function balanceOf(address owner) public view returns (uint256) {
        return balances[owner];
    }
}