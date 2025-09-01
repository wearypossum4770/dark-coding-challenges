<?php

declare(strict_types=1);

use Src\Easy\FindMaxConsecutiveOnes;

dataset('findMaxConsecutiveOnesData', [
    [[1, 1, 0, 1, 1, 1], 3],
    [[1, 0, 1, 1, 0, 1], 2],
    [[0], 0],
    [[1], 1],
    [[1, 1, 1, 1], 4],
]);
it('solve', function (array $n, int $expected) {
    $instance = new FindMaxConsecutiveOnes;

    $result = $instance->solve($n);

    expect($result)->toBe($expected);

})->with('findMaxConsecutiveOnesData');
