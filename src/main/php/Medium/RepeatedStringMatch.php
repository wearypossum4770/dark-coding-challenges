<?php

declare(strict_types=1);

namespace Src\Medium;

class RepeatedStringMatch
{
    public function solve(string $a, string $b): int
    {
        $repeated = $a;
        $count = 1;
        while (strlen($repeated) < strlen($b)) {
            $repeated .= $a;
            $count++;
        }
        if (str_contains($repeated, $b)) {
            return $count;
        }
        $repeated .= $a;
        if (str_contains($repeated, $b)) {
            return $count + 1;
        }

        return -1;
    }
}
