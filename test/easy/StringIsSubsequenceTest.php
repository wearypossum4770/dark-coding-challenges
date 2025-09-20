<?php

declare(strict_types=1);

use Src\Easy\StringIsSubsequence;

dataset('stringIsSubsequenceData', [
    ['abc', 'ahbgdc', true],
    ['', '', true],
    ['', 'anything', true],
    ['a', 'a', true],
    ['a', 'b', false],
    ['z', 'abc', false],
    ['acb', 'abc', false],
    ['xyz', 'abcxyz', true],
    ['aaa', 'aaaaaa', true],
    ['aaa', 'aa', false],
    ['abc', 'abc', true],
    ['abc', 'a' . str_repeat('x', 9999) . 'b' . str_repeat('y', 9999) . 'c', true],
    ['ace', 'abcde', true],
    ['aec', 'abcde', false],
    ['axc', 'ahbgdc', false],
]);
it('solve', function (string $s, string $t, bool $expected) {
    $instance = new StringIsSubsequence;

    $result = $instance->solve($s, $t);

    expect($result)->toBe($expected);

})->with('stringIsSubsequenceData');
