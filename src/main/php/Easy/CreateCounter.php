<?php

declare(strict_types=1);

namespace Src\Easy;

class CreateCounter
{
    public function captureCounter(array &$nums, int $i, callable $counter)
    {
        $nums[$i] = $counter();
    }

    public function createCounter(int $n): callable
    {
        $count = $n;
        $increment = function () use (&$count): int {
            $curr = $count;
            $count++;

            return $curr;
        };

        return $increment;
    }
}
