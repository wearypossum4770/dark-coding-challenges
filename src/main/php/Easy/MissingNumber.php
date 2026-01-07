<?php

declare(strict_types=1);

namespace Src\Easy;

class MissingNumber
{
    /**
     * @param  int[]  $nums
     */
    public function transformMissingNumber(array $nums): int
    {
        return intdiv(count($nums) * (count($nums) + 1), 2) - array_reduce($nums, function ($accum, $curr) {
            return $accum + $curr;
        });

    }

    public function solve(array $nums): int
    {
        return $this->transformMissingNumber($nums);
    }
}
