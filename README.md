# 🏫 SkoolLmsContract Project

This project demonstrates a Hardhat-based smart contract system for managing tuition payments, student registration, and course enrollment in a school learning management system (LMS).

---

## 📜 Contract Summary

The **SkoolLmsContract** allows students to pay tuition fees, register themselves, and enroll in courses by interacting with an external `RegistrationContract`.

---

## 🔧 Key Features

- **Tuition Payment**  
  Students pay tuition fees by calling `payTuition(string name)`.  
  - The payment is forwarded to the `RegistrationContract` and then transferred to the principal.  
  - Each payment creates a student record tracking their ID, name, address, and payment status.

- **Student Registration**  
  Students who have paid tuition can register themselves by calling `registerStudent(uint256 id)`.  
  - The contract checks with the external `RegistrationContract` to confirm registration status.

- **Course Registration**  
  Registered students can enroll in courses via `courseRegistration(uint256 id)`.  
  - Course registration status is managed via the `RegisterCourse` library.  
  - Successful enrollment updates the student's grade status.

- **Student Data Access**  
  - `getAllStudent()` returns the list of all registered student IDs.  
  - `getStudentById(uint256 id)` returns detailed information about a student.

---

## ✅ Validations & Errors

- ❌ Throws `UnPaid()` error if a student tries to register or enroll in courses without paying tuition.  
- ❌ Throws `NotRegistered()` error if a student tries to enroll in courses without being registered.  
- ❌ Prevents duplicate tuition payments and registrations.

---

## 📍 Deployment Info

- **Registration Contract Txn Hash:**  
  `0xeE82b260269c56E9E74BcD4A48c8eDC70D0Fa010`  
  [View on Lisk Sepolia Blockscout](https://sepolia-blockscout.lisk.com/address/0xdcd42cA3B9286BC08e5FeB0125196c0AEbad2416#code)

- **SkoolLms Contract Txn Hash:**  
  `0x575141B753eE473722f729D29685951ADCB309ba`  
  [View on Lisk Sepolia Blockscout](https://sepolia-blockscout.lisk.com/address/0x575141B753eE473722f729D29685951ADCB309ba#code)

---

## 🧱 Tech Stack

- Solidity `^0.8.28`  
- Hardhat framework  
- Lisk Sepolia Testnet  

---

## 📂 Contract Overview

| Function              | Description                                         |
|-----------------------|-----------------------------------------------------|
| `payTuition(string)`  | Student pays tuition fee and creates student record |
| `registerStudent(id)` | Student registers after tuition payment             |
| `courseRegistration(id)` | Student enrolls in courses (requires registration) |
| `getAllStudent()`     | Returns list of all student IDs                      |
| `getStudentById(id)`  | Returns student details by ID                         |

---

## 🧩 Dependencies

- `RegistrationContract.sol` (external registration logic interface)  
- `RegisterCourse.sol` (library for course management)  

---

Feel free to explore and customize this LMS contract to suit your educational platform needs!
