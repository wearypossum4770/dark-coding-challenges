<?php

declare(strict_types=1);

use Src\Easy\FindLucky;

dataset('findLuckyData', [
    [[2, 2, 3, 4], 2],
    [[1, 2, 2, 3, 3, 3], 3],
    [[2, 2, 2, 3, 3], -1],
    [[0, 0, 0], -1],
    [[1], 1],
    [[2], -1],
    [[2, 2, 3, 3, 3], 3],
    [[1, 1, 2, 2], 2],
    [[4, 4, 4, 4], 4],
    [[7, 7, 7], -1],
    [[0, 1, 2, 2], 2],
]);
it('\nt\tGiven: the array :arr.\n\tThen: the maximum frequency of the relationship between the number and its index is :expected.', function (array $arr, int $expected) {
    $instance = new FindLucky;

    $result = $instance->solve($arr);

    expect($result)->toBe($expected);

})->with('findLuckyData');
