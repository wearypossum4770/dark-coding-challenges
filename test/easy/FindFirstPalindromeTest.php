<?php

declare(strict_types=1);

use Src\Easy\FindFirstPalindrome;

dataset('findFirstPalindromeData', [
    [['abc', 'car', 'ada', 'racecar', 'cool'], 'ada'],
    [['notapalindrome', 'racecar'], 'racecar'],
    [['def', 'ghi'], ''],
]);
it('solve', function (array $words, string $expected) {
    $instance = new FindFirstPalindrome;

    $result = $instance->solve($words);

    expect($result)->toBe($expected);

})->with('findFirstPalindromeData');
