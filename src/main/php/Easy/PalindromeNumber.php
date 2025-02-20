<?php

declare(strict_types=1);

namespace Src\Easy;

class PalindromeNumber
{
    public function checkPalindrome(int $number): bool
    {
        if ($number < 0) {
            return false;
        }
        $value = strval($number);
        $right = strlen($value) - 1;
        for ($left = 0; $left < strlen($value) / 2; $left++) {
            if ($value[$left] != $value[$right]) {
                return false;
            }
            $right -= 1;
        }

        return true;
    }
}
