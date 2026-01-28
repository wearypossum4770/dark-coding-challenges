<?php

declare(strict_types=1);

namespace Src\Easy;
use Src\Helpers\TreeNode;
class SumOfLeftLeaves
{
    /**
     * @param TreeNode $root
     * @return Integer
     */
    public function solve(?TreeNode $root): int
    {
			$count = 0;
			if($root === null) return $count;
			$stack = [[$root, false]];
			while(!empty($stack)) {
				[$current, $isLeft] = array_pop($stack);
				if($current -> left === null && $current -> right === null && $isLeft) {
					$count += $current -> val;
				}
				if($current-> left !== null) $stack[] = [$current -> left, true];
				if($current-> right !== null) $stack[] =[ $current -> right, false];
			}
			return $count;
    }
}
