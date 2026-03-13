<?php

declare(strict_types=1);

use Src\Easy\FindLargestAltitude;

dataset('findLargestAltitudeData', [
    [[-5, 1, 5, 0, -7], 1],
    [[-4, -3, -2, -1, 4, 3, 2], 0],
    [[0], 0],
    [[-100], 0],
    [[1], 1],
    [[0, 0, 0, 0], 0],
    [[1, 2, 3, 4, 5], 15],
    [[-1, -2, -3, -4, -5], 0],
    [[5, 5, 5, 5], 20],
    [[-5, -5, -5, -5], 0],
    [[10, -20, 10], 10],
    [[1, 1, 1, 1, -100], 4],
    [[-100, 1, 1, 1, 1], 0],
    [[50, -100, 50, -100, 50], 50],
    [[100, -100, -100, -100], 100],
    [[-1, -1, -1, 1, 1], 0],
    [[1, -1, 1, -1, 1, -1], 1],
    [[1, 1, 1, 1, 1], 5],
    [[-100], 0],
    [[100], 100],
]);
it('solve', function (array $gain, int $expected) {
    $instance = new FindLargestAltitude;

    $result = $instance->solve($gain);

    expect($result)->toBe($expected);

})->with('findLargestAltitudeData');
