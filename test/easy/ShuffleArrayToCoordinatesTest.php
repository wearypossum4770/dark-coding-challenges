<?php

declare(strict_types=1);

use Src\Easy\ShuffleArrayToCoordinates;

dataset('shuffleArrayToCoordinatesData', [
    [[2, 5, 1, 3, 4, 7], 3, [2, 3, 5, 4, 1, 7]],
    [[1, 2, 3, 4, 4, 3, 2, 1], 4, [1, 4, 2, 3, 3, 2, 4, 1]],
    [[1, 1, 2, 2], 2, [1, 2, 1, 2]],
]);
it('solve', function (array $nums, int $n, array $expected) {
    $instance = new ShuffleArrayToCoordinates;

    $result = $instance->solve($nums, $n);

    expect($result)->toBe($expected);

})->with('shuffleArrayToCoordinatesData');
