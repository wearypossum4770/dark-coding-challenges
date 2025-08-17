<?php

declare(strict_types=1);

namespace Src\Easy;

class CheckPerfectNumber
{
    public function calculatePerfectNumber(int $n): int
    {
        if ($n <= 1) {
            return 0;
        }

        $total = 1;
        $root = (int) sqrt($n);

        for ($i = 2; $i <= $root; $i++) {
            if ($n % $i === 0) {
                $total += $i;
                $factor = (int) ($n / $i);
                if ($factor !== $i) {
                    $total += $factor;
                }
            }
        }

        return $total;
    }

    public function checkPerfectNumber(int $n): bool
    {
        if ($n <= 1) {
            return false;
        }

        return $n === $this->calculatePerfectNumber($n);
    }

    public function classifyPerfectNumber(int $n): string
    {
        if ($n <= 1) {
            return 'deficient';
        }

        $sum = $this->calculatePerfectNumber($n);
        if ($n < $sum) {
            return 'abundant';
        }
        if ($n > $sum) {
            return 'deficient';
        }

        return 'perfect';
    }
}
