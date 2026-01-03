<?php

declare(strict_types=1);

namespace Src\Easy;

class RepeatedSubstringPattern
{

    /**
     * @param String $s
     * @return Boolean
     */
    public function solve(string $s): bool
    {
        if (strlen($s) < 2) {
            return false;
        }

        return str_contains(substr(str_repeat($s, 2), 1, -1), $s);
    }
}
