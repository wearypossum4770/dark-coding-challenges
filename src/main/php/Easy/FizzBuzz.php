<?php

declare(strict_types=1);

namespace Src\Easy;

function integerToFizzBuzz(int $num): string
{
    if ($num % 15 === 0) {
        return 'FizzBuzz';
    }
    if ($num % 5 === 0) {
        return 'Buzz';
    }
    if ($num % 3 === 0) {
        return 'Fizz';
    }

    return strval($num);
}

class FizzBuzz
{
    public function solve(int $n): array
    {
        return $this->transformFizzBuzz($n);
    }

    public function transformFizzBuzz(int $n): array
    {
        $target = array_fill(0, $n, '');
        for ($i = 0; $i < $n; $i++) {
            $target[$i] = integerToFizzBuzz($i + 1);
        }

        return $target;
    }
}
