<?php

declare(strict_types=1);

namespace Src\Medium;

class ReverseInteger
{
    public function transformReverseInteger(int $x): int
    {
        $res = 0;
        $sign = $x >= 0 ? 1 : -1;
        $x = abs($x);
        while ($x != 0) {
            $res = $res * 10 + $x % 10;
            $x = intdiv($x, 10);

        }
        if ($res > 0x7FFFFFFF || $res < -0x80000000) {
            return 0;
        }

        return $res * $sign;

    }

    public function solve(int $n): array
    {
        return $this->transformReverseInteger($n);
    }
}
