<?php

declare(strict_types=1);

use Src\Easy\ThirdMax;

dataset('thirdMaxData', [
    [[3, 2, 1], 1],
    [[1, 2], 2],
    [[2, 2, 3, 1], 1],
    [[1, 2, 3, 4, 5], 3],
    [[5, 4, 3, 2, 1], 3],
    [[10, 20, 30, 40], 20],
    [[5, 5, 3, 2], 2],
    [[1, 2, 2, 3, 3], 1],
    [[-1, -2, -3, -4], -3],
    [[-10, -20, -30], -30],
    [[-10, 0, 10], -10],
    [[0, -1, 1, 2], 0],
    [[4, 4, 4, 3, 3, 2], 2],
    [[-5, -1, -3], -5],
    [[-2, -1, 0, 1, 2], 0],
]);

describe("\n\tFeature: Third Largest Integer in Array", function () {
    it(
        "\n\tGiven: an array of integers :nums.\n\tThen: it returns the third largest distinct value :expected.",
        function (array $nums, int $expected) {
            $instance = new ThirdMax;

            $result = $instance->solve($nums);

            expect($result)->toBe($expected);
        }
    )->with('thirdMaxData');
});
