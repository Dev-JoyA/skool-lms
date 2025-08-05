//SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.28;

library RegisterCourse {
    struct Courses {
        bool maths;
        bool english;
        bool basicScience;
    }

    
    function registerCourse(
        mapping(uint256 => Courses) storage courseMap,
        uint256 studentId,
        bool maths,
        bool english,
        bool basicScience
    ) internal {
        courseMap[studentId] = Courses(maths, english, basicScience);
    }
}


