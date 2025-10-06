<?php

declare(strict_types=1);

namespace Src\Easy;

class PascalsTriangle
{
    public function transformPascalsTriangle(int $num): array
    {
        $result = [];
        if ($num < 0) {
            return $result;
        }
        $result[] = [1];
        for ($i = 1; $i < $num; $i++) {
            $row = array_fill(0, $i + 1, 1);
            for ($j = 1; $j < $i; $j++) {
                $row[$j] = $result[$i - 1][$j - 1] + $result[$i - 1][$j];
            }
            $result[] = $row;
        }

        return $result;
    }

    public function solve(int $n): array
    {
        return $this->transformPascalsTriangle($n);
    }
}

$instance = new PascalsTriangle;
echo implode(' ', array_merge(...$instance->solve(5)));
