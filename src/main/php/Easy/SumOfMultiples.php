<?php

declare(strict_types=1);

namespace Src\Easy;

class SumOfMultiples
{
    public function solve(int $n): int
    {
        $count = 0;
        for ($i = 0; $i < $n + 1; $i++) {
            if ($i % 3 === 0 || $i % 5 === 0 || $i % 7 === 0) {
                $count += $i;
            }
        }

        return $count;
    }
}
