<?php

declare(strict_types=1);

use Src\Easy\IsSameTree;
use Src\Helpers\TreeNode;

function correctTreeValues(string $num): ?int
{
    return $num === 'X' || $num === 'x' ? null : (int) $num;
}

dataset('isSameTreeData', [
    [[], [], true],
    [[1], [], false],
    [[], [1], false],

    [[1], [1], true],
    [[1], [2], false],

    [[1, 2, 3], [1, 2, 3], true],
    [[1, 2, 3], [1, 3, 2], false],

    [[1, 2], [1, null, 2], false],
    [[1, null, 2], [1, null, 2], true],

    [[1, 2, 1], [1, 1, 2], false],

    [[1, 2, null, 3], [1, 2, null, 3], true],
    [[1, 2, null, 3], [1, 2, 3], false],

    [[1, null, 2, 3], [1, null, 2, null, 3], false],

    [[0], [0], true],
    [[0], [null], false],

    [[-1, -2, -3], [-1, -2, -3], true],
    [[-1, -2, -3], [-1, -3, -2], false],

    [[1, 2, 3, null, null, 4, 5], [1, 2, 3, null, null, 4, 5], true],
    [[1, 2, 3, null, null, 4, 5], [1, 2, 3, null, 4, null, 5], false],

    [[1, 2, null, 3, null, 4], [1, 2, null, 3, null, 4], true],
    [[1, 2, null, 3, null, 4], [1, 2, null, 3, 4], false],

    [[1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 6, 8], false],

    [[1, 2, 3], [1, 2], false],
    [[1, 2], [1, 2, 3], false],
    [
        [1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10, null,
            11, null, 12, null, 13, null, 14, null, 15, null, 16, null, 17, null, 18, null, 19, null,
            20, null, 21, null, 22, null, 23, null, 24, null, 25, null, 26, null, 27, null, 28, null,
            29, null, 30, null, 31, null, 32, null, 33, null, 34, null, 35, null, 36, null, 37, null,
            38, null, 39, null, 40, null, 41, null, 42, null, 43, null, 44, null, 45, null, 46, null,
            47, null, 48, null, 49, null, 50],
        [1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10, null,
            11, null, 12, null, 13, null, 14, null, 15, null, 16, null, 17, null, 18, null, 19, null,
            20, null, 21, null, 22, null, 23, null, 24, null, 25, null, 26, null, 27, null, 28, null,
            29, null, 30, null, 31, null, 32, null, 33, null, 34, null, 35, null, 36, null, 37, null,
            38, null, 39, null, 40, null, 41, null, 42, null, 43, null, 44, null, 45, null, 46, null,
            47, null, 48, null, 49, null, 50],
        true,
    ],
    [
        [1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10, null,
            11, null, 12, null, 13, null, 14, null, 15, null, 16, null, 17, null, 18, null, 19, null,
            20, null],
        [1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10, null,
            11, null, 12, null, 13, null, 14, null, 15, null, 16, null, 17, null, 18, null, 99, null,
            20, null],
        false,
    ],
    [
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
        true,
    ],
    [
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 99],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
        false,
    ],
    [
        [1, null, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9],
        [1, null, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9],
        true,
    ],
]);
dataset('algoMonsterTreeData', [
    ['1 2 x x 3 x x', '1 2 x x 3 x x',  true],
    ['1 2 x x 3 x x', '1 2 x x x', false],
    ['1 2 x x 3 x x', '1 x 2 x x', false],
    ['1 2 3 x x x x', '1 x 2 x 3 x x', false],
    ['x', 'x', true],
    ['1 x x', 'x', false],
    ['1 x x', '1 x x', true],
    ['1 x x', '2 x x', false],
    ['1 2 x x x', '1 x 2 x x', false],
    ['1 2 3 x x x x', '1 2 3 x x x x', true],
    ['1 2 3 x x x x', '1 2 4 x x x x', false],
    ['5 3 1 x x 4 x x 7 6 x x 9 x x', '5 3 1 x x 4 x x 7 6 x x 9 x x', true],
    ['1 2 4 x x 5 x x 3 6 x x 7 x x', '1 2 4 x x 5 x x 3 6 x x 8 x x', false],
    ['1 2 x x 3 x x', '1 x 2 x 3 x x', false,
    ],
    ['10 5 2 x x 7 x x 15 12 x x 20 x x', '10 5 2 x x 7 x x 15 12 x x 20 x x', true],
    ['1 x 2 x 3 x 4 x x', '1 x 2 x 3 x 4 x x', true],
    ['4 3 2 1 x x x x x', '4 3 2 1 x x x x x', true],
    ['8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x', '8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x', true,
    ],
    ['3 x 4 x 5 x 6 x x', '3 x 4 x 5 x 7 x x', false],
    ['100 50 25 x x 75 x x 150 125 x x 175 x x', '100 50 25 x x 75 x x 150 125 x x 175 x x', true],

]);
describe("\n\tBinary Tree Equality", function () {
    $instance = new IsSameTree;
    it('solve', function (array $p, array $q, bool $expected) use ($instance) {
        $lhs = TreeNode::fromArray($p);
        $rhs = TreeNode::fromArray($q);
        $result = $instance->solve($lhs, $rhs);

        expect($result)->toBe($expected);

    })->with('isSameTreeData');
    test('algo-monster structure', function (string $p, string $q, bool $expected) use ($instance) {
        $lhs = TreeNode::fromArray(array_map('correctTreeValues', str_split($p)));
        $rhs = TreeNode::fromArray(array_map('correctTreeValues', str_split($q)));
        $result = $instance->algoMonster($lhs, $rhs);
        expect($result)->toBe($expected);

    })->with('algoMonsterTreeData');
    it('Should detect cycle.', function () use ($instance) {
        $a = new TreeNode(1);
        $a->left = new TreeNode(2);
        $b = new TreeNode(1);
        $b->left = new TreeNode(2);
        $a->left->right = $b->left;
        $b->left->val = 999;
        $result = $instance->checkCycle($a, $b);
        expect($result)->toBe(false);
    });
});
