<?php

declare(strict_types=1);

namespace Src\Easy;

use Src\Helpers\TreeNode;

class PreOrderTraversal
{
    /**
     * @return int[]
     */
    public function solve(?TreeNode $root): array
    {
        $result = [];
        if (! isset($root) || $root === null) {
            return $result;
        }
        $stack = [$root];
        while (! empty($stack)) {
            $current = array_pop($stack);
            if ($current !== null) {
                $result[] = $current->val;
            }
            if ($current->right !== null) {
                $stack[] = $current->right;
            }
            if ($current->left !== null) {
                $stack[] = $current->left;
            }
        }

        return $result;
    }
}
