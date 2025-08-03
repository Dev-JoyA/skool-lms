//SPDX-License-Identifier:MIT
pragma solidity ^ 0.8.28;

contract SkoolLmsContract {
    address public principal;
    uint256 public tuition;
    // function for Registration
    // function to get all student
    // function to get student by id 
    // function to register course 
    //function check result
    // function grade result

    //library to check if all courses are registered

    //mapping (address => bool) hasPaid
    //Interface
    // payment, registration, graduated

    //error unpaid()

    

    enum Grade {LOWER, UPPER, PASS}
    enum AdmissionStatus {UNREGISTERED, REGISTERD, DEFERRED, RUSTICATED, GRADUATED}
    enum PaymentStatus {UNPAID, PAID}

    struct Student {
        uint256 id;
        string name;
        address paymentAddress;
        Grade grade;
        AdmissionStatus admissionStatus;
        PaymentStatus paymentStatus;
    }
}