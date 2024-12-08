// SPDX-License-Identifier: MIT
pragma solidity 0.8.28 .0;

contract SimpleVoting {
    address public candidate1 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address public candidate2 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    uint256 public votesCandidateOne;
    uint256 public votesCandidateTwo;

    // Value Types
    bool public isVotingEnded = false;
    bool public isChosenWinner = false;

    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public winner;

    function vote(address candidate) external {
        // The condition is on the left, and the error message is on the right.
        // require(candidate == candidate1, "This voting is not allowed!!!!");

        require(!isVotingEnded, "Voting has already ended");

        if (candidate == candidate1) {
            votesCandidateOne += 1;
        } else if (candidate == candidate2) {
            votesCandidateTwo += 1;
        } else {
            revert("This voting is not allowed!");
        }
    }

    function choseWinner() external {
        // If the condition evaluates to **false**,
        // require reverts the transaction and optionally provides an error message (the second argument).
        require(msg.sender == owner, "Only the owner can choose the winner");
        require(!isChosenWinner, "Choosing the winner has already ended");

        if (votesCandidateOne > votesCandidateTwo) {
            winner = candidate1;
        } else if (votesCandidateTwo > votesCandidateOne) {
            winner = candidate2;
        } else {
            revert("Votes are equal.");
        }

        isChosenWinner = true;
    }

    function endVoting() external {
        require(!isVotingEnded, "Voting has already ended");

        if (msg.sender != owner) {
            revert("Only the owner can end the voting.");
        } else {
            isVotingEnded = true;
        }
    }
}
