// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

interface IRegistration {
    function tuitionPayment() external payable;
    function registration() external view returns (bool);
}

contract RegistrationContract is IRegistration {
    address public principal;
    uint256 public tuition;
    mapping(address => bool) public isRegistered;

    constructor(uint256 _tuition) {
        principal = msg.sender;
        tuition = _tuition;
    }

    function tuitionPayment() external payable {
        require(msg.value == tuition, "Incorrect tuition amount");
        isRegistered[msg.sender] = true;
    }

    function registration() external view returns (bool) {
        return isRegistered[msg.sender];
    }
}
