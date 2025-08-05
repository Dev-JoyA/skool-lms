//SPDX-License-Identifier:MIT
pragma solidity ^ 0.8.28;

import "./RegistrationContract.sol";
import "./RegisterCourse.sol";

contract SkoolLmsContract {
    using RegisterCourse for mapping(uint256 => RegisterCourse.Courses);

    address payable principal;
    uint256 public tuition;
    IRegistration public registrationContract;
    uint256 public studentCount;
    uint256[] private studentIds;


    constructor(address _registrationContract){
        registrationContract = IRegistration(_registrationContract);
    }

    error UnPaid();
    error NotRegistered();
    error CourseNotRegistered();

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

        studentIds.push(studentCount);
        
    }

    function registerStudent(uint256 _id) public{
        if(!hasPaid[msg.sender]){
            revert UnPaid();
        }
        require((registrationContract.registration()) == false, "Student Already registered");
        newStudent[_id].admissionStatus = AdmissionStatus.REGISTERED;
    }

    function getAllStudent() public view returns (uint256[] memory){
        return studentIds;
    }

    function getStudentById(uint256 _id) public  view returns (Student memory) {
        require(_id > 0 && _id <= studentCount, "Invalid Student ID");
        return newStudent[_id];
    }



    function registerCourse() public {

    }

    function checkResult() public {

    }

    function gradeResult() public {

    }
}