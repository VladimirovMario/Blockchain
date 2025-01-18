// SPDX-License-Identifier: MIT
pragma solidity 0.8.28 .0;

contract LoanCalculator {
    uint256 public constant MINIMUM_LOAN_PERIOD = 1;
    uint256 public constant MINIMUM_RATE = 0;
    uint256 public constant MAX_RATE = 100;

    error InvalidInterestRate(uint256 interestRate, string message);
    error InvalidLoanPeriod(uint256 loanPeriodInYears, string message);

    function calculateTotalPayable(
        uint256 principal,
        uint256 interestRate,
        uint256 loanPeriodInYears
    ) public pure returns (uint256 totalPayableAmount) {
        if (interestRate < MINIMUM_RATE || interestRate > MAX_RATE) {
            revert InvalidInterestRate(
                interestRate,
                "Interest rate should be between 0 and 100."
            );
        }

        if (loanPeriodInYears < MINIMUM_LOAN_PERIOD) {
            revert InvalidLoanPeriod(
                loanPeriodInYears,
                "Loan period should be at least 1 year."
            );
        }

        totalPayableAmount =
            principal +
            ((principal * interestRate * loanPeriodInYears) / 100);
    }
}
