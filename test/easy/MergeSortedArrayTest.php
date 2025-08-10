<?php

declare(strict_types=1);

use Src\Easy\MergeSortedArray;

dataset('mergeSortedArrayData', [
    [[1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3, [1, 2, 2, 3, 5, 6]],
    [[1], 1, [], 0, [1]],
    [[0], 0, [1], 1, [1]],
]);
it('Merges Sorted Arrays in place', function (array &$first, int $firstSize, array $second, int $secondSize, array $expected) {
    $instance = new MergeSortedArray;
    $instance->transformMergeSortedArrayInPlace($first, $firstSize, $second, $secondSize);

    expect($first)->toBe($expected);

})->with('mergeSortedArrayData');
it('Merge Sorted Arrays', function (array $first, int $firstSize, array $second, int $secondSize, array $expected) {
    $instance = new MergeSortedArray;

    $result = $instance->solve($first, $firstSize, $second, $secondSize);

    expect($result)->toBe($expected);

})->with('mergeSortedArrayData');
