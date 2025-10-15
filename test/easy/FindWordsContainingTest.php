<?php

declare(strict_types=1);

use Src\Easy\FindWordsContaining;

dataset('findWordsContainingData', [
    [['abc', 'bcd', 'aaaa', 'cbc'], 'a', [0, 2]],
    [['leet', 'code'], 'e', [0, 1]],
    [['abc', 'bcd', 'aaaa', 'cbc'], 'z', []],
]);
it('solve', function (array $nums, string $x, array $expected) {
    $instance = new FindWordsContaining;

    $result = $instance->solve($nums, $x);

    expect($result)->toBe($expected);

})->with('findWordsContainingData');
