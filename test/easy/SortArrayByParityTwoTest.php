<?php

declare(strict_types=1);

use Src\Easy\SortArrayByParityTwo;

dataset('sortArrayByParityTwoData', [
    [[4, 2, 5, 7], [4, 5, 2, 7]],
    [[2, 3], [2, 3]],

]);
it('solve', function (array $nums, array $expected) {
    $instance = new SortArrayByParityTwo;

    $result = $instance->solve($nums);

    expect($result)->toBe($expected);

})->with('sortArrayByParityTwoData');
