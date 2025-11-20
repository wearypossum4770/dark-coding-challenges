<?php

declare(strict_types=1);

use Src\Medium\ArrayStack;

dataset('arrayStackData', [
    [[1, 3], 3, ['Push', 'Push', 'Pop', 'Push']],
    [[1, 2, 3], 3, ['Push', 'Push', 'Push']],
    [[1, 2], 4, ['Push', 'Push']],
    [[1], 1, ['Push']],
    [[1], 100, ['Push']],
    [[2], 2, ['Push', 'Pop', 'Push']],
    [[3], 3, ['Push', 'Pop', 'Push', 'Pop', 'Push']],
    [[2, 3, 4], 4, ['Push', 'Pop', 'Push', 'Push', 'Push']],
    [[1, 3, 5, 7], 7, ['Push', 'Push', 'Pop', 'Push', 'Push', 'Pop', 'Push', 'Push', 'Pop', 'Push']],
    [[5], 5, ['Push', 'Pop', 'Push', 'Pop', 'Push', 'Pop', 'Push', 'Pop', 'Push']],
    [[4, 5], 5, ['Push', 'Pop', 'Push', 'Pop', 'Push', 'Pop', 'Push', 'Push']],
    [[1, 2, 4], 4, ['Push', 'Push', 'Push', 'Pop', 'Push']],

]);
it('solve', function (array $target, int $n, array $expected) {
    $instance = new ArrayStack;

    $result = $instance->solve($target, $n);

    expect($result)->toBe($expected);

})->with('arrayStackData');
