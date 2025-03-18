
<?php

use Src\Easy\TwoSum;

describe('TestValue', function () {

    test('Testing', function ($candidate, $target, $expected) {
        $instance = new TwoSum;

        expect($instance->solve($candidate, $target))->toBe($expected);

    })->with([
        '' => [[2, 7, 11, 15], 9, [0, 1]],
    ]);

});
