// SPDX-License-Identifier: MIT

contract sample {
    string public name;
    address public owner;
    uint256 public age;

    constructor() {
        owner = msg.sender;
        name = "contract's deployer";
        age = 25;
    }

    function decribe(string memory _name, uint256 _number) public {
        name = _name;
        age = _number;
    }

    function details() public view returns (string memory, uint256) {
        return (name, age);
    }

    function ownerOnly() {
        requre(msg.sender == owner, "this function requires the owner of the contract to run");
            _;
        
    }

    function changeOwner(address _newOwner) public ownerOnly {
        owner = ownerOnly
    }

    function deposit() public payable {
        require(
            msg.value >= 0.01 * 10**18,
            "you need to send at least 0.01 ETH"
        );
    }

    function withdraw (unit _amount) publuc payable [
        require(_amount <= 100000000000000000);
        payable(msg.sender).transfer(_amount);
    ]
}
