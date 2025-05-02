
<?php

use Src\Easy\IsPangram;

describe('Feature: Pangram Test', function () {
    $instance = new IsPangram;
    test('Given: various text inputs, determine if they form a pangram.', function ($expected, $text) use ($instance) {
        // Assert that the solve() method returns the correct result for each input string

        expect($instance->solve($text))->toBe($expected);
    })->with([
        // Test case: empty sentence should return false
        'empty sentence should return false' => [false, ''],

        // Test case: perfect lowercase pangram
        'perfect lowercase pangram should return true' => [true, 'abcdefghijklmnopqrstuvwxyz'],

        // Test case: standard pangram with lowercase letters
        'standard lowercase pangram should return true' => [true, 'the quick brown fox jumps over the lazy dog'],

        // Test case: missing the letter 'x' should return false
        "missing the letter 'x' should return false" => [false, 'a quick movement of the enemy will jeopardize five gunboats'],

        // Test case: missing the letter 'h' should return false
        "missing the letter 'h' should return false" => [false, 'five boxing wizards jump quickly at it'],

        // Test case: underscores should not affect the result
        'with underscores should return true' => [true, 'the_quick_brown_fox_jumps_over_the_lazy_dog'],

        // Test case: numbers included should not affect the result
        'with numbers should return true' => [true, 'the 1 quick brown fox jumps over the 2 lazy dogs'],

        // Test case: numbers replacing missing letters should return false
        'missing letters replaced by numbers should return false' => [false, '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'],

        // Test case: mixed case and punctuation should still form a valid pangram
        'mixed case and punctuation should return true' => [true, '"Five quacking Zephyrs jolt my wax bed."'],

        // Test case: both 'a-m' and 'A-M' included but still not a pangram
        'both a-m and A-M but not a pangram should return false' => [false, 'abcdefghijklm ABCDEFGHIJKLM'],

        // Test case: non-alphanumeric characters should not be considered a pangram
        'non-alphanumeric printable ASCII should return false' => [false, " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"],
    ]);
});
