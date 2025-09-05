
<?php

use Src\Easy\RemoveArrayDuplicates;

describe('TestValue', function () {

    test('Testing', function ($candidate, $expected) {
        $instance = new RemoveArrayDuplicates;

        expect($instance->solve($candidate))->toBe($expected);

    })->with([
        [[1, 1, 2], 2],
        [[1, 2, 2, 3, 3], 3],
        [[1, 1, 2, 2, 3, 3, 4], 4],
    ]);

});
