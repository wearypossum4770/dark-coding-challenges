<?php

declare(strict_types=1);

namespace Src\Easy;

class CommonFactors
{
    public function transformCommonFactors(int $a, int $b): array
    {
        $result = [];
        $max = max($a, $b);
        for ($i = 1; $i < $max + 1; $i++) {
            if ($a % $i === 0 && $b % $i === 0) {
                $result[] = $i;
            }
        }

        return $result;
    }

    public function solve(int $a, int $b): int
    {
        return count($this->transformCommonFactors($a, $b));
    }
}
