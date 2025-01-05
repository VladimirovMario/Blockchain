// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// TODO: Continue exploring ways to handle precision in Solidity.
// Note: Solidity does not support floating-point numbers.
// Any operation that would result in a fractional value gets truncated to an integer.
// This can lead to precision issues when performing calculations that involve division or scaling.

contract TemperatureConversion {
    // https://metaschool.so/articles/division-in-solidity
    uint256 public multiplier = 100; // Scaling factor to represent decimals

    function celsiusToFahrenheit(uint256 celsius)
        public
        pure
        returns (uint256 fahrenheit)
    {
        // https://www.calculatorsoup.com/calculators/conversions/celsius-to-fahrenheit.php
        // Formula: F = C * 1.8 + 32
        // 21.5 degrees Celsius is equal to 70.7 degrees Fahrenheit.
        fahrenheit = ((celsius * 9) / 5 + 32);
    }

    function fahrenheitToCelsius(uint256 fahrenheit)
        public
        pure
        returns (uint256 celsius)
    {
        // Formula: C = (F - 32) : 1.8
        // 75 degrees Fahrenheit is equal to 23.89 degrees Celsius.
        celsius = ((((fahrenheit - 32) * 5) / 9));
    }

    function scaledCelsiusToFahrenheit(uint256 celsius)
        public
        view
        returns (uint256 fahrenheit)
    {
        fahrenheit = ((celsius * 9 * multiplier) / 5) + (32 * multiplier);
    }

    function scaledFahrenheitToCelsius(uint256 fahrenheit)
        public
        view
        returns (uint256 celsius)
    {
        celsius = ((fahrenheit - (32 * multiplier)) * 5) / (9 * multiplier);
    }
}
