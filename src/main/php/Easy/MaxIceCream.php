<?php

declare(strict_types=1);

namespace Src\Easy;

class MaxIceCream
{
    public function solve(array $costs, int $coins): int
    {
        $cones = 0;
        $remaining = $coins;
        sort($costs);
        foreach ($costs as $cost) {
            if ($cost <= $remaining) {
                $remaining -= $cost;
                $cones++;
            }
        }

        return $cones;
    }
}
