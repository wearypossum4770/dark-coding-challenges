<?php

declare(strict_types=1);

namespace Src\Easy;

class NumIdenticalPairs
{
    /**
     * @param  int[]  $nums
     */
    public function transformNumIdenticalPairs(array $nums): int
    {
        $result = 0;
        $left = 0;
        while ($left < count($nums)) {
            $right = $left + 1;
            while ($right < count($nums)) {
                if ($nums[$left] === $nums[$right]) {
                    $result++;
                }
                $right++;
            }
            $left++;
        }

        return $result;
    }

    public function solve(array $nums): int
    {
        return $this->transformNumIdenticalPairs($nums);
    }
}
