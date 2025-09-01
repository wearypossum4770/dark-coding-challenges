<?php

declare(strict_types=1);

namespace Src\Easy;

class FindMaxConsecutiveOnes
{
    public function transformFindMaxConsecutiveOnes(array $nums): int
    {
        $count = 0;
        $max = 0;
        foreach ($nums as $_ => $value) {
            if ($max < $count) {
                $max = $count;
            }
            if ($value === 1) {
                $count++;
            } else {

                $count = 0;
            }
        }

        return max($count, $max);
    }

    public function solve(array $nums): int
    {
        return $this->transformFindMaxConsecutiveOnes($nums);
    }
}
