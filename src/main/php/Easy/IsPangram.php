<?php

declare(strict_types=1);

namespace Src\Easy;

$ALPHA_CHARS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

class IsPangram
{
    private const ALPHA_CHAR_COUNT = 26;

    public function transformIsPangram(string $text): bool
    {
        $cleaned = strtolower($text);
        $alphabet = range('a', 'z');

        foreach ($alphabet as $letter) {
            if (strpos($cleaned, $letter) === false) {
                return false;
            }
        }

        return true;
    }

    public function solve(string $text): bool
    {
        return $this->transformIsPangram($text);
    }
}
