<?php

declare(strict_types=1);

use Src\Easy\MostCommonSafeWord;

dataset('mostCommonSafeWordData', [
    ['Bob hit a ball, the hit BALL flew far after it was hit.', ['hit'], 'ball'],
    ['Hello hello world!', ['world'], 'hello'],
    ['apple banana banana apple apple', [], 'apple'],
    ['dog cat dog', ['dog', 'cat'], ''],
    ['one two two three three', [], 'two'],
    ['', [], ''],
    ['Wow! Such, wow? Very-wow.', ['such'], 'wow'],
    ['test test test', ['test'], ''],
    ['123 123 !@#', [], ''],
    ['echo echo echo echo', [], 'echo'],
]);
it('solve', function (string $paragraph, array $banned, string $expected) {
    $instance = new MostCommonSafeWord;

    $result = $instance->solve($paragraph, $banned);

    expect($result)->toBe($expected);

})->with('mostCommonSafeWordData');
