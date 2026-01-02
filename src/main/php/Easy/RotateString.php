<?php

declare(strict_types=1);

namespace Src\Easy;

class RotateString
{
    public function solve(string $s, string $goal): bool
    {
        if (strlen($s) !== strlen($goal)) {
            return false;
        }

        return str_contains(str_repeat($s, 2), $goal);
    }
}
