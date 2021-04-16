// Currency contract
// source code is written for Solidity version 0.7.0
// adress public minter declares state variable
// adress is a 160-bit value 
// keyword public generates function to access current value for state variable



pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;
    
    event Sent(address from, address to, uint amount)
    
    constructor () {
        minter = msg.sender;
    }
    
    function mint (address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60)
        balances[reciever] += amount;
    }
    
    function send(address reciever, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }