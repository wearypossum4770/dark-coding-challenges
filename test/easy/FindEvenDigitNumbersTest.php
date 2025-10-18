<?php

declare(strict_types=1);

use Src\Easy\FindEvenDigitNumbers;

dataset('findEvenDigitNumbersData', [
    [[12, 345, 2, 6, 7896], 2],
    [[555, 901, 482, 1771], 1],

]);
it('solve', function (array $nums, int $expected) {
    $instance = new FindEvenDigitNumbers;

    $result = $instance->solve($nums);

    expect($result)->toBe($expected);

})->with('findEvenDigitNumbersData');
