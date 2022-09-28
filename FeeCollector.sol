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
           // Para çekme işlemini sadece 'owner' (sahibi) yapabilir.
            require (msg.sender == owner , "Only owner can withdraw");
            // tutar <= bakiye'den küçük ise "Yetersiz bakiye" require'ı döndürülür
            require (amount <= balance , "Insufficient funds");
            
            destAddr.transfer(amount);
            balance -= amount;
        }
}


