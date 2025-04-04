<?php

declare(strict_types=1);

namespace Src\Easy;

class ReverseString
{
    public function transformReverseString(array &$s): void
    {
        $left = 0;
        $right = count($s) - 1;
        while ($left < $right) {
            [$s[$left], $s[$right]] = [$s[$right], $s[$left]];
            $left++;
            $right--;
        }
    }

    public function solve(array &$s): void
    {
        $this->transformReverseString($s);
    }
}
