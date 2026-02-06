<?php

declare(strict_types=1);

namespace Src\Easy;

class SmallestEvenMultiple
{
    public function solve(int $n): int
    {
        if ($n % 2 !== 0) {
            return $n * 2;
        }

        return $n;
    }
}
