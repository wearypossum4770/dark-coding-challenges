<?php

declare(strict_types=1);

namespace Src\Easy;

class DifferenceOfSums
{
    public function transformDifferenceOfSums(int $n, int $m): int
    {
        $lhs = 0;
        $rhs = 0;
        for ($i = 1; $i < $n + 1; $i++) {
            if ($i % $m === 0) {
                $rhs += $i;
            } else {
                $lhs += $i;
            }
        }

        return $lhs - $rhs;
    }

    public function solve(int $n, int $m): int
    {
        return $this->transformDifferenceOfSums($n, $m);
    }
}
