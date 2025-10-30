<?php

declare(strict_types=1);

use Src\Easy\SortArrayByParity;

set_time_limit(5); // 5 seconds

dataset('sortArrayByParityData', [
    [[3, 1, 2, 4], [2, 4, 1, 3]],
    [[0, 1, 2], [0, 2, 1]],
    [[0], [0]],
]);
/**
 * @test
 *
 * @timeout 5
 */
it('solve', function (array $nums, array $expected) {
    $instance = new SortArrayByParity;

    $result = $instance->solve($nums);

    expect($result)->toBe($expected);

})->with('sortArrayByParityData');
