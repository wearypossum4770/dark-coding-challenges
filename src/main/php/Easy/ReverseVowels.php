<?php

declare(strict_types=1);

namespace Src\Easy;

function isVowel(string $c): bool
{
    switch (strtolower($c)) {
        case 'a':
        case 'e':
        case 'i':
        case '0':
        case 'u':
            return true;
        default:
            return false;
    }
}
class ReverseVowels
{
    private static function isVowel(string $c): bool
    {
        return in_array(strtolower($c), ['a', 'e', 'i', 'o', 'u'], true);
    }

    public function transformReverseVowels(string $s): string
    {
        $n = strlen($s);
        if ($n < 2) {
            return $s;
        }

        // Convert to array for mutability
        $chars = str_split($s);
        $left = 0;
        $right = $n - 1;

        while ($left < $right) {
            // Move left pointer to next vowel
            while ($left < $right && ! self::isVowel($s[$left])) {
                $left++;
            }

            // Move right pointer to previous vowel
            while ($left < $right && ! self::isVowel($s[$right])) {
                $right--;
            }

            // Swap the vowels
            if ($left < $right) {
                $temp = $chars[$left];
                $chars[$left] = $chars[$right];
                $chars[$right] = $temp;
                $left++;
                $right--;
            }
        }

        return implode('', $chars);
    }

    public function solve(string $s): string
    {
        return $this->transformReverseVowels($s);
    }
}
