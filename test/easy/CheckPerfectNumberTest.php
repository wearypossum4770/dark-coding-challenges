<?php

declare(strict_types=1);

use Src\Easy\CheckPerfectNumber;

dataset('dataCheckPerfectNumber', [
    ['Perfect number 496', 496, true],
    ['Perfect number 8_128', 8128, true],
    ['Perfect number 8_589_869_056', 8589869056, true],
    ['Perfect number 137_438_691_328', 137438691328, true],
    ['Smallest perfect number', 6, true],
    ['Medium perfect number', 28, true],
    ['Large perfect number', 33550336, true],
    ['Smallest abundant number', 12, false],
    ['Medium abundant number', 30, false],
    ['Large abundant number', 33550335, false],
    ['Smallest prime deficient number', 2, false],
    ['Smallest non-prime deficient number', 4, false],
    ['Medium deficient number', 32, false],
    ['Large deficient number', 33550337, false], ]);

dataset('dataCalculatePerfectNumber', [
    [496, 496],
    [8128, 8128],
    [8589869056, 8589869056],
    [137438691328, 137438691328],
    [6, 6],
    [28, 28],
    [33550336, 33550336],
    [12, 16],
    [30, 42],
    [33550335, 39885825],
    [2, 1],
    [4, 3],
    [32, 31],
    [33550337, 1], ]);

dataset('dataClassifyPerfectNumber', [
    ['perfect', 496],
    ['perfect', 8128],
    ['perfect', 8589869056],
    ['perfect', 137438691328],
    ['perfect', 6],
    ['perfect', 28],
    ['perfect', 33550336],
    ['abundant', 12],
    ['abundant', 30],
    ['abundant', 33550335],
    ['deficient', 2],
    ['deficient', 4],
    ['deficient', 32],
    ['deficient', 33550337],
]);

test("\n\tGiven: a number.\n\tThen: checkPerfectNumber(n) passes", function (string $criteria, int $n, bool $expected) {
    $instance = new CheckPerfectNumber;
    $result = $instance->checkPerfectNumber($n);
    expect($result)->toBe($expected);
})->with('dataCheckPerfectNumber');
test("\n\tGiven: a number.\n\tThen: calculatePerfectNumber(n) passes", function (int $n, int $expected) {
    $instance = new CheckPerfectNumber;
    $result = $instance->calculatePerfectNumber($n);
    expect($result)->toBe($expected);
})->with('dataCalculatePerfectNumber');
test("\n\tGiven: a number.\n\tThen: classifyPerfectNumber(n) passes", function (string $expected, int $n) {
    $instance = new CheckPerfectNumber;
    $result = $instance->classifyPerfectNumber($n);
    expect($result)->toBe($expected);
})->with('dataClassifyPerfectNumber');
