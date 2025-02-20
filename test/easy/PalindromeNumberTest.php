<?php

use Src\Easy\PalindromeNumber;

it('works', function ($number, $expected) {
    $palindrome = new PalindromeNumber;
    expect($palindrome->checkPalindrome($number))->toBe($expected);
})->with([
    'single digit' => [7, true],
    'large palindrome' => [1234321, true],
    '123 is not a palindrome' => [123, false],
    '131 is a palindrome' => [131, true],
    '0 is a palindrome' => [0, true],
    '13 is not a palindrome' => [13, false],
    '-121 is not a palindrome (negative number)' => [-121, false],
    '121 is a palindrome' => [121, true],
    '1221 is a palindrome' => [1221, true],
    '10 is not a palindrome' => [10, false],
    '-101 is not a palindrome (negative number)' => [-101, false],
    '-10 is not a palindrome (negative number)' => [-10, false],
    '-1 is not a palindrome (negative number)' => [-1, false],
    '0 is a palindrome (single digit)' => [0, true],
    '3 is a palindrome (single digit)' => [3, true],
    '8 is a palindrome (single digit)' => [8, true],
    '9 is a palindrome (single digit)' => [9, true],
    '11 is a palindrome' => [11, true],
]);
