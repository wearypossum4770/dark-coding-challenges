<?php

declare(strict_types=1);

use Src\Easy\SumOfLeftLeaves;
use Src\Helpers\TreeNode;

dataset('sumOfLeftLeavesData', [
    [[], 0],
    [[1], 0],
    [[1, 2], 2],
    [[1, null, 3], 0],
    [[1, 2, 3], 2],
    [[3, 9, 20, null, null, 15, 7], 24],
    [[1, 2, null, 3, null, 4], 4],
    [[1, null, 2, null, 3, null, 4], 0],
    [[1, 2, 3, 4, 5], 4],
    [[1, 2, 3, null, 4], 0],
    [[0, -1, -2], -1],
    [[1, 2, null, null, 3], 0],
    [[1, null, 2, 3], 3],
    [[1, 2, 3, 4, null, null, 5], 4],
]);
it("\n\tGiven: the tree :nums.\n\tThen: the sum of left leaves is :expected.", function (array $nums, int $expected) {
    $instance = new SumOfLeftLeaves;
    $root = TreeNode::fromArray($nums);
    $result = $instance->solve($root);

    expect($result)->toBe($expected);

})->with('sumOfLeftLeavesData');
