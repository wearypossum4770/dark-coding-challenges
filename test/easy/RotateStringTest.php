<?php

declare(strict_types=1);

use Src\Easy\RotateString;

dataset('rotateStringData', [
    ['abcde', 'cdeab', true],
    ['abcde', 'eabcd', true],
    ['abcde', 'abcde', true],
    ['abcde', 'abced', false],
    ['abcde', 'edcba', false],
    ['aa', 'a', false],
    ['a', 'aa', false],
    ['abc', 'abcd', false],
    ['aaaa', 'aaaa', true],
    ['aabb', 'bbaa', true],
    ['aabb', 'abab', false],
    ['aabb', 'abba', true],
    ['defdefdefabcabc', 'defdefabcabcdef', true],
    ['bbbacddceeb', 'ceebbbbacdd', true],
    ['a', 'a', true],
    ['a', 'b', false],
    ['', '', true],
    ['abcabc', 'bcabca', true],
    ['abcabc', 'cabacb', false],

]);
it("\n\tGiven: the  strings :s and :goal.\n\tThen: the second is  rotation of the first :expected.", function (string $s, string $goal, bool $expected) {
    $instance = new RotateString;

    $result = $instance->solve($s, $goal);

    expect($result)->toBe($expected);

})->with('rotateStringData');
