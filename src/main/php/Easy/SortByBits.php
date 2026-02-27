<?php

declare(strict_types=1);

namespace Src\Easy;

class SortByBits
{
    public function bitTable(int $n): array
    {
        $table = array_fill(0, $n, 0);
        foreach ($table as $key => $value) {
            $table[$key] = ($key & 1) + $table[intdiv($key, 2)];
        }

        return $table;
    }

    public function countSetBits(int $n): int
    {
        $count = 0;
        while ($n) {
            $count += $n & 1;
            $n >>= 1;
        }

        return $count;
    }

    /**
     * @param  int[]  $arr
     * @return int[]
     */
    public function solve(array $arr): array
    {
        $result = array_map(fn ($num) => [self::countSetBits($num), $num], $arr);
        usort($result, function ($a, $b) {
            if ($a[0] !== $b[0]) {
                return $a[0] - $b[0];
            }

            return $a[1] - $b[1];
        });

        return array_column($result, 1);
    }
}
