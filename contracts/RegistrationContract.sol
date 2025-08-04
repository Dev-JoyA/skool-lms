// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

interface IRegistration {
    function tuitionPayment() external payable;
    function registration() external view returns (bool);
}

contract RegistrationContract is IRegistration {
    address public principal;
    uint256 public tuitionFee;
    mapping(address => bool) public isRegistered;

    constructor(uint256 _tuition) {
        principal = msg.sender;
        tuitionFee = _tuition;
    }

    function tuitionPayment() external payable {
        require(msg.value == tuitionFee, "Incorrect tuition amount");
    }

    function registration() external view returns (bool) {
        return isRegistered[msg.sender];
    }
}
