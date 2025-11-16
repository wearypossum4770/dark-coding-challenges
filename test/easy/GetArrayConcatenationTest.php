<?php

declare(strict_types=1);

use Src\Easy\GetArrayConcatenation;

dataset('getArrayConcatenationData', [
    [[1, 2, 1], [1, 2, 1, 1, 2, 1]],
    [[1, 3, 2, 1], [1, 3, 2, 1, 1, 3, 2, 1]],
    [[1], [1, 1]],
    [[1000], [1000, 1000]],
    [[1, 1, 1], [1, 1, 1, 1, 1, 1]],
    [[2, 4, 6], [2, 4, 6, 2, 4, 6]],
    [[5, 10], [5, 10, 5, 10]],
    [[0, 1, 0], [0, 1, 0, 0, 1, 0]],
    [[1, 2, 3, 2, 1], [1, 2, 3, 2, 1, 1, 2, 3, 2, 1]],
]);
it('solve', function (array $nums, array $expected) {
    $instance = new GetArrayConcatenation;

    $result = $instance->solve($nums);

    expect($result)->toBe($expected);

})->with('getArrayConcatenationData');
