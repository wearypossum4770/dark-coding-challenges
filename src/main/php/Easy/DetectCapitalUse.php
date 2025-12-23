<?php

declare(strict_types=1);

namespace Src\Easy;

class DetectCapitalUse
{
    public function solve(string $word): bool
    {
        $uppercase = 1;
        $lowercase = 1;
        if (ctype_lower($word[0])) {
            return $word === strtolower($word);
        }
        for ($i = 1; $i < strlen($word); $i++) {
            if (ctype_lower($word[$i])) {
                $lowercase++;
            } else {
                $uppercase++;
            }
        }

        return strlen($word) === $uppercase || strlen($word) === $lowercase;
    }
}
