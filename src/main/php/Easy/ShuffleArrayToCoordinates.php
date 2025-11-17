<?php

declare(strict_types=1);

namespace Src\Easy;

class ShuffleArrayToCoordinates
{
    /**
     * @param  int[]  $nums
     * @return int[]
     */
    public function solve(array $nums, int $n): array
    {
        $result = array_fill(0, count($nums), 0);
        for ($i = 0; $i < $n; $i++) {
            $result[2 * $i] = $nums[$i];
            $result[2 * $i + 1] = $nums[$i + $n];
        }

        return $result;

    }
}
