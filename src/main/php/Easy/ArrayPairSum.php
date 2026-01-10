<?php

declare(strict_types=1);

namespace Src\Easy;

class ArrayPairSum
{
    public function solve(array $nums): int
    {
        $total = 0;
        sort($nums);
        for ($i = count($nums) - 1; $i >= 0; $i -= 2) {
            $total += min($nums[$i], $nums[$i - 1]);
        }

        return $total;
    }
}
