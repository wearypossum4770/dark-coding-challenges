<?php

declare(strict_types=1);

use Src\Easy\SumOfMultiples;

dataset('sumOfMultiplesData', [
    [1, 0],
    [2, 0],
    [3, 3],
    [5, 8],
    [7, 21],
    [9, 30],
    [10, 40],
    [12, 52],
    [15, 81],
    [20, 119],
    [21, 140],
    [50, 691],
    [100, 2_838],
    [1_000, 272_066],
    [200, 10_845],

]);
it('solve', function (int $n, int $expected) {
    $instance = new SumOfMultiples;

    $result = $instance->solve($n);

    expect($result)->toBe($expected);

})->with('sumOfMultiplesData');
