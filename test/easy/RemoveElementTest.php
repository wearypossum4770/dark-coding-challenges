
<?php

use Src\Easy\RemoveElement;

describe("\n\tFeature: Remove Element from Array.", function () {
    test('Testing', function ($nums, $target, $expected, $output) {
        $instance = new RemoveElement;
        $result = $instance->solve($nums, $target);
        expect($result)->toBe($expected);

    })->with([
        [[3, 2, 2, 3], 3, 2, [2, 2]],
        [[0, 1, 2, 2, 3, 0, 4, 2], 2, 5, [0, 1, 3, 0, 4]],
    ]);

});
