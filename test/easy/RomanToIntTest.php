<?php

use Src\Easy\RomanToInt;

set_time_limit(5); // 5 seconds

// require_once 'RomanToInt.php';
describe('Feature: Roman to Integer conversion', function () {
    describe(
        "Scenario: Convert a Roman numeral to it's integer form",
        function () {
            describe('Given a valid roman numeral', function () {
                /**
                 * @test
                 *
                 * @timeout 5
                 */
                test('A valid arabic integer is returned.', function (
                    $roman,
                    $expected
                ) {
                    $romanNumeral = new RomanToInt;
                    expect($romanNumeral->romanToInt($roman))->toBe($expected);
                })->with([
                    'double_with_subtraction' => ['XXIX', 29],
                    'single_character' => ['I', 1],
                    'double_character' => ['IV', 4],
                    'triple_character' => ['III', 3],
                    'quadruple_character_invalid' => ['AAAA', 0],
                    'five_characters' => ['VIII', 8],
                    'double_different_characters' => ['XC', 90],
                    'triple_different_characters' => ['CM', 900],
                    'four_different_characters' => ['MCMXCIV', 1994],
                    'all_caps_valid' => ['MMMCMXCIV', 3994],
                    'complex_mixed' => ['XXVII', 27],
                    'medium_number' => ['LVIII', 58],
                    'higher_hundreds' => ['CCV', 205],
                    'higher_thousands' => ['MMM', 3000],
                    'near_thousand' => ['CMXCIX', 999],
                    'mid_thousands' => ['MMMDCCCLXXXVIII', 3888],
                    'high_thousands' => ['MMMCMX', 3910],
                    'mid_range' => ['LIV', 54],
                    'lower_mid_range' => ['CDXLIV', 444],
                    'single_thousand' => ['M', 1000],
                ]);
            });
        }
    );
});
