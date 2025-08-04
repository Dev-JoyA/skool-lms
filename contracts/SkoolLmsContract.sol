//SPDX-License-Identifier:MIT
pragma solidity ^ 0.8.28;

import "./RegistrationContract.sol";

contract SkoolLmsContract {
    address payable principal;
    uint256 public tuition;
    IRegistration public registrationContract;
    uint256 public studentCount;

    //library to check if all courses are registered
    //Interface
    constructor(address _registrationContract){
        registrationContract = IRegistration(_registrationContract);
    }

    error UnPaid();
    error NotRegistered();

    enum Grade {NONE, LOWER, UPPER, PASS}
    enum AdmissionStatus {UNREGISTERED, REGISTERED, DEFERRED, RUSTICATED, GRADUATED}
    enum PaymentStatus {UNPAID, PAID}

    struct Student {
        uint256 id;
        string name;
        address paymentAddress;
        Grade grade;
        AdmissionStatus admissionStatus;
        PaymentStatus paymentStatus;
    }

    mapping (address => bool) hasPaid;
    mapping(uint256 => Student) newStudent;

    function payTuition(string memory _name) public payable {
        require(!hasPaid[msg.sender], "Student Already Paid");
        registrationContract.tuitionPayment{value: msg.value}();
        principal.transfer(msg.value);

        hasPaid[msg.sender] = true;
        studentCount++;

        newStudent[studentCount] =  Student({
            id : studentCount,
            name : _name,
            paymentAddress : msg.sender,
            grade : Grade.NONE,
            admissionStatus : AdmissionStatus.UNREGISTERED,
            paymentStatus : PaymentStatus.PAID
        });
        
    }

    function registerStudent(uint256 _id) public{
        if(!hasPaid[msg.sender]){
            revert UnPaid();
        }
        require((registrationContract.registration()) == false, "Student Already registered");
        newStudent[_id].admissionStatus = AdmissionStatus.REGISTERED;
    }

    function getAllStudent() public {

    }

    function getStudentById() public {

    }

    function registerCourse() public {

    }

    function checkResult() public {

    }

    function gradeResult() public {

    }
}