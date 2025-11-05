<?php

declare(strict_types=1);

use Src\Easy\CreateCounter;

dataset('createCounterData', [
    [
        10,
        ['c', 'c', 'c'],
        [10, 11, 12],
    ],
    [
        -2,
        ['c', 'c', 'c', 'c', 'c'],
        [-2, -1, 0, 1, 2],
    ],
    [
        0,
        [],
        [],
    ],
    [
        1000,
        ['c'],
        [1000],
    ],
    [
        0,
        ['c'],
        [0],
    ],
    [
        0,
        [],
        [],
    ],
    [
        999,
        ['c', 'c', 'c'],
        [999, 1000, 1001],
    ],
    [
        -1_000,
        ['c', 'c'],
        [-1000, -999],
    ],
    [
        3,
        ['c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'],
        [3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
    ],
    [
        42,
        ['c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c'],
        [42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61],
    ],
    [
        7,
        ['c'],
        [7],
    ],
    [
        100,
        ['c', 'c', 'c', 'c', 'c'],
        [100, 101, 102, 103, 104],
    ],
    [
        -1000,
        ['c', 'c', 'c'],
        [-1000, -999, -998],
    ],
]);
it('solve', function (int $n, array $operations, array $expected) {
    $instance = new CreateCounter;

    $result = $instance->createCounter($n);
    $actual = array_fill(0, count($expected), 0);
    for ($i = 0; $i < count($operations); $i++) {
        $instance->captureCounter($actual, $i, $result);
    }
    expect($actual)->toBe($expected);

})->with('createCounterData');
