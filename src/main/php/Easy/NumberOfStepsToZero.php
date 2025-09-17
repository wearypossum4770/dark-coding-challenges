<?php

declare(strict_types=1);

namespace Src\Easy;

class NumberOfStepsToZero
{
    public function transformNumberOfStepsToZero(int $num): int
    {
        $steps = 0;
        while ($num > 0) {
            if ($num % 2 == 0) {
                $num /= 2;
            } else {
                $num--;
            }
            $steps++;
        }

        return $steps;
    }

    public function solve(int $n): int
    {
        return $this->transformNumberOfStepsToZero($n);
    }
}
