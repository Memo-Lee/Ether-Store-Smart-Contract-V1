// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// error veriyor
contract FreeCollector { // 0x87... gibi contract address gönderilme adresi
        address public owner;
        uint256 public balance;
        constructor() {
            owner = msg.sender;
        }
        receive() payable external {
            balance += msg.value;
        }

        function withdraw(uint amount, address payable destAddr) public {
            require (msg.sender == owner , "Only owner can withdraw");
            require (amount <= balance , "Insufficient funds");
            
            destAddr.transfer(amount);
            balance -= amount;
        }
}


