pragma solidity ^0.4.0;

contract putMoney{
    
    event saveRecord(address _address, uint _amount);
    event takeRecord(address _address, uint _amount);
    
    address owner = msg.sender;
    
    function putMoney(){
    }
    
    uint public totalAmount;
    
    function putIn() payable{
        totalAmount += msg.value;
        saveRecord(msg.sender, msg.value);
    }
    
    function takeOut(uint input){
        if(msg.sender!=owner) throw;
        var receiver = msg.sender;
	    var value = input;
        if(!receiver.send(value)) throw;
        totalAmount -= value;
        takeRecord(msg.sender, input);
    }
}