<?php

declare(strict_types=1);

namespace Src\Easy;

class SingleNumber
{
    public function transformSingleNumber(array $nums): int
    {
        $result = 0;
        foreach ($nums as $val) {
            $result ^= $val;
        }

        return $result;
    }

    public function solve(array $n): int
    {
        return $this->transformSingleNumber($n);
    }
}
