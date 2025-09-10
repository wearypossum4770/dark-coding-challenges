<?php

declare(strict_types=1);

use Src\Easy\HeightChecker;

dataset('heightCheckerData', [
    [[1, 1, 4, 2, 1, 3], 3],
    [[5, 1, 2, 3, 4], 5],
    [[1, 2, 3, 4, 5], 0],
    [[10, 6, 6, 10, 10, 9, 8, 8, 3, 3, 8, 2, 1, 5, 1, 9, 5, 2, 7, 4, 7, 7], 22],
]);
it('solve', function (array $nums, int $expected) {
    $instance = new HeightChecker;

    $result = $instance->solve($nums);

    expect($result)->toBe($expected);

})->with('heightCheckerData');
