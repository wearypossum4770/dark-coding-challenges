<?php

declare(strict_types=1);

use Src\Easy\RemoveDuplicateZeros;

dataset('removeDuplicateZerosData', [
    [[1, 0, 2, 3, 0, 4, 5, 0], [1, 0, 0, 2, 3, 0, 0, 4]],
    [[1, 2, 3], [1, 2, 3]],
    [[0, 0, 0], [0, 0, 0]],
    [[0], [0]],
    [[7], [7]],
    [[1, 2, 0], [1, 2, 0]],
    [[0, 1, 0, 2, 0, 3], [0, 0, 1, 0, 0, 2]],
]);
it('solve', function (array $nums, array $expected) {
    $instance = new RemoveDuplicateZeros;

    $instance->solve($nums);

    expect($nums)->toBe($expected);

})->with('removeDuplicateZerosData');
