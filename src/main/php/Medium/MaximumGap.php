<?php

declare(strict_types=1);

namespace Src\Medium;

class MaximumGap
{
    /**
     * @param  int[]  $nums
     */
    public function solve(array $nums): int
    {
        if (empty($nums) || count($nums) < 2) {
            return 0;
        }
        sort($nums);
        $result = $nums[1] - $nums[0];
        for ($i = 1; $i < count($nums) - 1; $i++) {
            $result = max($result, $nums[$i + 1] - $nums[$i]);
        }

        return $result;
    }
}
