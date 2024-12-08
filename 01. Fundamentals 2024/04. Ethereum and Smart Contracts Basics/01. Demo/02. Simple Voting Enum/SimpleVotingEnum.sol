// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// Enum
// https://docs.soliditylang.org/en/v0.8.28/types.html#enums
enum VotingOptions {
    CandidateOne,
    CandidateTwo
}

contract SimpleVoting {
    uint256 public candidate1;
    uint256 public candidate2;

    // Value Types
    bool public x = true;

    function vote(VotingOptions candidate) external {
        // if (candidate == 0) {
        if (candidate == VotingOptions.CandidateOne) {
            candidate1 += 1;
            // } else if (candidate == 1) {
        } else if (candidate == VotingOptions.CandidateTwo) {
            candidate2 += 1;
        }
    }
}
