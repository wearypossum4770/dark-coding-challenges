<?php

declare(strict_types=1);

use Src\Easy\SingleNumber;

dataset('singleNumberData', [
    [[2, 2, 1], 1],
    [[4, 1, 2, 1, 2], 4],
    [[1], 1],
]);
it('solve', function (array $n, int $expected) {
    $instance = new SingleNumber;

    $result = $instance->solve($n);

    expect($result)->toBe($expected);

})->with('singleNumberData');
