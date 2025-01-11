// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract VotingEligibilityChecker {
    // Using constants can save gas costs.
    // The Coding convention is to use uppercase for constant variables.
    uint256 public constant VOTING_AGE_LIMIT = 18;

    // Custom errors are more gas-efficient than using strings in error messages,
    // and they can also be used to pass parameters to error messages.
    error AgeLimitError(uint256 age, string message);

    function checkEligibility(uint256 age)
        public
        pure
        returns (bool isEligible)
    {
        if (age < VOTING_AGE_LIMIT) {
            revert AgeLimitError(age, "You are too young to vote");
        }

        isEligible = true;
    }
}
