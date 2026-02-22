<?php

declare(strict_types=1);

namespace Src\Easy;

use Src\Helpers\TreeNode;

class TreePathHasSum
{
    public function solve(?TreeNode $root, int $targetSum): bool
    {
        if ($root === null) {
            return false;
        }
        if ($root->left === null && $root->right === null) {
            return $root->val === $targetSum;
        }
        $remaining = $targetSum - $root->val;

        return $this->solve($root->left, $remaining) || $this->solve($root->right, $remaining);
    }
}
