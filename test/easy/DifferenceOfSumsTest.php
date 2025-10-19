<?php

declare(strict_types=1);

use Src\Easy\DifferenceOfSums;

dataset('differenceOfSumsData', [
    [10, 3, 19],
    [5, 6, 15],
    [5, 1, -15],

]);
it('solve', function (int $n, int $m, int $expected) {
    $instance = new DifferenceOfSums;

    $result = $instance->solve($n, $m);

    expect($result)->toBe($expected);

})->with('differenceOfSumsData');
