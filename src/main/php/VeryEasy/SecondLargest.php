<?php

declare(strict_types=1);

namespace Src\VeryEasy;

class SecondLargest
{
    public function solve(array $nums): int
    {
        $first = PHP_INT_MIN;
        $second = PHP_INT_MIN;
        foreach ($nums as $num) {
            if ($first === $num) {
                continue;
            }
            if ($first < $num) {
                $second = $first;
                $first = $num;
            } elseif ($second < $num && $first > $second) {
                $second = $num;
            }
        }

        return $second;
    }
}
