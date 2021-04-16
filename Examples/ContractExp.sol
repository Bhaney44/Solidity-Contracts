// Smart contract example 
// Source code is licensed under the GPL version 3.0.

// source code is written for Solidity version 0.4.16.
pragma solidity >=0.4.16 <0.9.0;

// A contract is a collection of code at a specific address on the Ethereum blockchain. 
// Declare state variable called storedData
// Access variable using [this.]
// functions set and get for modifying or retrieving value

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}