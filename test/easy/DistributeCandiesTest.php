<?php

declare(strict_types=1);

use Src\Easy\DistributeCandies;

dataset('distributeCandiesData', [
    ['3 unique, can eat 3', [1, 1, 2, 2, 3, 3], 3],
    ['3 unique, can eat 2', [1, 1, 2, 3], 2],
    ['1 unique, can eat 2 -> only 1 type', [6, 6, 6, 6], 1],
    ['6 unique, can eat 3', [1, 2, 3, 4, 5, 6], 3],
    ['1 unique', [1, 1], 1],
    ["no candies can't eay any", [], 0],
    ['<constraint non-conforming> 1 unique, 1 count cannot eat', [1], 0],
    ['2 unique, can eat 1', [1, 2], 1],

]);
it('solve', function (string $criteria, array $candyType, int $expected) {
    $instance = new DistributeCandies;

    $result = $instance->solve($candyType);

    expect($result)->toBe($expected);

})->with('distributeCandiesData');
