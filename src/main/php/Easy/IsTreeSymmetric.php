<?php

declare(strict_types=1);

namespace Src\Easy;

use Src\Helpers\TreeNode;

function checkMirror(?TreeNode $left, ?TreeNode $right): bool
{
    if ($left === null && $right === null) {
        return true;
    }
    if ($left === null || $right === null) {
        return false;
    }

    return $left->val === $right->val && checkMirror($left->left, $right->right) && checkMirror($left->right, $right->left);

}
class IsTreeSymmetric
{
    public function solve(?TreeNode $root): bool
    {
        if ($root === null) {
            return true;
        }

        return checkMirror($root->left, $root->right);
    }
}
