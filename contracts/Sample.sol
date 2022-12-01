// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract sample {
    string public name;
    address public owner;
    uint256 public age;

    constructor() {
        owner = msg.sender;
        name = "contract's deployer";
        age = 25;
    }

    function describe(string memory _name, uint256 _number) public {
        name = _name;
        age = _number;
    }

    function details() public view returns (string memory, uint256) {
        return (name, age);
    }

    modifier ownerOnly() {
        require(
            msg.sender == owner,
            "this function requires the owner of the contract to run"
        );
        _;
    }

    function changeOwner(address _newOwner) public ownerOnly {
        owner = _newOwner;
    }

    function deposit() public payable {
        require(
            msg.value >= 0.01 * 10 ** 18,
            "you need to send at least 0.01 ETH"
        );
    }

    function withdraw(uint256 _amount) public payable {
        require(_amount <= 100000000000000000);
        payable(msg.sender).transfer(_amount);
    }
}
