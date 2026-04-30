<?php

declare(strict_types=1);

namespace Src\Easy;

use Src\Helpers\TreeNode;

class MinimumDepthBinaryTree
{
    public function minDepth(?TreeNode $root): int
    {
        if ($root === null) {
            return 0;
        }
        $left = $root->left;
        $right = $root->right;
        if ($left === null && $right === null) {
            return 1;
        }
        if ($left === null) {
            return 1 + $this->minDepth($right);
        }
        if ($right === null) {
            return 1 + $this->minDepth($left);
        }

        return 1 + min($this->minDepth($left), $this->minDepth($right));
    }
}
