// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

contract VictimContract {
    address payable public owner;
    uint256 public initialBalance;

    constructor () payable {
        owner = payable(msg.sender);
        initialBalance = msg.value;
    }

    function transfer(address _to, uint256 _amount) public {
        require(tx.origin == owner, "YOU ARE NOT THE OWNER");
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "FAILED TO SEND ETHER");
    }

    function getBalance() view public returns(uint256) {
        return address(this).balance;
    }
}