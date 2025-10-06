<?php

declare(strict_types=1);

use Src\Easy\PascalsTriangle;

dataset('pascalsTriangleData', [
    [1, [[1]]],
    [2, [[1], [1, 1]]],
    [3, [[1], [1, 1], [1, 2, 1]]],
    [4, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]],
    [5, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]],
    [6, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]],
]);
it('solve', function (int $n, array $expected) {
    $instance = new PascalsTriangle;

    $result = $instance->solve($n);

    expect($result)->toBe($expected);

})->with('pascalsTriangleData');
