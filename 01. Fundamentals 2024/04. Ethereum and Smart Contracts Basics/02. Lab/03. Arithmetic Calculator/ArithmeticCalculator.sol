// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract ArithmeticCalculator {
    function add(uint256 x, uint256 y) public pure returns (uint256 result) {
        return result = x + y;
    }

    function subtract(uint256 x, uint256 y)
        public
        pure
        returns (uint256 result)
    {
        return result = x - y;
    }

    function multiply(uint256 x, uint256 y)
        public
        pure
        returns (uint256 result)
    {
        return result = x * y;
    }

    function divide(uint256 x, uint256 y) public pure returns (uint256 result) {
        if (x != 0) {
            return result = x / y;
        }
    }
}
