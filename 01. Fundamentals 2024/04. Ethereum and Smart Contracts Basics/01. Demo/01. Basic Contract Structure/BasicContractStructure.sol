// SPDX-License-Identifier: MIT

/* Note: Adding ".0" (e.g., 0.8.28 -> 0.8.28.0) can resolve some semver issues in specific environments.
 Compiler version ^0.8.28 does not satisfy the ^0.5.8 semver requirement Pos: 1:1 */
pragma solidity ^0.8.28 .0;

contract BasicContractStructure {
    /* if the variable is private it's convention to write it with underscore*/
    uint256 private _privateVariable;
    uint256 public votesCandidate1;

    /*named arguments (uint256 x, uint256 y)*/
    function test(uint256 a) public pure returns (uint256 x, uint256 y) {
        /* "return" may be omitted return (a + 1, a + 12); */
        x = a + 1;
        y = a + 12;
    }

    function test1(uint256 a) public returns (uint256 x, uint256 y) {
        x = votesCandidate1;
        votesCandidate1 = a;
        y = a + 12;
    }

    function test2(uint256 a) public view returns (uint256 x, uint256 y) {
        /* only reads from the storage */
        x = votesCandidate1;
        y = a + 12;
    }
}
