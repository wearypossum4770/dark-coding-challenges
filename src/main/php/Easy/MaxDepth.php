<?php

declare(strict_types=1);

namespace Src\Easy;

use Src\Helpers\TreeNode;

class MaxDepth
{
    public function solve(?TreeNode $root): int
    {
        if ($root == null) {
            return 0;
        }

        return max($this->solve($root->left), $this->solve($root->right)) + 1;
    }
}
