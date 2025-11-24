<?php

declare(strict_types=1);

namespace Src\Easy;

class CanMakeArithmeticProgression
{
    /**
     * @param  int[]  $arr
     */
    public function solve(array $arr): bool
    {
        $nums = $arr;
        sort($nums);
        $index = 0;
        $distance = $nums[1] - $nums[0];
        while ($index < count($nums) - 1) {
            if ($distance != $nums[$index + 1] - $nums[$index]) {
                return false;
            }
            $index++;
        }

        return true;
    }
}
