<?php

declare(strict_types=1);

namespace Src\Easy;

class FindErrorNums
{
    /**
     * @param  int[]  $nums
     * @return int[]
     */
    public function solve(array $nums): array
    {
        $result = array_fill(0, count($nums), 0);
        $target = [0, 0];
        for ($i = 0; $i < count($nums); $i++) {
            if ($result[$nums[$i] - 1] > 0) {
                $target[0] = $nums[$i];
            } else {
                $result[$nums[$i] - 1] = $nums[$i];
            }
        }
        for ($i = 0; $i < count($result); $i++) {
            if ($result[$i] === 0) {
                $target[1] = $i + 1;

                return $target;
            }
        }

        return $target;
    }
}
