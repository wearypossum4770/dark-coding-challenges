<?php

declare(strict_types=1);

use Src\Easy\NumIdenticalPairs;

dataset('numIdenticalPairsData', [
    [[1, 1, 1, 1], 6],
    [[1, 2, 3], 0],
    [[1, 2, 3, 1, 1, 3], 4],

]);
it('solve', function (array $nums, int $expected) {
    $instance = new NumIdenticalPairs;

    $result = $instance->solve($nums);

    expect($result)->toBe($expected);

})->with('numIdenticalPairsData');
