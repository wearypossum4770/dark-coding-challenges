<?php

declare(strict_types=1);

namespace Src\Easy;

class ContainsNearbyDuplicate
{
    /**
     * @param  int[]  $nums
     */
    public function solve(array $nums, int $k): bool
    {
        if (empty($nums)) {
            return false;
        }
        $result = [];
        foreach ($nums as $i => $num) {
            if (isset($result[$num]) && $i - $result[$num] <= $k) {
                return true;
            }
            $result[$num] = $i;
        }

        return false;
    }
}
