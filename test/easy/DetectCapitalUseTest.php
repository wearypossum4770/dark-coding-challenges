<?php

declare(strict_types=1);

use Src\Easy\DetectCapitalUse;

dataset('detectCapitalUseData', [
    ['USA', true],
    ['UsA', false],
    ['leetcode', true],
    ['Google', true],
    ['FlaG', false],
    ['g', true],
    ['G', true],
    ['LeetCode', false],
    ['aPPle', false],
    ['APPLE', true],
    ['apple', true],
    ['Apple', true],
    ['AppLe', false],
    ['zZZ', false],
    ['HELlo', false],
    ['qwerty', true],
    ['Qwerty', true],
    ['QWERTY', true],
    ['QwErTy', false],
    ['Abcdefg', true],
    ['abcdEfg', false],
]);
it('solve', function (string $word, bool $expected) {
    $instance = new DetectCapitalUse;

    $result = $instance->solve($word);

    expect($result)->toBe($expected);

})->with('detectCapitalUseData');
