<?php

declare(strict_types=1);

use Src\Easy\MaxDepth;
use Src\Helpers\TreeNode;

dataset('maxDepthData', [
    [[3, 9, 20, null, null, 15, 7], 3],
    [[1, null, 2], 2],
    [[1], 1],
    [[], 0],
    [[1, 2, null, 3, null, 4, null, 5], 5],
    [[1, null, 2, null, 3, null, 4, null, 5], 5],
    [[1, 2, 3, 4, 5, 6, 7], 3],
    [[1, 2, 3, 4, 5, 6, null], 3],
    [[5, 4, 6, 3, null, null, 7, null, 2], 4],
    [[-100, -100, -100, -100, -100], 3],
    [[0], 1],
    [[100], 1],
    [[10, 20, null, 30, null, 40, null, 50], 5],
]);
it('solve', function (array $nums, int $expected) {
    $instance = new MaxDepth;
    $root = TreeNode::fromArray($nums);
    $result = $instance->solve($root);

    expect($result)->toBe($expected);

})->with('maxDepthData');
