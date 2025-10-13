<?php

declare(strict_types=1);

use Src\Easy\StringIntegerIsBalanced;

dataset('stringIntegerIsBalancedData', [
    ['12', false],
    ['11', true],
    ['1234', false],
    ['24123', true],
    ['00', true],
    ['10', false],
    ['1010', false],
    ['909', false],
    ['1234567890', false],
    ['111111', true],
    ['123321', true],
    ['99999999', true],
    ['5005', true],
    ['1234567', false],
    ['1', false],
]);
it('solve', function (string $num, bool $expected) {
    $instance = new StringIntegerIsBalanced;
    $result = $instance->solve($num);
    expect($result)->toBe($expected);
})->with('stringIntegerIsBalancedData');
