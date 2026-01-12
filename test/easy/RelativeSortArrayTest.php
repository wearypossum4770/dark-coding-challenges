<?php

declare(strict_types=1);

use Src\Easy\RelativeSortArray;

dataset('relativeSortArrayData', [
    [[2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19], [2, 1, 4, 3, 9, 6], [2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19]],
    [[28, 6, 22, 8, 44, 17], [22, 28, 8, 6], [22, 28, 8, 6, 17, 44]],
    [[5, 3, 8, 1, 9, 2], [], [1, 2, 3, 5, 8, 9]],
    [[5, 5, 2, 2, 8, 8], [2, 5, 8], [2, 2, 5, 5, 8, 8]],
    [[42], [42], [42]],
    [[100, 1, 100, 2], [1, 2], [1, 2, 100, 100]],
    [[3, 3, 3, 3, 3], [3], [3, 3, 3, 3, 3]],
    [[0], [0], [0]],
    [[], [1, 2, 3], []],
    [[7, 1, 7, 1, 7], [7, 1], [7, 7, 7, 1, 1]],
    [[999, 0, 500, 1000, 0], [0, 1000], [0, 0, 1000, 500, 999]],
    [[1, 2, 3, 4, 5], [5, 4, 3, 2, 1], [5, 4, 3, 2, 1]],
]);
it('solve', function (array $arr1, array $arr2, array $expected) {
    $instance = new RelativeSortArray;

    $result = $instance->solve($arr1, $arr2);

    expect($result)->toBe($expected);

})->with('relativeSortArrayData');
