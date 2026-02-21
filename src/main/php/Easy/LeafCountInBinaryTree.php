<?php

declare(strict_types=1);

namespace Src\Easy;

use Src\Helpers\TreeNode;

class LeafCountInBinaryTree
{
    public function solve(?TreeNode $root): int
    {
        if ($root === null) {
            return 0;
        }
        if ($root->left === null && $root->right === null) {
            return 1;
        }

        return $this->solve($root->left) + $this->solve($root->right);
    }
}
