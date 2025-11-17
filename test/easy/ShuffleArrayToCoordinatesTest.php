<?php

declare(strict_types=1);

use Src\Easy\ShuffleArrayToCoordinates;

dataset('shuffleArrayToCoordinatesData', []);
it('solve', function (int $n, int $expected) {
    $instance = new ShuffleArrayToCoordinates;

    $result = $instance->solve($n);

    expect($result)->toBe($expected);

})->with('shuffleArrayToCoordinatesData');
