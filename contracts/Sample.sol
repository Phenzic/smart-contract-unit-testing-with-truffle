// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Sample {
    string public name;
    address public owner;

    constructor() {
        owner = msg.sender;
        name = "deployer";
    }

    function rename(string memory _name) public {
        name = _name;
    }

    function describe() public view returns (string memory) {
        return (name);
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
