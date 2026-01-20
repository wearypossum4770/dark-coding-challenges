<?php

declare(strict_types=1);

use Src\Easy\PreOrderTraversal;
use Src\Helpers\TreeNode;

dataset('preOrderTraversalData', [
    [[], [], 'Empty tree'],
    [[null], [], 'Single null node'],
    [[1], [1], 'Single node'],
    [[0], [0], 'Single zero node'],
    [[1, 2], [1, 2], 'Root with left child only'],
    [[1, null, 2], [1, 2], 'Root with right child only'],
    [[1, 2, 3], [1, 2, 3], 'Complete tree depth 1'],
    [[1, 2, null, 3, null, 4], [1, 2, 3, 4], 'Left-skewed tree'],
    [[1, null, 2, null, 3, null, 4], [1, 2, 3, 4], 'Right-skewed tree'],
    [[1, 2, null, 3, null, 4, null, 5], [1, 2, 3, 4, 5], 'Deep left-skewed tree'],
    [[1, 2, 3, 4, 5, 6, 7], [1, 2, 4, 5, 3, 6, 7], 'Complete binary tree depth 2'],
    [[100, 50, 150, 25, 75, 125, 175], [100, 50, 25, 75, 150, 125, 175], 'Balanced BST structure'],
    [[1, 2, 3, null, null, 4, 5], [1, 2, 3, 4, 5], 'Nulls in middle level'],
    [[1, 2, 3, null, 4, null, 5], [1, 2, 4, 3, 5], 'Alternating nulls'],
    [[1, 2, 3, 4, null, null, null, 5], [1, 2, 4, 5, 3], 'Deep left child only'],
    [[1, null], [1], 'Single trailing null'],
    [[1, null, null], [1], 'Multiple trailing nulls'],
    [[1, 2, 3, null, null, null, null], [1, 2, 3], 'Complete tree with trailing nulls'],
    [[-50, null, 50, null, null, -25, 75], [-50, 50], 'Extra values after complete branches (orphaned)'],
    [[-1, null, -2, null, -3], [-1, -2, -3], 'Right-skewed negative numbers'],
    [[-10, -20, -30, -40, -50], [-10, -20, -40, -50, -30], 'Complete tree with negatives'],
    [[-50, null, 50, -25, 75], [-50, 50, -25, 75], 'Mixed negative and positive'],
    [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], 'All zeros'],
    [[0, -1, 1, -2, 2, -3, 3], [0, -1, -2, 2, 1, -3, 3], 'Zero root with mixed values'],
    [[1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1], 'All duplicate values'],
    [[-2147483648, null, 2147483647], [-2147483648, 2147483647], 'Min and max 32-bit integers'],
    [[10, 5, 15, 3, 7, null, 20], [10, 5, 3, 7, 15, 20], 'BST structure with missing node'],
    [[5, 3, 8, 1, 4, null, 9, null, 2], [5, 3, 1, 2, 4, 8, 9], 'Complex asymmetric tree'],
    [[1, 2, 3, 4, null, 5, 6, null, null, null, null, 7], [1, 2, 4, 3, 5, 6, 7], 'Mixed depth with sparse nulls'],
    [[1, null, 2, 3], [1, 2, 3], 'Right child with left grandchild'],
    [[1, 2, null, null, 3, null, 4, null, 5], [1, 2, 3, 4, 5], 'Zigzag pattern'],
    [[1, null, 2, 3, null, 4, null, 5], [1, 2, 3, 4, 5], 'Right-heavy zigzag'],
    [[1, 2, null, 3, 4, null, null, 5, 6], [1, 2, 3, 4, 5, 6], 'Left subtree with deep right branches'],
    [[10, 5, null, 3, null, 7, null, 1], [10, 5, 3, 7, 1], 'Left child with alternating pattern'],
    [[1, 2, 3, null, null, null, 4], [1, 2, 3, 4], 'Right child of right child only'],
    [[1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 'Very deep left-skewed (10 levels)'],
    [[1, null, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 'Very deep right-skewed (10 levels)'],
    [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 12, 13, 7, 14, 15], 'Complete binary tree depth 3 (15 nodes)'],
    [[1, null, null, null, 2], [1], 'Orphaned node after nulls'],
    [[1, 2, 3, null, null, null, null, null, null, 4], [1, 2, 3], 'Node far beyond tree structure'],

]);
it("\n\tGiven: the tree :nums.\n\tThen: it will be :expected after post order traversal.", function (array $nums, array $expected, string $criteria) {
    $instance = new PreOrderTraversal;
    $root = TreeNode::fromArray($nums);
    $result = $instance->solve($root);

    expect($result)->toBe($expected);

})->with('preOrderTraversalData');
