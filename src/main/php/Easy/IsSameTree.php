<?php

declare(strict_types=1);

namespace Src\Easy;

use Src\Helpers\TreeNode;

class IsSameTree
{
    public function checkCycle(?TreeNode $p, ?TreeNode $q): bool
    {
        return $this->algoMonster($p, $q);
    }

    public function algoMonster(?TreeNode $p, ?TreeNode $q): bool
    {
        if ($p === null && $q === null) {
            return true;
        }
        if ($p === null || $q === null) {
            return false;
        }
        if ($p->val !== $q->val) {
            return false;
        }

        return $this->algoMonster($p->left, $q->left) && $this->algoMonster($p->right, $q->right);
    }

    public function solve(?TreeNode $p, ?TreeNode $q): bool
    {
        return $this->algoMonster($p, $q);
    }
}
