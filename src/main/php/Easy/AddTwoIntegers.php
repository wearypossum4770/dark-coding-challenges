<?php

declare(strict_types=1);

namespace Src\Easy;

class AddTwoIntegers
{
    public function transformAddTwoIntegers(int $num1, int $num2): int
    {
        return $num1 + $num2;
    }

    public function solve(int $a, int $b): int
    {
        return $this->transformAddTwoIntegers($a, $b);
    }
}
