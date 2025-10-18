<?php

declare(strict_types=1);

use Src\Easy\PlusOne;

dataset('plusOneData', [
    [[4, 3, 2, 1], [4, 3, 2, 2]],
    [[1, 2, 3], [1, 2, 4]],
    [[9], [1, 0]],
    [[9, 9], [1, 0, 0]],
    [[0], [1]],
    [[5], [6]],
    [[9, 9, 9, 9], [1, 0, 0, 0, 0]],
    [[9, 9, 8], [9, 9, 9]],
    [[1, 0, 0], [1, 0, 1]],
    [[8, 9, 9], [9, 0, 0]],
    [[0, 9], [1, 0]],
    [[1, 9, 9], [2, 0, 0]],
    [[9, 9, 9, 9, 9], [1, 0, 0, 0, 0, 0]],
]);
it('solve', function (array $nums, array $expected) {
    $instance = new PlusOne;

    $result = $instance->solve($nums);

    expect($result)->toBe($expected);

})->with('plusOneData');
