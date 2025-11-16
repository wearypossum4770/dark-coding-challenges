<?php

declare(strict_types=1);

namespace Src\Medium;

class MaxSubArray
{
    /**
     * @param  int[]  $nums
     */
    public function transformMaxSubArray(array $nums): int
    {
        if (empty($nums)) {
            return 0;
        }
        $max = $nums[0];
        $ending = $nums[0];
        for ($i = 1; $i < count($nums); $i++) {
            $ending = max($ending + $nums[$i], $nums[$i]);
            $max = max($max, $ending);
        }

        return $max;
    }

    public function solve(array $nums): int
    {
        return $this->transformMaxSubArray($nums);
    }
}
