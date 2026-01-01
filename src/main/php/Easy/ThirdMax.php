<?php

declare(strict_types=1);

namespace Src\Easy;

class ThirdMax
{
    /**
     * @param  int[]  $nums
     */
    public function solve(array $nums): int
    {
        $first = PHP_INT_MIN;
        $second = $first;
        $third = $first;
        foreach ($nums as $value) {
            if ($value === $first || $value === $second || $value === $third) {
                continue;
            }
            if ($first < $value) {
                $third = $second;
                $second = $first;
                $first = $value;
            } elseif ($second < $value) {
                $third = $second;
                $second = $value;
            } elseif ($third < $value) {
                $third = $value;
            }
        }

        return $third === PHP_INT_MIN ? $first : $third;
    }
}
