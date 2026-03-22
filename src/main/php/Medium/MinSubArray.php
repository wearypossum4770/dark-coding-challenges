<?php

declare(strict_types=1);

namespace Src\Medium;

class MinSubArray
{
    /**
     * @param  int[]  $nums
     */
    public function solve(array $nums, int $p): int
    {
        $total = array_reduce($nums, function ($carry, $current) {
            return $carry + $current;
        }, 0) % $p;

        if ($total === 0) {
            return 0;
        }

        $prefix = 0;
        $result = count($nums);
        $map = [0 => -1];

        foreach ($nums as $key => $value) {
            $prefix = ($prefix + $value) % $p;
            $previous = $map[($prefix - $total + $p) % $p] ?? null;
            if ($previous !== null) {
                $result = min($result, $key - $previous);
            }
            $map[$prefix] = $key;
        }

        return $result === count($nums) ? -1 : $result;
    }
}
