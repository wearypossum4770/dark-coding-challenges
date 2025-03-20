
<?php

use Src\Easy\FindContentChildren;

describe('Feature Find Content Children', function () {
    $instance = new FindContentChildren;
    describe('Scenario:', function () use ($instance) {
        test('Testing', function ($children, $cookies, $expected) use ($instance) {
            expect($instance->solve($children, $cookies))->toBe($expected);
        })->with([
            'some children unsatisfied' => [[1, 2, 3], [1, 1], 1],
            'all children satisfied' => [[1, 2], [1, 2, 3], 2],
            'unsorted children, sorted cookies' => [[10, 9, 8, 7], [5, 6, 7, 8], 2],
            'no children' => [[], [1, 2], 0],
            'no cookies' => [[1, 2], [], 0],
        ]);
    });
});
