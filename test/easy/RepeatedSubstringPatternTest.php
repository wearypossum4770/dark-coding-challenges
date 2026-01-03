<?php

declare(strict_types=1);

use Src\Easy\RepeatedSubstringPattern;

dataset('repeatedSubstringPatternData', [
    ['a', false],
    ['aa', true],
    ['ab', false],
    ['aba', false],
    ['abab', true],
    ['ababba', false],
    ['abcabc', true],
    ['abcabcabcabc', true],
    ['abcdabcd', true],
    ['abcdabce', false],
    ['aaaaaaaa', true],
    ['aaaaaaab', false],
    ['abaababaab', true],
    ['abaaba', true],
    ['abaabab', false],
    ['xyzxyzxyz', true],
    ['xyzxy', false],
    ['zz', true],
    ['z', false],
    ['ababababx', false],
]);
it("\n\tGiven: the string :s.\n\tThen: it can be constructed from substrings :expected.", function (string $s, bool $expected) {
    $instance = new RepeatedSubstringPattern;

    $result = $instance->solve($s);

    expect($result)->toBe($expected);

})->with('repeatedSubstringPatternData');
