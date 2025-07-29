<?php

declare(strict_types=1);

namespace Src\Easy;

class UglyNumber
{
    public function transformUglyNumber(int $n): bool
    {
        if ($n < 1) {
            return false;
        }
        $primes = [2, 3, 5];
        for ($i = 0; $i < count($primes); $i++) {
            $num = $primes[$i];
            while ($n % $num === 0) {
                $n /= $num;
            }
        }

        return $n === 1;
    }

    public function solve(int $n): bool
    {
        return $this->transformUglyNumber($n);
    }
}
