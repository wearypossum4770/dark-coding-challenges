<?php

declare(strict_types=1);

use Src\Easy\AddBinary;

dataset('addBinaryData', [
    ['11', '1', '100'],
    ['1010', '1011', '10101'],
]);
it('solve', function (string $a, string $b, string $expected) {
    $instance = new AddBinary;

    $result = $instance->solve($a, $b);

    expect($result)->toBe($expected);

})->with('addBinaryData');
