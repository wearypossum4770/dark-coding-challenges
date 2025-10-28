<?php

declare(strict_types=1);

namespace Src\Easy;

class FindFirstPalindrome
{
    /**
     * @param  string[]  $words
     * @return string
     */
    public function check(string $word): bool
    {
        $left = 0;
        $right = strlen($word) - 1;
        while ($left < $right) {
            if ($word[$left] !== $word[$right]) {
                return false;
            }
            $left++;
            $right--;
        }

        return true;
    }

    public function transformFindFirstPalindrome(array $words): string
    {
        for ($i = 0; $i < count($words); $i++) {
            if ($this->check($words[$i])) {
                return $words[$i];
            }
        }

        return '';
    }

    public function solve(array $words): string
    {
        return $this->transformFindFirstPalindrome($words);
    }
}
